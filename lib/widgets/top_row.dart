import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  const TopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Todae',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.w200,
            fontSize: 22,
          ),
        ),
        Spacer(),
        Text(
          '   Tomorrow   ',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationThickness: 1.5,
            fontSize: 22,
          ),
        )
      ],
    );
  }
}
