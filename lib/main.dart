import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(const Todae());
}

class Todae extends StatelessWidget {
  const Todae({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
    ));
    // // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todae',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const TodaeHomePage(),
    );
  }
}

class Note extends StatelessWidget {
  const Note(
      {Key? key,
      required this.title,
      this.priority = false,
      this.completed = false,
      this.type = 'Note'})
      : super(key: key);

  final bool priority;
  final bool completed;
  final String type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'RobotoMono',
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2,
                  fontSize: 17,
                  fontWeight: FontWeight.w900),
            ),
          ],
        )
      ],
    );
  }
}

class TodaeHomePage extends StatelessWidget {
  const TodaeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[600],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Todae',
                      style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w900,
                          // fontStyle: FontStyle.italic,
                          fontSize: 22),
                    ),
                    Spacer(),
                    Text(
                      'Tomorrow',
                      style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 1.5,
                          fontSize: 22),
                    )
                  ],
                ),
                const Divider(
                  height: 15,
                  color: Colors.black,
                  thickness: 3,
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
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
                const SizedBox(
                  height: 38,
                ),
                const Note(
                  title: 'be a chad',
                  priority: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Note(title: 'tommy needs a bath'),
                const SizedBox(
                  height: 10,
                ),
                const Note(
                  title: "pick Venessa up from airport",
                  completed: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Note(
                  title: 'service the car',
                  completed: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: const [
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
                const SizedBox(height: 27),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Daily',
                      style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Note(
                  title: 'Gym',
                  type: 'Daily',
                ),
                const SizedBox(
                  height: 12,
                ),
                const Note(
                  title: 'read - Deep Work',
                  type: 'Daily',
                  priority: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Note(
                  title: 'journal (diary)',
                  type: 'Daily',
                  completed: true,
                ),
                const Expanded(child: SizedBox()),
                const Text(
                  "Courage is not having the strength to go on; it is going on when you don't have the strength.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Theodore Roosevelt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Icon(Icons.keyboard_arrow_up),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
    // );
  }
}


// class _TodaeHomePageState extends State<TodaeHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
