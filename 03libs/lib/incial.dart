import 'package:flutter/material.dart';

class Inicial extends StatelessWidget {
  const Inicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aa"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(255, 255, 0, 1),
      body: Container(
        color: Color(0xff356297),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(right: 60, top: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.settings),
            ),
            Text("data"),
            Text("data1"),
            Text("data2"),
          ],
        ),
      ),
    );
  }
}
