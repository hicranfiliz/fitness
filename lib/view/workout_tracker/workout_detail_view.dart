import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/icon_title_next_row.dart';
import 'package:fitness/common_widget/latest_activity_row.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/upcoming_workout_row.dart';
import 'package:fitness/common_widget/what_train_row.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map dObj;
  const WorkoutDetailView({super.key, required this.dObj});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  List latestArr = [
    {
      "image": "assets/img/Workout1.png",
      "title": "Fullbody Workout",
      "time": "Today, 03:00pm"
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "Upperbody Workout",
      "time": "June 05, 02:00pm"
    },
  ];

  List whatArr = [
    {
      "image": "assets/img/what_1.png",
      "title": "Fullbody Workout",
      "exercises": "11 Exercises",
      "time": "32mins"
    },
    {
      "image": "assets/img/what_2.png",
      "title": "Lowerbody Workout",
      "exercises": "12 Exercises",
      "time": "40mins"
    },
    {
      "image": "assets/img/what_3.png",
      "title": "AB Workout",
      "exercises": "14 Exercises",
      "time": "20mins"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
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
                      "assets/img/black_btn.png",
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
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                elevation: 0,
                leadingWidth: 0,
                leading: Container(),
                expandedHeight: media.width * 0.5,
                flexibleSpace: Container(
                  height: media.width * 0.5,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ];
          }),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                color: TColor.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                          color: TColor.gray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dObj["title"].toString(),
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "${widget.dObj["exercises"].toString()} | ${widget.dObj["time"].toString()} | 320 Calories Burn",
                                style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/img/fav.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    IconTitleNextRow(
                        icon: "assets/img/time.png",
                        title: "Schedule Workout",
                        time: "5/27, 09:00 AM",
                        color: TColor.primaryColor2.withOpacity(0.3),
                        onPressed: () {}),
                    SizedBox(
                      height: media.width * 0.02,
                    ),

                    IconTitleNextRow(
                        icon: "assets/img/difficulity.png",
                        title: "Difficulity",
                        time: "Beginner",
                        color: TColor.secondaryColor2.withOpacity(0.3),
                        onPressed: () {}),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    // ListView.builder(
                    //   padding: EdgeInsets.zero,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemCount: latestArr.length,
                    //   itemBuilder: (context, index) {
                    //     var wObj = latestArr[index] as Map? ?? {};
                    //     return UpcomingWorkoutRow(wObj: wObj);
                    //   },
                    // ),
                    // SizedBox(
                    //   height: media.width * 0.05,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "What Do You Want to Train",
                    //       style: TextStyle(
                    //           color: TColor.black,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w700),
                    //     ),
                    //   ],
                    // ),
                    // ListView.builder(
                    //   padding: EdgeInsets.zero,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemCount: whatArr.length,
                    //   itemBuilder: (context, index) {
                    //     var wObj = whatArr[index] as Map? ?? {};
                    //     return WhatTrainRow(wObj: wObj);
                    //   },
                    // ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
