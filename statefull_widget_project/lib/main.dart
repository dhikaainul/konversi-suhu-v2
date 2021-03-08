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
  TextEditingController myController = TextEditingController();
  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  double result = 0;
  String selectedDropdown = "Kelvin";

  konversi() {
    setState(() {
      inputUser = double.parse(myController.text);
      reamur = 4 / 5 * inputUser;
      kelvin = inputUser + 273;
    });
  }

  dropdownOnChanged(String value) {
    setState(() {
      selectedDropdown = value;
    });
  }

  var listItem = ["Kelvin", "Reamur"];

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
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: selectedDropdown,
                onChanged: dropdownOnChanged,
                isExpanded: false,
              ),
              //content hasil suhu
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Titlenhasilsuhu(
                      hasil: result,
                    ),
                  ],
                ),
              ),
              // content hasil suhu
              // Container(
              //   margin: EdgeInsets.fromLTRB(10, 240, 10, 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Titlenhasilsuhu(
              //         hasil: kelvin,
              //         title: "Suhu dalam Kelvin",
              //       ),
              //       Titlenhasilsuhu(
              //         hasil: reamur,
              //         title: "Suhu dalam Reamur",
              //       ),
              //     ],
              //   ),
              // ),
              Buttonkonverter(
                konversi: konversi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
