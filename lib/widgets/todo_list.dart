import 'dart:developer';
import 'package:flutter/material.dart';

import 'stateful_note.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isEmpty = true;

  final todos = [];

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
        padding: const EdgeInsets.only(bottom: 0),
        clipBehavior: Clip.antiAlias,
        itemCount: todos.length + 1,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == todos.length) {
            return NewTodoButton(
              onTap: () {
                if (!todos.contains("<placeholder>")) {
                  setState(() {
                    todos.add("<placeholder>");
                  });
                }
              },
            );
          } else if (todos[index] != "<placeholder>") {
            return StatefulNote(
              title: todos[index],
              completed: completedTodos.contains(index),
              priority: priorityTodos.contains(index),
              onDoneTap: () => toggleDone(index),
              onPriorityButtonTap: () => togglePriority(index),
            );
          } else {
            return Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                        left: 7,
                        right: 14,
                        top: 4,
                      ),
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        color: Colors.amber[600],
                        border: Border.all(
                          color: Colors.black,
                          width: 2.2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            todos[todos.length - 1] = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        style: const TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: Colors.black
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9)
              ],
            );
          }
        },
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
