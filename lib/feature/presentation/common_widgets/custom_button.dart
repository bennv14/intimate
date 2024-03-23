import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? height;
  final double? width;
  final Color? fillColor;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final BoxShape shape;
  final Border? border;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool disable;

  const CustomButton({
    super.key,
    this.onTap,
    this.child,
    this.height,
    this.width,
    this.fillColor,
    this.onLongPress,
    this.onDoubleTap,
    this.shape = BoxShape.rectangle,
    this.border,
    this.borderRadius,
    this.padding,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: disable ? null : onDoubleTap,
      onLongPress: disable ? null : onLongPress,
      onTap: disable ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          shape: shape,
          color: fillColor,
          border: border,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
