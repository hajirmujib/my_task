import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:my_task/app/constants/fonts.dart';
import 'package:my_task/app/constants/pallete.dart';

class CalendarItems extends StatelessWidget {
  CalendarItems({
    Key? key,
    required this.index,
    required this.startDate,
    required this.initialDate,
    required this.selectedDate,
    required this.textColor,
    required this.selectedColor,
    required this.backgroundColor,
    required this.onDatePressed,
  }) : super(key: key);

  final int index;
  final DateTime startDate;
  final DateTime initialDate;
  final DateTime selectedDate;
  final Color textColor;
  final Color selectedColor;
  final Color backgroundColor;
  final VoidCallback onDatePressed;

  @override
  Widget build(BuildContext context) {
    DateTime date = startDate.add(Duration(days: index));
    int diffDays = date.difference(selectedDate).inDays;
    int checkPastDate = date.difference(initialDate).inDays;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(right: 10),
      width: (width / 100) * 13.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: diffDays != 0 ? backgroundColor : selectedColor,
      ),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onDatePressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateParser.getDayOfWeek(date),
              style: TextStyle(
                  color: diffDays != 0
                      ? checkPastDate >= 0
                          ? textColor
                          : textColor
                      : Palette.white2,
                  fontSize: 16.0,
                  fontFamily: AppFontStyle.hindMed),
            ),
            SizedBox(height: 2.0),
            Text(
              DateParser.getDayOfMonth(date),
              style: TextStyle(
                  color: diffDays != 0
                      ? checkPastDate >= 0
                          ? textColor
                          : textColor
                      : Colors.white,
                  fontSize: 14.0,
                  fontFamily: AppFontStyle.hindisReg),
            ),
          ],
        ),
      ),
    );
  }
}
