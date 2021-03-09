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
      print(listViewItem.length);
      inputUser = double.parse(myController.text);
      if (selectedDropdown == "Kelvin") {
        result = inputUser + 273;
        listViewItem.add("$selectedDropdown" + " : " + "$result");
      } else if (selectedDropdown == "Reamur") {
        result = inputUser * 4 / 5;
        listViewItem.add("$selectedDropdown" + " : " + "$result");
      }
      // switch (selectedDropdown) {
      //   case "Kelvin":
      //     {
      //       // statements;
      //       result = inputUser + 273;
      //       listViewItem.add("$selectedDropdown" + " : " + "$result");
      //     }
      //     break;

      //   case "Reamur":
      //     {
      //       //statements;
      //       result = inputUser * 4 / 5;
      //       listViewItem.add("$selectedDropdown" + " : " + "$result");
      //     }
      //     break;
      // }
    });
  }

  dropdownOnChanged(String value) {
    setState(() {
      selectedDropdown = value;
    });
  }

  List<String> listViewItem = [];
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
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView(
                  children: listViewItem.map((String value) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
