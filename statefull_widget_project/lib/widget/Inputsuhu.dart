import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inputsuhu extends StatelessWidget {
  const Inputsuhu({
    Key key,
    @required this.myController2,
  }) : super(key: key);

  final TextEditingController myController2;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController2,
      decoration: InputDecoration(
        hintText: 'Masukkan Suhu Dalam Celcius',
      ),
      keyboardType: TextInputType.number,
      maxLength: 10,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
