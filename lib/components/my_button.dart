import 'package:calculator/config/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final bool isFunction;
  const MyButton({super.key, required this.btnName, this.isFunction = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            btnName,
            style: TextStyle(
                color: isFunction ? buttonColor : textColor,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
