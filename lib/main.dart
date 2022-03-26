import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:http/http.dart' as http;

// use margin to the stateful note widget and use listview.builder instead of separator
// have the stateful note into a container so that it's clickable and the button inside a seperate container with padding too

import 'clock.dart';
import 'todo_list.dart';
import 'widgets.dart';
import 'quote.dart';

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
        statusBarColor: Color(0xFFFBB500),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarColor: Color(0xFFFBB500),
      ),
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
        padding: const EdgeInsets.fromLTRB(28, 40, 28, 0),
        child: Column(
          children: const [
            TopRow(),
            Divider(
              height: 15,
              color: Colors.black,
              thickness: 3,
            ),
            SizedBox(
              height: 20,
            ),
            Clock(),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: TodoList(),
            ),
            SizedBox(
              height: 25,
            ),
            Quote(),
            SizedBox(
              height: 18,
            ),
            // Divider(),
          ],
        ),
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
