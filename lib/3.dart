import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const String appTitle = '';


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            //title: const Text('Application Form'),

          ),
          body: const ElevatedButtonExample()

      ),
    );
  }
}
class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State {
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Center(
            child: Text('Log In Form', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),

          Padding(padding: const EdgeInsets.only(left:100.0,top:0.0,right: 100.0, bottom:0.0),child: TextField(

            maxLength: 100,
            controller: myController,

          )),

          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {

                    return AlertDialog(
                      title: const Text('Navarchana University'),
                      content: Text('Your Name is ${myController.text}'),

                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('LogIn'),
            ),
          ),
        ],
      ),
    );
  }
}