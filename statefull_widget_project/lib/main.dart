import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konversi suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: myController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: numberValidator,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 240, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow[900]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Suhu Dalam Kelvin"),
                          SizedBox(height: 22),
                          Text("150", style: TextStyle(fontSize: 45))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow[900]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Suhu Dalam Reamur"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "200",
                            style: TextStyle(fontSize: 45),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 225),
                // color: Colors.transparent,
                width: 500,
                height: 60,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(),
                  onPressed: () {},
                  color: Colors.blue[400],
                  child: Text(
                    "Konversi Suhu",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String numberValidator(String value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  }
}
