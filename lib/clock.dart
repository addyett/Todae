import 'dart:async';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  int hour = 0;
  int minuteFirst = 0;
  int minuteSecond = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = DateTime.now();
      if (current.hour != hour) {
        setState(() {
          hour = current.hour;
        });
      }
      final currentFirstMinute =
          int.parse(current.minute.toString().padLeft(2, '0')[0]);
      final currentSecondMinute =
          int.parse(current.minute.toString().padLeft(2, '0')[1]);

      if (currentFirstMinute != minuteFirst) {
        setState(() {
          minuteFirst = currentFirstMinute;
          // print(currentFirstMinute);
        });
      }
      if (currentSecondMinute != minuteSecond) {
        setState(() {
          minuteSecond = currentSecondMinute;
          // print(minuteSecond);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            // shape: BoxShape.circle,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              (hour % 12).toString(),
              // hour.toString().padLeft(2, '0'),
              style: const TextStyle(
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 22),
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
        Container(
          height: 50,
          width: 110,
          // padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                minuteFirst.toString(),
                style: const TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: 22),
              ),
              Text(
                minuteSecond.toString(),
                style: const TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: 22),
              ),
            ],
          ),
        )
      ],
    );
  }
}
