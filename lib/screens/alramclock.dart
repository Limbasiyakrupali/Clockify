import 'dart:math';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class Alaramclock extends StatefulWidget {
  const Alaramclock({Key? key}) : super(key: key);

  @override
  State<Alaramclock> createState() => _AlaramclockState();
}

class _AlaramclockState extends State<Alaramclock> {
  double sec = (3 * pi) / 2;
  int secdigital = 0;
  double min = (3 * pi) / 2;
  int mindigital = 0;
  double hour = (3 * pi) / 2;
  int hourdigital = 0;
  bool isStart = true;
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  bool switch5 = false;
  bool switch6 = false;
  bool switch7 = false;
  bool switch8 = false;
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
          "Alaram Clock",
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
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch1,
                                          onChanged: (value) {
                                            switch1 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch2,
                                          onChanged: (value) {
                                            switch2 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch3,
                                          onChanged: (value) {
                                            switch3 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch4,
                                          onChanged: (value) {
                                            switch4 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch5,
                                          onChanged: (value) {
                                            switch5 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch6,
                                          onChanged: (value) {
                                            switch6 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch7,
                                          onChanged: (value) {
                                            switch7 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Neumorphic(
                      margin: EdgeInsets.only(bottom: 25, top: 10),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,
                        intensity: 0.7,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        border: NeumorphicBorder(
                          color: Colors.cyan,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Colors.black,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 6),
                                  child: Text(
                                    '6:00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45,
                                      color: Colors.cyan.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 6),
                                      child: Switch(
                                          splashRadius: 10.2,
                                          hoverColor: Colors.cyan,
                                          value: switch8,
                                          onChanged: (value) {
                                            switch8 = value;
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
