import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme()
{
  return ThemeData(
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xff7566F7),
              statusBarIconBrightness: Brightness.light
          ),
          backgroundColor: Color(0xff7566F7),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
              color: Colors.black
          )
      ),
      scaffoldBackgroundColor: const Color(0xffe6e6e6),
      iconTheme: const IconThemeData(
        color: Colors.black
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 14,
            color: Colors.black
        ),
        bodyText2: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        headline1: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor:  Color(0xffe6e6e6),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // book color
          primary: const Color(0xffD3D3EF),
          // book color
          onSecondary: const Color(0xffD3D3EF) ,
          // nav bar main color
          secondary: const Color(0xff7566F7),
          // nav bar background
          background: const Color(0xffe6e6e6),
          // nav bar icon background
          onBackground: const Color(0xffE262F3),
          // nav bar icon / text
          onPrimary: const Color(0xff312C7E)

      )
  );
}

ThemeData darkTheme()
{
  return ThemeData(
      appBarTheme: const AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xff140D5B),
              statusBarIconBrightness: Brightness.light
          ),
          backgroundColor: Color(0xff140D5B),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
              color: Colors.white
          )
      ),
      scaffoldBackgroundColor: const Color(0xff312C7E),
      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 14,
              color: Colors.white
          ),
          bodyText2: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          headline1: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor:  Color(0xff312C7E),

      ),
      colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      // book color
      primary: const Color(0xff423493 ),
      // book color
      onSecondary: const Color(0xffE262F3),
      // nav bar main color
      secondary: const  Color(0xff140D5B),
      // nav bar background color
      background: const Color(0xff312C7E),
      // nav bar icon background color
      onBackground: const Color(0xff6E5EF5),
      // nav bar icon color/ text color
      onPrimary:  Colors.white70,

    )
  );
}