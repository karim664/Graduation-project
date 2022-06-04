import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/component/local/book.dart';
import 'package:signup_demo/models/student_model.dart';
import 'package:signup_demo/providers/AppProvider_provider.dart';
import '../../service/login_service.dart';

class Favorites extends StatelessWidget {
  LogInService logService = LogInService();
  StudentModel st = StudentModel();

  Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AppProvider>(context);
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2 ,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1 / 1.03,
          children:
        List.generate(p.favBooks.length , (index) => bookItemBuilder(context, p.favBooks[index], index, ),)
      )
    );
  }
}
