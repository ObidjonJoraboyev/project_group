import 'package:flutter/material.dart';

class UniversalButton extends StatelessWidget {
  const UniversalButton(
      {super.key,
      required this.child,
      required this.isSelect,
      required this.onTap});

  final String child;
  final bool isSelect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 160, vertical: 14),
            elevation: 3,
            foregroundColor: Colors.grey,
            shadowColor: Colors.black.withOpacity(.4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: isSelect ? Color(0xFF272B40) : Colors.white),
        onPressed: onTap,
        child: Text(
          child,
          style: TextStyle(color: isSelect ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
