import 'package:flutter/material.dart';

class view extends StatefulWidget {
  @override
  State<view> createState() => _viewState();
}

bool plane = false;

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          child: Chip(
            backgroundColor: 
            (plane==true)?Colors.blue:Colors.blue[800],
            label: Text(
              'Add Plane',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
