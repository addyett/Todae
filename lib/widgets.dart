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

class StatefulNote extends StatefulWidget {
  final bool priority;
  final bool completed;
  final String type;
  final String title;
  const StatefulNote(
      {Key? key,
      this.priority = false,
      this.completed = false,
      this.type = 'Note',
      required this.title})
      : super(key: key);

  @override
  _StatefulNoteState createState() => _StatefulNoteState();
}

class _StatefulNoteState extends State<StatefulNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color: widget.priority ? Colors.black : Colors.amber[600],
              border: Border.all(
                color: Colors.black,
                width: 2.25,
              ),
              borderRadius: widget.type == 'Note'
                  ? const BorderRadius.all(Radius.circular(10))
                  : const BorderRadius.all(Radius.circular(2)),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'RobotoMono',
              decoration: widget.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationThickness: 2,
              fontSize: 16,
              fontWeight:
                  widget.completed ? FontWeight.normal : FontWeight.w900,
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

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            // padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                '3',
                style: TextStyle(
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
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                '3       8',
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
