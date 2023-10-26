import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {
      "image": "assets/img/Workout1.png",
      "title": "It's time for lunch",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "Don't miss your lowebody workout",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/img/Workout3.png",
      "title": "Let's add some meals on your b",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/img/Workout1.png",
      "title": "Congratulations, You have finished A..",
      "time": "29 May"
    },
    {
      "image": "assets/img/Workout2.png",
      "title": "It's time for lunch",
      "time": "8 April"
    },
    {
      "image": "assets/img/Workout3.png",
      "title": "Ups, You have missed your Lowebo...",
      "time": "8 April"
    }
  ];
  @override
  Widget build(BuildContext context) {
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
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
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
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          itemBuilder: ((context, index) {
            var nObj = notificationArr[index] as Map? ?? {};
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(nObj["image"].toString(),
                          width: 40, height: 40, fit: BoxFit.cover)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nObj["title"].toString(),
                        style: TextStyle(
                          color: TColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        nObj["time"].toString(),
                        style: TextStyle(
                          color: TColor.gray,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/img/sub_menu.png",
                        width: 15,
                        height: 15,
                        fit: BoxFit.contain,
                      ))
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) {
            return Divider(
              color: TColor.gray.withOpacity(0.5),
              height: 1,
            );
          },
          itemCount: notificationArr.length),
    );
  }
}
