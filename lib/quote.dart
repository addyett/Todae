import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Courage is not having the strength to go on; it is going on when you don't have the strength",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'RobotoMono',
              fontStyle: FontStyle.italic,
              fontSize: 13),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Theodore Roosevelt',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'RobotoMono',
              fontStyle: FontStyle.italic,
              fontSize: 11),
        ),
      ],
    );
  }
}
