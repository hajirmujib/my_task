import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_task/app/constants/assets_path.dart';
import 'package:my_task/app/constants/fonts.dart';
import 'package:my_task/app/constants/pallete.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../calendar/views/calendar_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.primary,
        onPressed: () {},
        child: Center(
            child: Image.asset(
          AssetName.iconMoon,
          width: 22,
          height: 22,
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // appBar: AppBar(
      //   title: Text('HomeView'),
      //   centerTitle: true,
      // ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetName.imgBg2,
                ),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 10),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History Sleep",
                    style: TextStyle(
                        fontFamily: AppFontStyle.hindMed,
                        fontSize: 24,
                        // fontWeight: FontWeight.bold,
                        color: Palette.white2),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetName.calendar,
                        color: Palette.white2,
                        width: 11.0,
                        // height: 11.0,
                      ).marginOnly(right: 5),
                      Text(
                        controller.current_mon.toString() +
                            " " +
                            controller.year.toString(),
                        style: TextStyle(
                            fontFamily: AppFontStyle.hindisReg,
                            fontSize: 12,
                            color: Palette.white2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 71,
              width: Get.width,
              color: Colors.transparent,
              margin: EdgeInsets.only(bottom: 20),
              child: HorizontalCalendar(
                date: DateTime.now(),
                initialDate: DateTime.now(),
                showMonth: false,
                lastDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 1),
                textColor: Palette.white2,
                backgroundColor: Palette.darkGray2,
                selectedColor: Palette.primary,
                onDateSelected: (date) => print(
                  date.toString(),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Events",
            //     style: TextStyle(
            //         fontFamily: AppFontStyle.hindiSemiBold,
            //         fontSize: 16,
            //         // fontWeight: FontWeight.bold,
            //         color: Palette.darkBlue),
            //   ).paddingOnly(bottom: 5),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: ListView.builder(
            //       physics: BouncingScrollPhysics(),
            //       padding: EdgeInsets.only(top: 10),
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return CardTask();
            //       }),
            // )
            // Expanded(
            //   flex: 1,
            //   child: StreamBuilder<int>(
            //     stream: controller.stopWatchTimer.rawTime,
            //     initialData: controller.stopWatchTimer.rawTime.value,
            //     builder: (context, snap) {
            //       final value = snap.data!;
            //       final displayTime =
            //           StopWatchTimer.getDisplayTime(value, hours: false);
            //       return Column(
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.all(8),
            //             child: Text(
            //               displayTime,
            //               style: const TextStyle(
            //                   fontSize: 40,
            //                   fontFamily: 'Helvetica',
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8),
            //             child: Text(
            //               value.toString(),
            //               style: const TextStyle(
            //                   fontSize: 16,
            //                   fontFamily: 'Helvetica',
            //                   fontWeight: FontWeight.w400),
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            Expanded(
                flex: 1,
                child: Center(
                  child: CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    animation: true,
                    percent: 0.7,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "7 Hours",
                      style: TextStyle(
                          fontFamily: AppFontStyle.hindMed,
                          fontSize: 24,
                          // fontWeight: FontWeight.bold,
                          color: Palette.white2),
                    ),
                    progressColor: Palette.primary,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
