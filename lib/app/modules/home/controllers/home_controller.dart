import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeController extends GetxController {
  var now = DateTime.now();
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String current_mon = "";
  var year = 0;
  final StopWatchTimer stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStopped: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  @override
  void onInit() {
    int monthInt = now.month;
    current_mon = months[monthInt - 1].toString();
    year = now.year;

    stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    stopWatchTimer.records.listen((value) => print('records $value'));
    stopWatchTimer.fetchStopped.listen((value) => print('stopped from stream'));
    stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
