import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white60,
        centerTitle: true,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Transform.rotate(
            angle: -1,
            child: Icon(
              Icons.send,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
