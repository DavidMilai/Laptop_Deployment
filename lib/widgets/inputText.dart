import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText(
      {@required this.hint,
      this.textObscure,
      this.onChange,
      this.keyboard,
      this.validate,
      this.controller});
  final String hint;
  final bool textObscure;
  final Function onChange;
  final Function validate;
  final TextEditingController controller;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      keyboardType: keyboard,
      validator: validate,
      controller: controller,
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
