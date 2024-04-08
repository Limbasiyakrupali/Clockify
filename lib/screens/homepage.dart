import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: NeumorphicText(
                "Clockify",
                style: NeumorphicStyle(
                  color: Colors.grey.shade100.withOpacity(0.8),
                  intensity: 0.7,
                  depth: 5,
                ),
                textStyle: NeumorphicTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/5c/79/4b/5c794bf3e1d1579ab8d1600c823854b6.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.color,
                ),
              ),
            ),
          ),
          // Content Container
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  height: 100.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 60.0,
                          height: 50.0,
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('Analogclock');
                              // Action for the button
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 8,
                                intensity: 0.7,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(
                                Icons.punch_clock,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 60.0,
                          height: 50.0,
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('digitalclock');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 8,
                                intensity: 0.7,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(
                                Icons.punch_clock,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 60.0,
                          height: 50.0,
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('timer');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 8,
                                intensity: 0.7,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(
                                Icons.timer,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 60.0,
                          height: 50.0,
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('stopwatch');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 8,
                                intensity: 0.7,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(
                                Icons.punch_clock,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 60.0,
                          height: 50.0,
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('Starpwatch');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 8,
                                intensity: 0.7,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(Icons.punch_clock,
                                  size: 30.0, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 60.0,
                          height: 50.0,
                          child: NeumorphicButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('Alaramclock');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                depth: 8,
                                intensity: 0.7,
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                              child: Icon(
                                Icons.alarm,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
