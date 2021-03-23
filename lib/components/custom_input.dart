import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final TextEditingController textController;
  final String label;
  final String placeholder;

  CustomInput({this.textController, this.label, this.placeholder, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        style: TextStyle(
          fontSize: 18.5,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: placeholder,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

