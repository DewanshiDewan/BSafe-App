import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import './answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      title: 'Bsafe Application',
      home: WelcomePage(title: 'Bsafe Application'),
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bsafe Application"),
      ),
      body: Center(
        child: Text(
          "Welcome to your Bsafe Audit App",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Bsafe Application')),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Form(
        key: _formKey,
        child:
          Survey(
          onNext: (questionResults) {
            print(questionResults);
            //store the result
          },

          initialData: [
            Question (
              isMandatory: true,
              question: "Please enter the Auditor's name",
            ),
            Question (
              isMandatory: true,
              question: "Please enter your Designation",
            ),

            Question(
              question: "Did you find the site of visit safe?",
              isMandatory: true,
              answerChoices: {
                "Yes": [
                  Question(
                      question: "Please tell us why?",
                  )
                ],
                "No": [
                  Question(
                    question: "Please tell us what went wrong.",
                  )
                ],
              },
            )
          ],
      ),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String dropdownvalue = 'Mahadevapura';

  // List of items in our dropdown menu
  var items = [
    'Mahadevapura',
    'Malleshwaram',
    'Dasarahalli',
    'Yeshwanthapura',
    'Yelahanka',
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audit Location"),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(

              // Initial Value
              value: dropdownvalue,
              hint: Text(dropdownvalue),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ThirdPage()),
          );
        },
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  final _formKey = GlobalKey<FormState>();

  bool? check1 = false, check2 = false, check3 = false, check4 = false, check5 = false, check6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Areas visited in Constituency"),
      ),
      body: Center(
        child: Column(
          children: [
        CheckboxListTile( //checkbox positioned at right
          value: check1,
          onChanged: (bool? value) {
            setState(() {
              check1 = value;
            });
          },
          title: Text("Police Station"),
        ),
           CheckboxListTile( //checkbox positioned at right
              value: check2,
              onChanged: (bool? value) {
                setState(() {
                  check2 = value;
                });
              },
              title: Text("Hospital"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check3,
              onChanged: (bool? value) {
                setState(() {
                  check3 = value;
                });
              },
              title: Text("Bus Stop"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check4,
              onChanged: (bool? value) {
                setState(() {
                  check4 = value;
                });
              },
              title: Text("Park"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check5,
              onChanged: (bool? value) {
                setState(() {
                  check5 = value;
                });
              },
              title: Text("Market"),
            ),
            CheckboxListTile( //checkbox positioned at right
              value: check6,
              onChanged: (bool? value) {
                setState(() {
                  check6 = value;
                });
              },
              title: Text("Public Restroom"),
            ),
          ],),
      ),
      bottomNavigationBar: TextButton(
        child: Text("Submit"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EndPage()),
          );
        },
      ),
    );
  }
}

class EndPage extends StatefulWidget {
  EndPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thank you"),
      ),
      body: const Center(
        child: Text(
          "Thank you for your help!",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: TextButton(
        child: const Text("Refill Form"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Bsafe Application')),
          );
        },
      ),
    );
  }
}