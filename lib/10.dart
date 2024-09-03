import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future fetchCourse() async {
  final response = await http.get(Uri.parse('https://dhruvin.pythonanywhere.com/showdata/CA102'));

  // Appropriate action depending upon the
  // server response
  if (response.statusCode == 200) {
    return Course.fromJson(jsonDecode(response.body) as Map);
  } else {
    throw Exception('Failed to load Data!');
  }
}

class Course {

  final String coursecode;
  final String coursename;
  final String cincharge;

  const Course({
    required this.coursecode,
    required this.coursename,
    required this.cincharge,

  });

  factory Course.fromJson(Map json) {
    return Course(

      coursecode: json['coursecode'] as String,
      coursename: json['coursename'] as String,
      cincharge: json['cincharge'] as String,
    );
  }
}



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}



class _MyAppState extends State {
  late Future futureCourse;

  @override
  void initState() {
    super.initState();
    futureCourse = fetchCourse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('W3TechBlog'),
        ),
        body: Center(
          child: FutureBuilder(
            future: futureCourse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return (Text(snapshot.data!.cincharge));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}