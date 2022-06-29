import 'package:flutter/material.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/pages/app_screens/main_page.dart';
import 'package:signup_demo/pages/onboarding_screens/onboard.dart';
import 'package:signup_demo/pages/signin_signup_screens/login_screen.dart';
import 'package:signup_demo/providers/AppProvider_provider.dart';
import 'package:signup_demo/providers/notifiers/Student_notifier.dart';
import 'package:signup_demo/providers/notifiers/books_notifier.dart';
import 'package:signup_demo/providers/notifiers/categories_notifier.dart';
import 'package:signup_demo/providers/notifiers/favorites_notifier.dart';
import 'package:signup_demo/providers/notifiers/login_notifier.dart';
import 'package:signup_demo/providers/notifiers/request_notifier.dart';
import 'package:signup_demo/providers/notifiers/subcategory_notifier.dart';
import 'package:signup_demo/providers/theme_provider.dart';
import 'component/local/theme.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create:(context) => AppProvider(),
        ),
          ChangeNotifierProvider(
          create:(context) => ThemeProvider(),
        ),
          ChangeNotifierProvider(
            create:(context) => CategoryNotifier(),
          ),
          ChangeNotifierProvider(
            create:(context) => BooksNotifier()
          ),
          ChangeNotifierProvider(
            create:(context) => LogInNotifier()
          ),
          ChangeNotifierProvider(
            create:(context) => RequestNotifier()
          ),
          ChangeNotifierProvider(
            create:(context) => StudentNotifier()
          ),
          ChangeNotifierProvider(
              create:(context) => SubCategoriesNotifier()
          ),
          ChangeNotifierProvider(
              create:(context) => FavoritesNotifier()
          ),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themes = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme() ,
        darkTheme: darkTheme(),
        themeMode:themes.getThemeMode() == true  ? ThemeMode.light : ThemeMode.dark,
        home: SharedPref.getBoolean('isBoardLoaded') != true
            ? OnBoardingScreen() : SharedPref.getBoolean('login') == true
            ? const MainPage() : const LoginScreen()

      );

  }
}