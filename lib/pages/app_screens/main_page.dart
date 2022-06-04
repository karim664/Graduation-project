import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/pages/app_screens/requests_screen.dart';
import '../../component/local/navigation_darwer.dart';
import '../../providers/AppProvider_provider.dart';

class MainPage extends StatelessWidget {

  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AppProvider>(context,listen: true);
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: p.title[p.currentIndex] == 'Home' ? null
            : AppBar(
            title:Text(
                p.title[p.currentIndex]
            ),
            automaticallyImplyLeading: true,
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)
                      => const RequestsPage()
                  ),
              );
            },
                icon: const Icon(Icons.request_page))
          ],
        ),
        body: p.pages[p.currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            p.botNavChange(index);
          },
          index: p.currentIndex,
          height: 50,
          buttonBackgroundColor: Theme.of(context).colorScheme.onBackground,
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.secondary,
          animationDuration: const Duration(milliseconds: 700  ),
          items:  [
             Icon(
               Icons.home,
               color: Theme.of(context).colorScheme.onPrimary,
               size: 35,
             ),
             Icon(
               Icons.category,
               color: Theme.of(context).colorScheme.onPrimary,
                size: 35,
             ),
             Icon(
               Icons.favorite,
               color: Theme.of(context).colorScheme.onPrimary,
               size: 35,
             ),
          ],
          ),
      ),
    );
  }
}
