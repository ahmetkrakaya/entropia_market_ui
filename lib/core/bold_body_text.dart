import 'package:entropia_market_ui/core/color_scheme.dart';
import 'package:flutter/material.dart';

class BoldBodyText extends StatelessWidget {
  const BoldBodyText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}





