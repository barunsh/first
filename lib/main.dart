// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var counter = 0;
  bool showList = false;

  void buttonPressed(value) {
    answerList.add(value);
    setState(() {
      if (counter < listOfQuestions.length - 1) {
        counter = counter + 1;
      } else {
        showList = true;
        counter = 0;
        print(answerList);
      }
    });
  }

  var listOfQuestions = [
    "What is your favorite Color?",
    "What is your favorite Food?",
    "What is your favorite Season?",
  ];
  var listOfAnswers = [
    ["Red", "Blue", "Green"],
    ["Momo", 'Pizza', "Rice"],
    ['Spring', "Winter", "Summer"]
  ];

  var answerList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("My First App!")),
      body: !showList
          ? Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(listOfQuestions.elementAt(counter),
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              buttonPressed(listOfAnswers[counter][0]),
                          child: Text(listOfAnswers[counter][0])),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              buttonPressed(listOfAnswers[counter][1]),
                          child: Text(listOfAnswers[counter][1])),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              buttonPressed(listOfAnswers[counter][2]),
                          child: Text(listOfAnswers[counter][2])),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Container(
                height: 200,
                child: Column(children: [
                  for (var i = 0; i < listOfQuestions.length; i++) ...[
                    Text(listOfQuestions[i]),
                    Text(answerList[i]),
                  ]
                ]),
              ),
            ),
    ));
  }
}
