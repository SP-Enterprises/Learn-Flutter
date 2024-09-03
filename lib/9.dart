import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  var jsonData;

  Future loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString(
        'assets/my-data.json');
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data;
    });
    //print(jsonData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Data'),
        ),
        body: Center(
          child: jsonData != null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${jsonData['name']}'),
              Text('Age: ${jsonData['age']}'),
              Text('Active: ${jsonData['isActive']}'),
              Text('Email: ${jsonData['email']}'),
              Text('Hobbies: ${jsonData['hobbies'].join(', ')}'),
              Text('Address:'),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Street: ${jsonData['address']['street']}'),
                    Text('City: ${jsonData['address']['city']}'),
                    Text('State: ${jsonData['address']['state']}'),
                    Text('Postal Code: ${jsonData['address']['postalCode']}'),
                  ],
                ),
              ),
            ],
          )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
