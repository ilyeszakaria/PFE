import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    Key? key,
    required this.title,
    required this.controller,
    this.icon,
    this.obscureText = false,
  }) : super(key: key);
  TextEditingController controller;
  bool obscureText;
  final Color borderColor = const Color.fromARGB(255, 101, 74, 64);
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 55,
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.end,
            obscureText: obscureText,
            obscuringCharacter: '*',
            cursorColor: borderColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                icon,
                color: Colors.brown,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  void Function() onPressed;
  bool expended;
  String text;
  ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.expended = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expended ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.brown,
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: expended ? 0 : 10,
          ),
        ),
      ),
    );
  }
}
