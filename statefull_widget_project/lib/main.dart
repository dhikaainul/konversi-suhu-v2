import 'package:flutter/material.dart';
import 'package:statefull_widget_project/titlenhasilsuhu.dart';
// import 'package:flutter/services.dart';
import 'package:statefull_widget_project/widget/Inputsuhu.dart';

import 'buttonkonverter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  TextEditingController myController = TextEditingController();

  konversi() {
    setState(() {
      inputUser = double.parse(myController.text);
      reamur = 4 / 5 * inputUser;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    var myController2 = myController;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konversi suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Inputsuhu(myController2: myController2),
              //content hasil suhu
              Container(
                margin: EdgeInsets.fromLTRB(10, 240, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    titlenhasilsuhu(
                      hasil: kelvin,
                      title: "Suhu dalam Kelvin",
                    ),
                    titlenhasilsuhu(
                      hasil: reamur,
                      title: "Suhu dalam Reamur",
                    ),
                  ],
                ),
              ),
              buttonkonverter(
                konversi: konversi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
