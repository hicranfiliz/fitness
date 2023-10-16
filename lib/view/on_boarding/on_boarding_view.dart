import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/on_boarding_page.dart';
import 'package:flutter/material.dart';

class onBoardingView extends StatefulWidget {
  const onBoardingView({super.key});

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let's keep burning to achieve your goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/img/on_2.png"
    },
    {
      "title": "Eat Well",
      "subtitle":
          "Let's start a healty lifestyle with us, we can determine your diet every day. Healty eating is fun",
      "image": "assets/img/on_3.png"
    },
    {
      "title": "Improve Sleep\nQuality",
      "subtitle":
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "image": "assets/img/on_4.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};

                return OnBoardingPage(pObj: pObj);
              })
        ],
      ),
    );
  }
}
