import 'package:calculator/config/colors.dart';
import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final bool isFunction;
  const MyButton({super.key, required this.btnName, this.isFunction = false});

  @override
  Widget build(BuildContext context) {
    CalculatorController calculatorController = Get.put(CalculatorController());
    return InkWell(
      onTap: () {
        calculatorController.onPressed(btnName);
      },
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
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
