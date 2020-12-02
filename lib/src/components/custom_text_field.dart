import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;

  const CustomTextField({Key key, this.hintText, this.controller, this.minLines = 1, this.maxLines = 1,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: Colors.black26,
        controller: this.controller,
        style: TextStyle(color: Colors.black54, fontSize: 16),
        minLines: this.minLines,
        maxLines: this.maxLines,
        decoration: InputDecoration(
          labelText: this.hintText,
          labelStyle: TextStyle(color: Colors.black26, fontSize: 16),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrangeAccent),
          ),
        ),
      ),
    );
  }
}
