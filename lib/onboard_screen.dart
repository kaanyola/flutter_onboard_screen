import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/img1.png",
      "details":
          "Lorem Ipsum is simply dummy text of\n the prinry's standard dled it\n to make a type specimen book."
    },
    {
      "image": "assets/images/img2.png",
      "details":
          "It has survived not only five centuries,\n b unchanged. It was popularised\n in the 1960s with the release."
    },
    {
      "image": "assets/images/img3.png",
      "details":
          "Of Letraset sheets containing Lorem Ipsum\n PageMaker including versions\n of Lorem Ipsum."
    },
    {
      "image": "assets/images/img4.png",
      "details":
          "It is a long established fact that a reader\n wig s that it hars, as aking it\n look like readable English."
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildUpperScreen(screenWidth, screenHeight),
            buildLowerScreen(screenHeight, screenWidth)
          ],
        ),
      ),
    );
  }

  Expanded buildUpperScreen(double screenWidth, double screenHeight) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.all(screenWidth / 20),
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) => SplashContent(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              image: splashData[index]["image"],
              text: splashData[index]["details"],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildLowerScreen(double screenHeight, double screenWidth) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildDots(),
            Spacer(),
            buildSignupButton(screenHeight, screenWidth),
            SizedBox(
              height: screenHeight / 50,
            ),
            buildContactUsButton(screenHeight, screenWidth),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Container buildContactUsButton(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight / 15,
      width: screenWidth / 1.3,
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(16)),
      child: MaterialButton(
        onPressed: () {},
        child: Center(
            child: Text(
          "Contact Us",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Container buildSignupButton(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight / 15,
      width: screenWidth / 1.3,
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(16)),
      child: MaterialButton(
        onPressed: () {},
        child: Center(
            child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Row buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(splashData.length, (index) => buildDot(index: index)),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.deepOrange : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    this.text,
    this.image,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            "Welcome!",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: screenWidth / 15,
        ),
        Image.asset(
          image,
          width: screenWidth,
          height: screenHeight / 2.5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
