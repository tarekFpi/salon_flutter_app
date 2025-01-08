// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';

class CustomTitleName extends StatelessWidget {
  const CustomTitleName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Center(
        child: RichText(
            text: TextSpan(
                style: TextStyle(
                    color: AppColors.softlimegreen,
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
              TextSpan(text: "Plena "),
              TextSpan(
                  text: "Vita!",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35,
                      fontWeight: FontWeight.w700)),
            ])),
      ),
    );
  }
}
