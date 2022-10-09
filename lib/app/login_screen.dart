import 'package:entropia_market_ui/app/market_screen.dart';
import 'package:entropia_market_ui/core/color_scheme.dart';
import 'package:entropia_market_ui/core/custom_button.dart';
import 'package:entropia_market_ui/core/project_padding.dart';
import 'package:entropia_market_ui/core/text_field.dart';
import 'package:entropia_market_ui/core/bold_body_text.dart';
import 'package:flutter/material.dart';

import '../core/box_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ProjectPadding{
  final String _title = 'Welcome Back!';
  final String _titleDesc = 'Login to access all features';
  final String _email = 'Email';
  final String _password = 'Password';
  final String _login = 'Login';
  final String _forgotPassword = 'Forgot Password?';
  final String _signUp = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: generalPadding,
            child: Text(_title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: colorSheme.darkBlue),),
          ),
          Padding(
            padding: leftPadding,
            child: Text(_titleDesc,style: Theme.of(context).textTheme.titleMedium,),
          ),
          SizedBox(height: _size.height * 0.1,),
          _buildLogin(_size),
        ],
      ),
    );
  }

  Expanded _buildLogin(Size _size) {
    return Expanded(
          child: Container(
            decoration: boxDecoration(),
            width: _size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: (leftPadding * 2) + (topPadding * 3) + bottomPadding,
                  child: BoldBodyText(text: _email,)
                ),
                CustomTextField(prefixIcon: Icons.mail_outlined, hintText: _email),
                Padding(
                  padding: (leftPadding * 2) + verticalPadding,
                  child: BoldBodyText(text: _password,)
                ),
                CustomTextField(prefixIcon: Icons.password_outlined, hintText: _password,obscureText: true,),
                Padding(
                  padding: (rightPadding * 2) + topPadding,
                  child: Align(alignment: Alignment.bottomRight,child: TextButton(onPressed: (){},child: BoldBodyText(text: _forgotPassword,))),
                ),
                Padding(
                  padding: horizontalPadding * 2 ,
                  child: SizedBox(
                    width: _size.width,
                      height: _size.height * 0.07,
                      child: CustomButton(title: _login, onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MarketPlacePage()));
                      })),
                ),
                Padding(
                  padding: topPadding,
                  child: Align(alignment: Alignment.center,child: TextButton(onPressed: (){},child: BoldBodyText(text: _signUp,),)),
                ),
              ],
            ),
          ),
        );
  }
}