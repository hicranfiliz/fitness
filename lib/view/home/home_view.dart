import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40),
      ];

  List waterArr = [
    {"title": "6am - 8am", "subtitle": "600ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "4pm - now", "subtitle": "900ml"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            TColor.primaryColor2.withOpacity(0.4),
            TColor.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: TColor.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: TColor.gray, fontSize: 12),
                      ),
                      Text(
                        "Jane Black",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/img/notification_active.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ))
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                height: media.width * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: TColor.primaryG),
                    borderRadius: BorderRadius.circular(media.width * 0.075)),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    "assets/img/bg_dots.png",
                    height: media.width * 0.4,
                    width: double.maxFinite,
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BMI (Body Mass Index)",
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "You have a normal weight",
                              style: TextStyle(
                                  color: TColor.white.withOpacity(0.7),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                            SizedBox(
                              width: 120,
                              height: 35,
                              child: RoundButton(
                                  title: "View More",
                                  type: RoundButtonType.bgSGradient,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  onPressed: () {}),
                            )
                          ],
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(PieChartData(
                            pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, PieTouchResponse) {}),
                            startDegreeOffset: 250,
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 1,
                            centerSpaceRadius: 0,
                            sections: showingSections(),
                          )),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.primaryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Target",
                      style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 80,
                      height: 25,
                      child: RoundButton(
                          title: "Check",
                          type: RoundButtonType.bgGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Text(
                "Activity Status",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.02,
              ),
              ClipRRect(
                child: Container(
                  height: media.width * 0.4,
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                      color: TColor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25)),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Heart Rate",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                        colors: TColor.primaryG,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    .createShader(Rect.fromLTRB(
                                        0, 0, bounds.width, bounds.height));
                              },
                              child: Text(
                                "78 BPM",
                                style: TextStyle(
                                    color: TColor.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  const FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      strokeColor: TColor.secondaryColor1,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: TColor.secondaryColor1,
                              tooltipRoundedRadius: 20,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.x.toInt()} mins ago",
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          maxY: 130,
                          titlesData: const FlTitlesData(show: false),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: media.width * 0.95,
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                      child: Row(
                        children: [
                          SimpleAnimationProgressBar(
                            height: media.width * 0.85,
                            width: media.width * 0.07,
                            backgroundColor: Colors.grey.shade100,
                            foregrondColor: Colors.purple,
                            ratio: 0.5,
                            direction: Axis.vertical,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(15),
                            gradientColor: LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Intake",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          colors: TColor.primaryG,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  "4 Liters",
                                  style: TextStyle(
                                      color: TColor.white.withOpacity(0.7),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Real Time Updates",
                                style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 12,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: waterArr.map((wObj) {
                                  var isLast = wObj == waterArr.last;
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  color: TColor.secondaryColor1
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                            if (!isLast)
                                              DottedDashedLine(
                                                  height: media.width * 0.078,
                                                  width: 0,
                                                  dashColor: TColor
                                                      .secondaryColor1
                                                      .withOpacity(0.5),
                                                  axis: Axis.vertical)
                                          ]),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            wObj["title"].toString(),
                                            style: TextStyle(
                                              color: TColor.gray,
                                              fontSize: 10,
                                            ),
                                          ),
                                          ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (bounds) {
                                              return LinearGradient(
                                                      colors: TColor.secondaryG,
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight)
                                                  .createShader(Rect.fromLTRB(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height));
                                            },
                                            child: Text(
                                              wObj["subtitle"].toString(),
                                              style: TextStyle(
                                                  color: TColor.white
                                                      .withOpacity(0.7),
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }).toList(),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.05,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: media.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Container(
                        height: media.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
            ],
          ),
        )),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      var color0 = TColor.secondaryColor1;

      switch (i) {
        case 0:
          return PieChartSectionData(
              color: color0,
              value: 33,
              title: '',
              radius: 55,
              titlePositionPercentageOffset: 0.55,
              badgeWidget: const Text(
                "20,1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ));
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 75,
            title: '',
            radius: 45,
            titlePositionPercentageOffset: 0.55,
          );
        default:
          throw Error();
      }
    });
  }
}
