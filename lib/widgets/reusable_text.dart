
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ReUsableTextForDetals extends StatelessWidget {
  const ReUsableTextForDetals({
    super.key, required this.text,
   
  });

  final String text;
 

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RichText(
            text: TextSpan(
              text: "€",
              style: TextStyle(
                  color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: text,
                  style: textTheme.bodySmall?.copyWith(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}
