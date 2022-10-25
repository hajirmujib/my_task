import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/assets_path.dart';
import '../../../../constants/fonts.dart';
import '../../../../constants/pallete.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.only(bottom: 20),
      width: Get.width,
      height: 114,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Palette.primaryAlpha.withOpacity(0.25)),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 2,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Palette.purple,
                    borderRadius: BorderRadius.circular(5)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Indolaku",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFontStyle.hindMed,
                        color: Palette.darkBlue2),
                  ),
                  Text(
                    "07:15 - 07:35",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFontStyle.hindisReg,
                        color: Palette.lightGray),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              top: -15,
              right: -20,
              child: IconButton(
                  onPressed: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 144,
                            height: 120,
                            decoration: BoxDecoration(
                                color: Palette.white,
                                borderRadius: BorderRadius.circular(14)),
                            child: Material(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetName.edit,
                                          width: 24,
                                          height: 24,
                                        ).marginOnly(right: 10),
                                        Text(
                                          "Edit",
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFontStyle.hindisReg,
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    ).marginOnly(bottom: 20),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetName.delete,
                                          width: 24,
                                          height: 24,
                                        ).marginOnly(right: 10),
                                        Text(
                                          "Delete",
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFontStyle.hindisReg,
                                              fontSize: 16,
                                              color: Colors.black),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
                      },
                      animationType: DialogTransitionType.slideFromRightFade,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                    );
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: Palette.darkBlue2,
                  )))
        ],
      ),
    );
  }
}
