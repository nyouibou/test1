import 'package:flutter/material.dart';

class RefactoredTextfield extends StatelessWidget {
  const RefactoredTextfield(
      {super.key, required this.name, this.height, this.controller});
  final String name;
  final int? height;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: name),
        maxLines: height,
      ),
    );
  }
}
