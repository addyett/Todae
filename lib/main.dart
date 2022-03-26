import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/top_row.dart';
import 'widgets/clock.dart';
import 'widgets/todo_list.dart';
import 'widgets/quote.dart';

void main() {
  runApp(const Todae());
}

class Todae extends StatelessWidget {
  const Todae({Key? key}) : super(key: key);

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
