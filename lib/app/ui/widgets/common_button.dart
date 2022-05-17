//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      this.text,
      this.color = Colors.white,
      this.onPressed,
      this.width,
      this.height,
      this.borderRadius,
      this.child,
      this.icon,
      this.fontSize = 20.0,
      this.fontWeight = FontWeight.bold,
      this.sizedBoxWidth})
      : super(key: key);
  final String? text;
  final Color? color;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? child;
  final IconData? icon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? sizedBoxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.purpleAccent.withAlpha(170)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: child,
              ),
              SizedBox(
                width: sizedBoxWidth,
              ),
              Text(
                text!,
                style: TextStyle(
                    color: color, fontSize: fontSize, fontWeight: fontWeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
