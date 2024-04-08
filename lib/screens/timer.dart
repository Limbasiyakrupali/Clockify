import 'dart:async';
import 'dart:math';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Stopwatch stopwatch;
  late Timer timer;

  double sec = (3 * pi) / 2;
  int secDigital = 0;
  double min = (3 * pi) / 2;
  int minDigital = 0;
  double hour = (3 * pi) / 2;
  int hourDigital = 0;
  List<String> lapTimes = [];

  @override
  void initState() {
    super.initState();

    stopwatch = Stopwatch();
    secDigital = 0;
    minDigital = 0;
    hourDigital = 0;

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        secDigital = stopwatch.elapsed.inSeconds % 60;
        minDigital = stopwatch.elapsed.inMinutes % 60;
        hourDigital = stopwatch.elapsed.inHours % 12;

        sec = (3 * pi) / 2 + secDigital * (pi / 30);
        min = (3 * pi) / 2 + minDigital * (pi / 30);
        hour = (3 * pi) / 2 + hourDigital * (pi / 6);
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    stopwatch.stop();
    super.dispose();
  }

  void addLapTime() {
    setState(() {
      lapTimes.insert(0,
          '${formatTime(hourDigital)}:${formatTime(minDigital)}:${formatTime(secDigital)}');
    });
  }

  void clearLapTimes() {
    setState(() {
      lapTimes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: NeumorphicText(
          "Timer",
          style: NeumorphicStyle(
            color: Colors.grey.shade100.withOpacity(0.8),
            intensity: 0.7,
            depth: 5,
          ),
          textStyle: NeumorphicTextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                depth: 8,
                intensity: 0.7,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(20),
                ),
                border: NeumorphicBorder(
                  color: Colors.cyan,
                  width: 8,
                ),
              ),
              child: Container(
                height: 130,
                width: 340,
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      '${formatTime(hourDigital)}:${formatTime(minDigital)}:${formatTime(secDigital)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 60,
                        color: Colors.cyan.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 170, right: 10),
                  width: 150,
                  height: 60,
                  child: NeumorphicButton(
                    onPressed: () {
                      setState(() {
                        if (stopwatch.isRunning) {
                          stopwatch.stop();
                        } else {
                          stopwatch.reset();
                          stopwatch.start();
                        }
                      });
                    },
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        depth: 8,
                        intensity: 0.7,
                        color: Colors.cyan,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: Icon(
                        stopwatch.isRunning ? Icons.stop : Icons.play_arrow,
                        size: 30.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Lap Times',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: lapTimes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        lapTimes[index],
                        style: TextStyle(
                          color: Colors.pink.shade300,
                          fontSize: 25,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String formatTime(int time) {
    if (time < 10) {
      return '0$time';
    } else {
      return '$time';
    }
  }
}
