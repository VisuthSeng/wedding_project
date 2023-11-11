import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final Function onPress;
  final Color? backgroundButton;

  const ButtonIcon(
      {super.key,
      required this.icon,
      required this.onPress,
      this.iconSize,
      this.iconColor,
      this.width,
      this.height,
      this.backgroundButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        minimumSize: Size(width ?? 45, height ?? 30),
      ),
      child: Icon(
        icon,
        size: iconSize ?? 20,
        color: iconColor ?? Theme.of(context).primaryColor,
      ),
      onPressed: () {
        onPress();
      },
    );
  }
}
