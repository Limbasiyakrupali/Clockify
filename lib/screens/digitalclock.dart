import 'dart:math';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class digitalclock extends StatefulWidget {
  const digitalclock({Key? key}) : super(key: key);

  @override
  State<digitalclock> createState() => _digitalclockState();
}

class _digitalclockState extends State<digitalclock> {
  bool isrunning = false;
  Stopwatch stopwatch = Stopwatch();
  double sec = (3 * pi) / 2;
  int secdigital = 0;
  double min = (3 * pi) / 2;
  int mindigital = 0;
  double hour = (3 * pi) / 2;
  int hourdigital = 0;
  DateTime time = DateTime.now();
  @override
  void initState() {
    super.initState();
    setState(() {
      secdigital = time.second;
      mindigital = time.minute;
      hourdigital = time.hour;

      sec = sec + secdigital * (pi / 30);
      min = min + mindigital * (pi / 30);
      hour = hour + hourdigital * (pi / 6);
    });
    timer();
  }

  timer() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (secdigital >= 60) {
          secdigital = 0;
          mindigital++;
          min = min + (pi / 30);
        } else if (mindigital >= 60) {
          mindigital = 0;
          hourdigital++;
          hour = hour + (pi / 6);
        } else {
          secdigital++;
          sec = sec + (pi / 30);
        }
      });
      timer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: NeumorphicText(
          "Digital Clock",
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
            child: Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
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
                  height: 180,
                  width: double.infinity,
                  color: Colors.black,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "$hourdigital:$mindigital:$secdigital",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 60,
                          color: Colors.cyan.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
