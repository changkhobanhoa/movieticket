import 'package:flutter/material.dart';
TextFormField formField(String text, IconData icon, bool isPassWord,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: isPassWord,
    enableSuggestions: isPassWord,
    autocorrect: isPassWord,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
      labelText: text,
      hintText: text,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2.0,
        ),
      ),
    ),
  );
}