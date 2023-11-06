import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/step_detail_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExercisesStepDetails extends StatefulWidget {
  final Map eObj;
  const ExercisesStepDetails({super.key, required this.eObj});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  List stepArr = [
    {
      "no": "01",
      "title": "Arm",
      "detail": "To make the gestures feel more relax..."
    },
    {
      "no": "02",
      "title": "Toe",
      "detail": "To make the gestures feel more relax..."
    },
    {
      "no": "03",
      "title": "Foot Movement",
      "detail": "To make the gestures feel more relax..."
    },
    {
      "no": "04",
      "title": "Clapping Both Mands",
      "detail": "To make the gestures feel more relax..."
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/img/video_temp.png",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: TColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/img/Play.png",
                        width: 30,
                        height: 30,
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // dynamic name need to set here
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              // static value, not dynamic
              Text(
                "Easy | 300 Calories Burn",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // dynamic name need to set here
              Text(
                "Description",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              // static value, not dynamic
              ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimLines: 2,
                colorClickableText: TColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: '  Read More ...',
                trimExpandedText: '  Read Less ...',
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
                moreStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr.length} Sets",
                      style: TextStyle(color: TColor.gray, fontSize: 12),
                    ),
                  )
                ],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: stepArr.length,
                  itemBuilder: (((context, index) {
                    var sObj = stepArr[index] as Map? ?? {};
                    return StepDetailRow(
                      sObj: sObj,
                      isLast: stepArr.last == sObj,
                    );
                  }))),
              const SizedBox(
                height: 15,
              ),

              // dynamic name need to set here
              Text(
                "Custom Pepetiton",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 150,
                child: CupertinoPicker.builder(
                    itemExtent: 40,
                    selectionOverlay: Container(
                      width: double.maxFinite,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: TColor.gray.withOpacity(0.2),
                                  width: 1),
                              bottom: BorderSide(
                                  color: TColor.gray.withOpacity(0.2),
                                  width: 1))),
                    ),
                    onSelectedItemChanged: (index) {},
                    childCount: 60,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/burn.png",
                            width: 15,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            "  ${(index + 1) * 15} Calories Burn",
                            style: TextStyle(color: TColor.gray, fontSize: 10),
                          ),
                          Text(
                            " ${index + 1}",
                            style: TextStyle(
                                color: TColor.gray,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            " times",
                            style: TextStyle(color: TColor.gray, fontSize: 16),
                          )
                        ],
                      );
                    }),
              ),
              RoundButton(title: "Save", elevation: 0, onPressed: () {}),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
