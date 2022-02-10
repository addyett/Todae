import 'dart:async';

import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final bool priority;
  final bool completed;
  final String type;
  final String title;

  const Note(
      {Key? key,
      required this.title,
      this.priority = false,
      this.completed = false,
      this.type = 'Note'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color: priority ? Colors.black : Colors.amber[600],
              border: Border.all(
                color: Colors.black,
                width: 2.25,
              ),
              borderRadius: type == 'Note'
                  ? const BorderRadius.all(Radius.circular(10))
                  : const BorderRadius.all(Radius.circular(2)),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Wrap(
            children: <Text>[
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2,
                  fontSize: 16,
                  fontWeight: completed ? FontWeight.normal : FontWeight.w900,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StatefulNote extends StatelessWidget {
  final bool priority;
  final bool completed;
  final String type;
  final String title;
  final VoidCallback? onPriorityButtonTap;
  final VoidCallback? onDoneTap;

  const StatefulNote(
      {Key? key,
      this.priority = false,
      this.completed = false,
      this.type = 'Note',
      required this.title,
      this.onPriorityButtonTap,
      this.onDoneTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: onPriorityButtonTap,
          child: Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color: priority ? Colors.black : Colors.amber[600],
              border: Border.all(
                color: Colors.black,
                width: 2.25,
              ),
              borderRadius: type == 'Note'
                  ? const BorderRadius.all(Radius.circular(10))
                  : const BorderRadius.all(Radius.circular(2)),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: onDoneTap,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'RobotoMono',
              decoration:
                  completed ? TextDecoration.lineThrough : TextDecoration.none,
              decorationThickness: 2,
              fontSize: 16,
              fontWeight: completed ? FontWeight.normal : FontWeight.w900,
            ),
          ),
        )
      ],
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Todae',
            style: TextStyle(
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w900,
                fontSize: 22),
          ),
          Spacer(),
          Text(
            'Tomorrow ',
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 1.5,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}

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
          print(currentFirstMinute);
        });
      }
      if (currentSecondMinute != minuteSecond) {
        setState(() {
          minuteSecond = currentSecondMinute;
          print(minuteSecond);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
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
                hour.toString().padLeft(2, '0'),
                style: const TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
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
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  minuteFirst.toString(),
                  style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 22),
                ),
                Text(
                  minuteSecond.toString(),
                  style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
