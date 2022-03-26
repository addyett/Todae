import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todae/widgets.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isEmpty = true;

  final todos = [
    'be a chad',
    'tommy needs a bath',
    'pick Venessa from airport',
    'service the car',
  ];

  final priorityTodos = [];
  void togglePriority(int index) {
    setState(() {
      if (priorityTodos.contains(index)) {
        priorityTodos.remove(index);
      } else {
        priorityTodos.add(index);
      }
    });
  }

  final completedTodos = [];
  void toggleDone(int index) {
    setState(() {
      if (completedTodos.contains(index)) {
        completedTodos.remove(index);
      } else {
        completedTodos.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        shrinkWrap: false,
        padding: const EdgeInsets.only(bottom: 0),
        clipBehavior: Clip.antiAlias,
        itemCount: todos.length + 1,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (isEmpty & todos.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' -  Add a new Task!',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                NewTodoButton(
                  onTap: () {
                    isEmpty = false;
                    todos.add("Hello eichi");
                    setState(() {});
                  },
                ),
              ],
            );
          }

          if (index == todos.length) {
            return Column(
              children: [
                NewTodoButton(
                  onTap: () {
                    todos.add("Hello eichi");
                    setState(() {});
                  },
                ),
              ],
            );
          }
          // return TextField()
          return StatefulNote(
            title: todos[index],
            priority: priorityTodos.contains(index),
            completed: completedTodos.contains(index),
            onPriorityButtonTap: () => togglePriority(index),
            onDoneTap: () => toggleDone(index),
          );
        },
        // separatorBuilder: (context, index) => const SizedBox(
        //   height: 10,
        // ),
      ),
    );
  }
}

class NewTodoButton extends StatelessWidget {
  final VoidCallback? onTap;

  const NewTodoButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 2,
        ),
        child: Row(
          children: const <Widget>[
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.add,
              size: 21.0,
            ),
            SizedBox(
              width: 17,
            ),
            Expanded(
              child: Divider(
                height: 5,
                thickness: 2,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextField newTodoOneTap() {
  return TextField(onSubmitted: (text) {
    log(text);
  });
}
