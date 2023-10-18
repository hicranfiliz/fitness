import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String hintText;
  final String icon;
  final Widget? rightIcon;
  final EdgeInsets? margin;
  const RoundTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.icon,
      this.margin,
      this.keyboardType,
      this.obscureText = false,
      this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            color: TColor.lightGray, borderRadius: BorderRadius.circular(15)),
        child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                suffixIcon: rightIcon,
                prefixIcon: Container(
                  alignment: Alignment.center,
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    icon,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                    color: TColor.gray,
                  ),
                ),
                hintStyle: TextStyle(color: TColor.gray, fontSize: 12))));
  }
}
