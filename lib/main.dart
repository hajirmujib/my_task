import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_task/app/constants/pallete.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      color: Palette.primary,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
