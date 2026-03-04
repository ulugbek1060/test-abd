import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key, this.strokeWidth, this.color, this.padding});

  final Color? color;
  final double? strokeWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Center(
        child: Platform.isIOS && color != null
            ? CupertinoActivityIndicator(color: color)
            : CircularProgressIndicator.adaptive(
                strokeCap: StrokeCap.round,
                strokeWidth: strokeWidth ?? 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
      ),
    );
  }
}
