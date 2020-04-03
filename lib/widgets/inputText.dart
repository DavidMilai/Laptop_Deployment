import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({@required this.hint, this.textObscure, this.onChange});
  final String hint;
  final bool textObscure;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        hintStyle: TextStyle(color: Colors.grey[800]),
        fillColor: Colors.white70,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      obscureText: textObscure,
      onChanged: onChange,
    );
  }
}
