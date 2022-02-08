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
        child: Container(
          child: Column(
            children: [
              const TopRow(),
              const Divider(
                height: 15,
                color: Colors.black,
                thickness: 3,
              ),
              const SizedBox(
                height: 18,
              ),
              const Clock(),
              const SizedBox(
                height: 28,
              ),
              const StatefulNote(
                title: 'be a chad',
                priority: true,
              ),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(title: 'tommy needs a bath'),
              const StatefulNote(
                title: "pick Venessa up from airport",
                completed: true,
              ),
              const StatefulNote(
                title: 'service the car',
                completed: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
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
              // ),
              const Text(
                "Courage is not having the strength to go on; it is going on when you don't have the strength",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.italic,
                    fontSize: 13),
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
                    fontSize: 11),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
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
