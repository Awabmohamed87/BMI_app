import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 150.0;
  int weight = 50;
  int age = 18;
  bool isMale = true;
  var maleColor = Colors.grey;
  var femaleColor = Colors.blueGrey;
  int i = 0;
  Widget createActionButton(String symbol, bool mod) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      child: FloatingActionButton(
        heroTag: "btn + ${i++}",
        onPressed: () {
          setState(() {
            if (symbol == '-') {
              mod == false ? weight-- : age--;
            } else {
              mod == false ? weight++ : age++;
            }
          });
        },
        child: Text(
          symbol,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  Widget createCard(IconData icon, String txt, bool index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (txt == "Male")
              isMale = true;
            else
              isMale = false;

            if (isMale) {
              maleColor = Colors.grey;
              femaleColor = Colors.blueGrey;
            } else {
              femaleColor = Colors.grey;
              maleColor = Colors.blueGrey;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: !index ? maleColor : femaleColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(txt, style: TextStyle(fontSize: 30))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    createCard(Icons.phone, "Male", false),
                    createCard(Icons.fiber_manual_record, "Female", true),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4.3,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: Column(
                  children: [
                    Text(
                      "Your height:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text('CM',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Slider(
                      value: height,
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      },
                      min: 20,
                      max: 300,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$weight",
                                style: TextStyle(fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  createActionButton('-', false),
                                  SizedBox(height: 40),
                                  createActionButton('+', false),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$age",
                                style: TextStyle(fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  createActionButton('-', true),
                                  SizedBox(height: 40),
                                  createActionButton('+', true),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height / 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/x", arguments: {
                        "Age": age,
                        "Result":
                            ((weight / ((height / 100) * (height / 100)))),
                        "Gender": isMale
                      });
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
