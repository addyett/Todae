import 'package:flutter/material.dart';
import 'package:todae/widgets.dart';

Widget daily = Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(
          width: 6,
        ),
        Text(
          'Daily',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 22,
          ),
        ),
      ],
    ),
    const StatefulNote(
      title: 'Gym',
      type: 'Daily',
    ),
    const StatefulNote(
      title: 'read - Deep Work',
      type: 'Daily',
      priority: true,
    ),
    const StatefulNote(
      title: 'journal (diary)',
      type: 'Daily',
      completed: true,
    ),
  ],
);