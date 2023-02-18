import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: toy(),
    debugShowCheckedModeBanner: false,
  ));
}
class toy extends StatefulWidget {
  const toy({Key? key}) : super(key: key);

  @override
  State<toy> createState() => _toyState();
}

class _toyState extends State<toy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("car",
        style: TextStyle(color: Colors.blueAccent),
        ),centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ,
    );
  }
}

