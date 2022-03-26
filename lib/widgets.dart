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
      required this.title,
      this.priority = false,
      this.completed = false,
      this.type = 'Note',
      this.onPriorityButtonTap,
      this.onDoneTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 9,
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onPriorityButtonTap,
            child: Container(
              margin: const EdgeInsets.only(
                left: 7,
                right: 14,
                top: 4,
              ),
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                color: priority ? Colors.black : Colors.amber[600],
                border: Border.all(
                  color: Colors.black,
                  width: 2.2,
                ),
                borderRadius: type == 'Note'
                    ? const BorderRadius.all(Radius.circular(20))
                    : const BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onDoneTap,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2,
                  fontSize: 16,
                  // fontWeight: completed ? FontWeight.normal : FontWeight.w600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
            fontWeight: FontWeight.w200,
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
