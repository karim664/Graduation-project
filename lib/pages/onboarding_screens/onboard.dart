import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_demo/network/network_local/shared_pref.dart';
import 'package:signup_demo/pages/signin_signup_screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardModel {
  String image = '';
  String title = '';
  String body = '';

  OnboardModel({required this.image, required this.title, required this.body});
}

List<OnboardModel> onBoardList = [
  OnboardModel(
      image: 'assets/images/onboard1.png',
      title: 'Find Your Desired Book',
      body: 'Find your wanted book from our library '),
  OnboardModel(
      image: 'assets/images/onboard2.png',
      title: 'Request your Book for Borrowing',
      body:
          'After you find your Wanted Book ask to borrow it and we reply shortly'),
  OnboardModel(
      image: 'assets/images/onboard3.png',
      title: 'Come and Pay us a visit😊',
      body:
          'after your Request being processed you can visit our library in person to receive your book'),
];

class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();
  bool isLast = false;

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return buildOnBoardItem(onBoardList[index]);
              },
              onPageChanged: (int index) {
                if (index == onBoardList.length - 1) {
                  isLast = true;
                } else {
                  isLast = false;
                }
              },
              controller: boardController,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
            child: Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 2,
                    ),
                    count: onBoardList.length),
                TextButton(
                  onPressed: () {
                    SharedPref.setBoolean('isBoardLoaded', true);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      SharedPref.setBoolean('isBoardLoaded', true);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false,
                      );
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnBoardItem(OnboardModel model) {
    return Column(
      children: [
        Container(
          height: 580,
          child: Image(
              image: AssetImage(
                model.image,
              ),
              fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.title,
                style: GoogleFonts.robotoMono(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.body,
                style: GoogleFonts.robotoMono(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
