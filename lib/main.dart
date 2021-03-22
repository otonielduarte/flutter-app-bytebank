import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('oi');
        },
        child: Icon(Icons.add),
      ),
    ),
  ));
}
