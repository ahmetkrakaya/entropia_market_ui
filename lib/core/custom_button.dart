import 'package:entropia_market_ui/core/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  CustomButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade400,
          ],
        ),
        color: Colors.blue.shade600,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: colorSheme.babyBlue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
