import 'package:entropia_market_ui/core/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);
  final IconData prefixIcon;
  final String hintText;
  bool obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: TextField(
        obscureText: widget.obscureText,
        keyboardType: TextInputType.emailAddress,
        cursorColor: colorSheme.darkBlue,
        decoration: InputDecoration(
          fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(widget.prefixIcon),
            prefixIconColor: colorSheme.darkBlue,
            suffixIcon: widget.hintText == 'Password'
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined,color: widget.obscureText ? colorSheme.darkBlue : Colors.red,),
                    onPressed: () {
                      setState(() {
                        widget.obscureText ? widget.obscureText = false : widget.obscureText = true;
                      });
                    },
                  )
                : null,
            suffixIconColor: colorSheme.darkBlue,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            )),
      ),
    );
  }
}
