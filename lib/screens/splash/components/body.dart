import 'package:flutter/material.dart';
import 'package:codelab/constants.dart';
import 'package:codelab/screens/splash/components/splash_content.dart';
import 'package:codelab/size_config.dart';
import '../../../components/default_button.dart';
import '../sign_in/sign_in_screen.dart';

class Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "keyText": "Student Project Submission",
      "text":
          "Students can upload their projects over here for submission which can be verified by the faculty",
      "image": "assets/images/splash_01.png",
    },
    {
      "keyText": "Teacher Can Verify Submissions",
      "text":
          "The work/project can be submitted by the students can be verified by the faculty",
      "image": "assets/images/splash_02.png"
    },
    {
      "keyText": "Welcome to CODELAB",
      "text": "Now start your journey with us",
      "image": "assets/images/splash_03.png"
    },
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  keyText: splashData[index]["keyText"],
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Color.fromARGB(255, 0, 174, 255)
            : Color.fromARGB(255, 0, 176, 255),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
