import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Courage is not having the strength to go on; it is going on when you don't have the strength",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'RobotoMono',
              fontStyle: FontStyle.italic,
              fontSize: 13),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            SizedBox(width: 70),
            Expanded(child: Divider(thickness: 0.5, color: Colors.black)),
            SizedBox(width: 8),
            Text(
              'Theodore Roosevelt'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: 'RobotoMono',
                  fontStyle: FontStyle.italic,
                  fontSize: 11),
            ),
            SizedBox(width: 8),
            Expanded(child: Divider(thickness: 0.5, color: Colors.black)),
            SizedBox(width: 70),
          ],
        ),
      ],
    );
  }
}
