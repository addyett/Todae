import 'package:flutter/material.dart';

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
