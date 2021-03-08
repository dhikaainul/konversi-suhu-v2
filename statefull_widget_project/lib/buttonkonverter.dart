import 'package:flutter/material.dart';

class buttonkonverter extends StatelessWidget {
  const buttonkonverter({Key key, @required this.konversi}) : super(key: key);

  final Function konversi;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 180),
      // color: Colors.transparent,
      width: double.infinity,
      height: 60,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(),
        onPressed: konversi,
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
    );
  }
}
