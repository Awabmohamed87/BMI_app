import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isMale = true;
  int age = 20;
  double result = 100;

  var style = TextStyle(
      fontSize: 35,
      color: Colors.white,
      fontFamily: "Italic",
      fontWeight: FontWeight.bold);

  String determineHealthiness() {
    if (result < 18.5)
      return "Under Weight";
    else if (result >= 18.5 && result <= 24.9)
      return "Normal";
    else if (result > 24.9 && result < 30)
      return "Over weight";
    else
      return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    age = args["Age"];
    result = args["Result"];
    isMale = args["Gender"];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Result"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Gender: ${isMale == true ? 'Male' : 'Female'}",
                  style: style,
                ),
                Text(
                  "Result: ${result.toStringAsFixed(2)}",
                  style: style,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Healthiness: ${determineHealthiness()}",
                  style: style,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Age: $age",
                  style: style,
                ),
              ],
            ),
          ),
        ));
  }
}
