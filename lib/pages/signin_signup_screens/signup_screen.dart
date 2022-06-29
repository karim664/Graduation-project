import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/pages/signin_signup_screens/signup_confirm_page.dart';
import 'package:signup_demo/providers/notifiers/Student_notifier.dart';
import '../../component/local/local_com.dart';
import 'package:string_validator/string_validator.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisible = true;

  var formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController natIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    StudentNotifier student = Provider.of<StudentNotifier>(context);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                       Text(
                        'Hello',
                        style: GoogleFonts.robotoMono(
                          fontSize: 50.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultFormField(
                                label: 'first name',
                                keyboardType: TextInputType.name,
                                controller: firstNameController,
                                vali: (userName) {
                                  if (userName!.isEmpty) {
                                    return 'Please Enter Your Name';
                                  }
                                  if (userName.length > 8) {
                                    return 'only 8 character allowed';
                                  }
                                  return null;
                                },
                                prefix: Icons.person,
                                sub: (value) {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ConfirmPage()));
                                  }
                                }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: defaultFormField(
                                label: 'last name',
                                keyboardType: TextInputType.name,
                                controller: lastNameController,
                                vali: (lastName) {
                                  if (lastName!.isEmpty) {
                                    return 'Please Enter Your last Name';
                                  }
                                  if (lastName.length > 8) {
                                    return 'only 8 character allowed';
                                  }
                                  return null;
                                },
                                prefix: Icons.person,
                                sub: (value) {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ConfirmPage()));
                                  }
                                }),
                          ),
                        ],
                      ),
                      defaultFormField(
                          label: 'phone',
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          vali: (phone) {
                            if (phone!.isEmpty) {
                              return 'Please Enter Your Phone';
                            }
                            if (phone.length != 11) {
                              return 'Please Enter a valid phone number';
                            }
                            return null;
                          },
                          prefix: Icons.phone,
                          sub: (value) {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConfirmPage()));
                            }
                          }),
                      defaultFormField(
                          hint: 'Enter your Address',
                          label: 'Address',
                          vali: (address) {
                            if (address!.isEmpty) {
                              return 'Enter you address';
                            }
                            if (address.length < 4) {
                              return 'your address can\'t be less than 5 characters';
                            }
                          },
                          keyboardType: TextInputType.streetAddress,
                          controller: addressController,
                          prefix: Icons.streetview_rounded,
                          sub: (value) {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConfirmPage()));
                            }
                          }),
                      defaultFormField(
                          hint: 'Enter a Strong Password',
                          label: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          obsecure: isVisible,
                          vali: (password) {
                            if (password!.isEmpty) {
                              return 'Please Enter a Password';
                            }
                            if (password.length < 8) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          sufix: !isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          sufixpressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          validateText: 'password can\'t be empty',
                          prefix: Icons.lock,
                          sub: (value) {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConfirmPage()));
                            }
                          }),
                      defaultFormField(
                          hint: 'Confirm your Password',
                          label: 'Confirm Password',
                          keyboardType: TextInputType.visiblePassword,
                          controller: confirmController,
                          prefix: Icons.lock,
                          obsecure: isVisible,
                          vali: (confirm) {
                            if (confirm!.isEmpty) {
                              return 'Please Enter your Password';
                            }
                            if (confirmController.text !=
                                passwordController.text) {
                              return 'Password Is not a Match';
                            }
                            return null;
                          },
                          sub: (value) {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConfirmPage()));
                            }
                          }),
                      defaultFormField(
                          hint: 'Enter your Email Address',
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          vali: (email) {
                            if (email!.isEmpty) {
                              return 'Email field can\'t Empty';
                            }
                            if (!isEmail(email)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                          sub: (value) {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConfirmPage()));
                            }
                          }),
                      defaultFormField(
                          hint: 'Enter your National ID Number',
                          label: 'National ID',
                          keyboardType: TextInputType.phone,
                          controller: natIdController,
                          vali: (id) {
                            if (id!.isEmpty) {
                              return 'Please Enter Your National id number';
                            }
                            if (id.startsWith('0') == true) {
                              return 'National Id can\'t start with 0';
                            }

                            if (id.length < 14 || id.length > 14) {
                              return 'National id number must contain 14 digit';
                            }
                            if (!isNumeric(id)) {
                              return 'Please Enter a valid National id number';
                            }

                            return null;
                          },
                          prefix: Icons.video_label,
                          sub: (value) {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConfirmPage()));
                            }
                          }),
                      defaultButton(
                          title: 'Sign up',
                          pressed: () async {
                            if (formKey.currentState!.validate()) {
                              student
                                  .postStudent(
                                      firstNameController.text + ' ' +lastNameController.text,
                                      phoneController.text,
                                      passwordController.text,
                                      natIdController.text,
                                      emailController.text,
                                      addressController.text)
                                  .then((value) {
                                if (value.statusCode == 200) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ConfirmPage()));
                                  SnackBar snackBar = SnackBar(
                                    duration: const Duration(milliseconds: 3000),
                                      content: Text(
                                          '${firstNameController.text} your data has been sent and being reviewed by the administrator please be patient'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                                else if (value.statusCode == 400) {
                                  SnackBar snackBar = const SnackBar(
                                      content: Text(
                                          'Your Email or National Id already existed'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  SnackBar snackBar = const SnackBar(
                                      content: Text(
                                          'Something went wrong please check your data and try again'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already having an account',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: const Text(
                                'sign in',
                                style: TextStyle(color:Color(0xffE262F3)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
