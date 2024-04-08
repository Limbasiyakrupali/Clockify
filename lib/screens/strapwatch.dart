import 'dart:math';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class Starpwatch extends StatefulWidget {
  const Starpwatch({Key? key}) : super(key: key);

  @override
  State<Starpwatch> createState() => _StarpwatchState();
}

class _StarpwatchState extends State<Starpwatch> {
  double sec = (3 * pi) / 2;
  int secdigital = 0;
  double min = (3 * pi) / 2;
  int mindigital = 0;
  double hour = (3 * pi) / 2;
  int hourdigital = 0;
  bool isStart = true;
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
    await Future.delayed(Duration(seconds: 1), () {
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
      if (isStart) {
        timer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: NeumorphicText(
          "Strap Watch",
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
                boxShape: NeumorphicBoxShape.circle(),
                border: NeumorphicBorder(
                  color: Colors.cyan,
                  width: 8,
                ),
              ),
              child: Container(
                height: 250,
                width: 250,
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: secdigital * (1 / 60),
                      color: Colors.amber,
                      backgroundColor: Colors.white10,
                      strokeAlign: 20,
                      strokeWidth: 9,
                      strokeCap: StrokeCap.square,
                    ),
                    CircularProgressIndicator(
                      value: mindigital * (1 / 60),
                      color: Colors.pink,
                      backgroundColor: Colors.white10,
                      strokeAlign: 21,
                      strokeWidth: 7,
                      strokeCap: StrokeCap.square,
                    ),
                    CircularProgressIndicator(
                      value: hourdigital * (1 / 12),
                      color: Colors.green,
                      backgroundColor: Colors.white10,
                      strokeAlign: 19,
                      strokeWidth: 6,
                      strokeCap: StrokeCap.square,
                    ),
                    Transform.rotate(
                      angle: min,
                      child: const Divider(
                        indent: 120,
                        endIndent: 60,
                        thickness: 3,
                        color: Colors.cyan,
                      ),
                    ),
                    // Hour hand
                    Transform.rotate(
                      angle: hour,
                      child: const Divider(
                        indent: 120,
                        endIndent: 70,
                        thickness: 3,
                        color: Colors.cyan,
                      ),
                    ),
                    // Transform.rotate(
                    //   angle: (30 * pi), // Angle for 12 o'clock
                    //   child: Divider(
                    //     indent: 225, // Adjust indent as needed
                    //     thickness: 3,
                    //     color: Colors.cyan,
                    //   ),
                    // ),
                    // Transform.rotate(
                    //   angle: (30 * pi / 60), // Angle for 12 o'clock
                    //   child: Divider(
                    //     indent: 225, // Adjust indent as needed
                    //     thickness: 3,
                    //     color: Colors.cyan,
                    //   ),
                    // ),
                    // Transform.rotate(
                    //   angle: (30 * pi / 30), // Angle for 12 o'clock
                    //   child: Divider(
                    //     indent: 225, // Adjust indent as needed
                    //     thickness: 3,
                    //     color: Colors.cyan,
                    //   ),
                    // ),
                    // Transform.rotate(
                    //   angle: (30 * pi / 20), // Angle for 12 o'clock
                    //   child: Divider(
                    //     indent: 225, // Adjust indent as needed
                    //     thickness: 3,
                    //     color: Colors.cyan,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
