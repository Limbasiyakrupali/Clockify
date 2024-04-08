import 'package:clockify/screens/alramclock.dart';
import 'package:clockify/screens/analogclock.dart';
import 'package:clockify/screens/digitalclock.dart';
import 'package:clockify/screens/homepage.dart';
import 'package:clockify/screens/stopwatch.dart';
import 'package:clockify/screens/strapwatch.dart';
import 'package:clockify/screens/timer.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  runApp(
    NeumorphicApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Homepage(),
        'Analogclock': (context) => const Analogclock(),
        'digitalclock': (context) => const digitalclock(),
        'timer': (context) => const TimerScreen(),
        'stopwatch': (context) => const stopwatch(),
        'Starpwatch': (context) => const Starpwatch(),
        'Alaramclock': (context) => const Alaramclock(),
      },
    ),
  );
}
