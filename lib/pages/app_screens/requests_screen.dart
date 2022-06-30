import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/request_model.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:signup_demo/providers/notifiers/books_notifier.dart';
import '../../component/local/local_com.dart';
import '../../providers/notifiers/request_notifier.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
bool isGetRequestLoaded = false ;
Map logInInfo = jsonDecode(SharedPref.getString('loginUserDetail')!);

  @override
  void initState() {
    isGetRequestLoaded = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!isGetRequestLoaded)
      {

        RequestNotifier request = Provider.of<RequestNotifier>(context);
        request.getRequestsByNatId('${logInInfo['nationalId']}');
        isGetRequestLoaded = true;
      }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    RequestNotifier request = Provider.of<RequestNotifier>(context);
    BooksNotifier book = Provider.of<BooksNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Requests'),
        ),
        body:request.requestsByNatId.isEmpty?Center(
          child: Text(
              'You Have No Requests Yet',
            style: GoogleFonts.robotoMono(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary
            ),
          ),
        ):ListView.separated(
            itemBuilder: (context, index) {
               return ConditionalBuilder(
                condition: request.requestsByNatId.isEmpty,
                builder: (context)
                {
                  book.getBookCategoryByBookId(request.requests[index].bookId!);
                  return const Center(child: Text('No Requests'));
                },
                fallback: (context)
                {
                  return requestItem(request.requestsByNatId[index], context, request, book.bookCategory);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 4,
              );
            },
            itemCount: request.requestsByNatId.length));
  }

  Widget requestItem(RequestModel requestModel, context, RequestNotifier request, Map bookCategory) {
  DateTime requestData = DateTime.parse(requestModel.requestDate!);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
         color: Theme.of(context).colorScheme.primary
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage('assets/images/book.png'),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requestModel.bookTitle!.isEmpty ? 'null': requestModel.bookTitle!,
                      style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                     Text(
                      '${bookCategory['name']}',
                      style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                      requestModel.status == null ? 'null' :  'Status: ${requestModel.status}',
                      style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                      'ordered at: '
                      '${requestData.hour}:'
                      '${requestData.minute}'
                      ' - '
                      '${requestData.day}/'
                      '${requestData.month}/'
                      '${requestData.year}',
                      style: GoogleFonts.robotoMono(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: defaultButton(
                            pressed: ()
                            {
                              request.cancelRequest(requestModel.requestId!).then((value)
                              {
                                request.getRequestsByNatId('${logInInfo['nationalId']}');
                              });
                            },
                            title:
                              'Cancel Request',
                            ),
                          ),
                        )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
