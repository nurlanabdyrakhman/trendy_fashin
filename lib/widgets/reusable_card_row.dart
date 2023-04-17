import 'package:flutter/material.dart';
import 'package:trendy_fashion/widgets/reusable_text.dart';

class ReusableCartRow extends StatelessWidget {
  ReusableCartRow({super.key, required this.text, required this.price});
  final String text;
  final double price;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
          ReUsableTextForDetals(
            text: price.toString(),
          ),
        ],
      ),
    );
  }
}
