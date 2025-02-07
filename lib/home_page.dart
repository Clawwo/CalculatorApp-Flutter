import 'package:calculator/components/my_button.dart';
import 'package:calculator/config/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Calculator",
                          style: TextStyle(
                              color: buttonColor,
                              fontSize: 45,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Calculator",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.backspace,
                              color: lableColor,
                            )),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            MyButton(
                              btnName: "c",
                              isFunction: true,
                            ),
                            MyButton(
                              btnName: "-/+",
                              isFunction: true,
                            ),
                            MyButton(
                              btnName: "%",
                              isFunction: true,
                            ),
                            MyButton(
                              btnName: "/",
                              isFunction: true,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            MyButton(
                              btnName: "7",
                            ),
                            MyButton(
                              btnName: "8",
                            ),
                            MyButton(
                              btnName: "9",
                            ),
                            MyButton(
                              btnName: "x",
                              isFunction: true,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            MyButton(
                              btnName: "4",
                            ),
                            MyButton(
                              btnName: "5",
                            ),
                            MyButton(
                              btnName: "6",
                            ),
                            MyButton(
                              btnName: "-",
                              isFunction: true,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            MyButton(
                              btnName: "1",
                            ),
                            MyButton(
                              btnName: "2",
                            ),
                            MyButton(
                              btnName: "3",
                            ),
                            MyButton(
                              btnName: "+",
                              isFunction: true,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            MyButton(
                              btnName: "0",
                            ),
                            MyButton(
                              btnName: ".",
                            ),
                            MyButton(
                              btnName: "00",
                            ),
                            MyButton(
                              btnName: "=",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
