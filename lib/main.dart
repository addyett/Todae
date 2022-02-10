import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(const Todae());
}

class Todae extends StatelessWidget {
  const Todae({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Color(0xFFFBB500)),
    );
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);       // keep this disabled, conflicts with the transparent staturBar
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todae',
      home: TodaeHomePage(),
    );
  }
}

class TodaeHomePage extends StatelessWidget {
  const TodaeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBB500),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          children: const [
            TopRow(),
            Divider(
              height: 15,
              color: Colors.black,
              thickness: 3,
            ),
            SizedBox(
              height: 18,
            ),
            Clock(),
            SizedBox(
              height: 18,
            ),
            Expanded(child: TodoList()),
            SizedBox(
              height: 8,
            ),
            // const SizedBox(height: 27),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: const [
            //     SizedBox(
            //       width: 6,
            //     ),
            //     Text(
            //       'Daily',
            //       style: TextStyle(
            //           fontFamily: 'WorkSans',
            //           fontWeight: FontWeight.bold,
            //           fontStyle: FontStyle.italic,
            //           fontSize: 22),
            //     ),
            //   ],
            // ),
            // const Note(
            //   title: 'Gym',
            //   type: 'Daily',
            // ),
            // const Note(
            //   title: 'read - Deep Work',
            //   type: 'Daily',
            //   priority: true,
            // ),
            // const Note(
            //   title: 'journal (diary)',
            //   type: 'Daily',
            //   completed: true,
            // ),

            // const Expanded(
            //   child: SizedBox(),
            // ),'

            Quote(),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

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

class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todos = [
    'Be a chad',
    'Play games',
    'Meet Eichi',
    'Get hurt from Naomi',
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
    return ListView.separated(
      itemCount: todos.length + 1,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == todos.length) {
          return NewTodoButton(
            onTap: () {
              setState(() {
                todos.add("Hello eichi");
              });
            },
          );
        }
        return StatefulNote(
          title: todos[index],
          priority: priorityTodos.contains(index),
          completed: completedTodos.contains(index),
          onPriorityButtonTap: () => togglePriority(index),
          onDoneTap: () => toggleDone(index),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 18),
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
      onTap: onTap,
      child: Row(
        children: const <Widget>[
          SizedBox(
            width: 2,
          ),
          Icon(Icons.add),
          SizedBox(
            width: 10,
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
    );
  }
}

// class _TodaeHomePageState extends State<TodaeHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
