import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key, this.hintText, this.onChanged});
  final Function(String)? onChanged;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: body_might_complete_normally_nullable
      validator: (date) {
        if (date!.isEmpty) {
          return ' filed is required';
        }
      },
      style: const TextStyle(
        color: Colors.white,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
