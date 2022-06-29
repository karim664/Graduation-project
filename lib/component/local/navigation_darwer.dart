import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import '../../pages/signin_signup_screens/login_screen.dart';
import '../../providers/AppProvider_provider.dart';
import '../../providers/theme_provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AppProvider>(context, listen: true);
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: true);
    Map loggedUserinfo = jsonDecode(SharedPref.getString('loginUserDetail')!);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,25,0,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox(height: 20,),
                   Text(
                      'Welcome,',
                    style: GoogleFonts.robotoMono(
                      fontSize: 22
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                      loggedUserinfo['fullName'],
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.robotoMono(
                        fontSize: 20
                      ),
                  ),
                  Text(
                    loggedUserinfo['email'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.robotoMono(
                      fontSize: 16
                    )
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                  loggedUserinfo['address']
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15)
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.onSecondary
                ),
                onPressed: ()
                {
                  p.logOutChangeState();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()));
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                    'LogOut',
                  style: TextStyle(fontSize: 20,),
                ),


              ),
            ),
          ),
        ],
      ),
    );
  }
}
