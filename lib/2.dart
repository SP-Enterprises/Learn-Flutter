import 'package:flutter/cupertino.dart';


void main() {
  runApp(const CupertinoApp(
    title: 'Simple Navigation App',
    home: FirstScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: const CupertinoNavigationBar(
        middle: Text('This is Screen1'),
      ),

      child: Center(
        child: CupertinoButton(
          child: const Text('Goto Screen2'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('This is Screen2'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Goto Screen1'),
        ),
      ),
    );
  }
}