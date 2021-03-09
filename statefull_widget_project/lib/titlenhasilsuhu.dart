import 'package:flutter/material.dart';

class Titlenhasilsuhu extends StatelessWidget {
  const Titlenhasilsuhu({
    Key key,
    @required double hasil,
  })  : result = hasil,
        super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow[900]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 22),
          Text(result.toStringAsFixed(2), style: TextStyle(fontSize: 45))
        ],
      ),
    );
  }
}
