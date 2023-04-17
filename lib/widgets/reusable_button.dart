
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.text, required this.onTap,
  });

  final String text;
   final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: MaterialButton(
        minWidth: size.width * 0.9,
        height: size.height * 0.07,
        color: Colors.black,
        onPressed: onTap,
        child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
