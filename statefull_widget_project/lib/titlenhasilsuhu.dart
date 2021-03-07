import 'package:flutter/material.dart';

class titlenhasilsuhu extends StatelessWidget {
  const titlenhasilsuhu({
    Key key,
    @required this.hasil,
    @required this.title,
  }) : super(key: key);

  final double hasil;
  final String title;

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
          Text('$title'),
          SizedBox(height: 22),
          Text('$hasil', style: TextStyle(fontSize: 45))
        ],
      ),
    );
  }
}
