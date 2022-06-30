import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/models/student_model.dart';
import 'package:signup_demo/pages/signin_signup_screens/signup_screen.dart';
import 'package:signup_demo/providers/notifiers/login_notifier.dart';
import 'package:signup_demo/service/login_service.dart';
import 'package:string_validator/string_validator.dart';
import '../../component/local/local_com.dart';
import '../app_screens/main_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StudentModel student = StudentModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword = false;
  LogInService login = LogInService();

  @override
  Widget build(BuildContext context) {
    LogInNotifier loginNotify = Provider.of<LogInNotifier>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CODE Bold'),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(children: [
                            defaultFormField(
                                label: 'Email Address',
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                vali: (em) {
                                  if (!isEmail(em!)) {
                                    return 'Enter a valid  Email Address';
                                  }
                                  if (em.isEmpty) {
                                    return 'Enter Your Email Address ';
                                  }
                                  return null;
                                },
                                prefix: Icons.email_outlined),
                            defaultFormField(
                              label: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              vali: (ps) {
                                if (ps!.isEmpty) {
                                  return 'Enter your Password';
                                }
                                if (ps.length < 8) {
                                  return 'Password is too short';
                                }
                                return null;
                              },
                              prefix: Icons.lock,
                              obsecure: !isPassword,
                              sufix: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              sufixpressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                            ),
                            defaultButton(
                                pressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await loginNotify
                                        .postLogIn(
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                    )
                                        .then((value) {
                                      Map jsonData = jsonDecode(value.body);

                                      if (value.statusCode == 200) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MainPage()));
                                        SnackBar snackBar = SnackBar(
                                            content: Text(
                                                'Welcome Back  ${jsonData['fullName']} '));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        loginNotify.logInChangeState();
                                        loginNotify.saveStudentInfo(
                                            emailController.text,
                                            passwordController.text);
                                      }
                                    });
                                  }
                                },
                                title: 'Sign in'),
                          ])),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account ',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen()));
                              },
                              child: const Text(
                                'Signup',
                                style: TextStyle(color: Color(0xffE262F3)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
