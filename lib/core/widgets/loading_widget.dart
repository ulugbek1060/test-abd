import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Global reusable loading indicator that adapts to platform (Cupertino on iOS, Material elsewhere).
///
/// Features:
/// - Adaptive to platform (CupertinoActivityIndicator on iOS)
/// - Theme-aware default color
/// - Customizable size, stroke width, color
/// - Optional padding & centering
class ProgressView extends StatelessWidget {
  /// Size of the indicator (diameter for circular, radius for Cupertino)
  final double? size;

  /// Width of the progress stroke (only for Material version)
  final double? strokeWidth;

  /// Custom color (overrides theme default)
  final Color? color;

  /// Optional padding around the indicator
  final EdgeInsetsGeometry? padding;

  /// Whether to center the indicator in its parent (most common use-case)
  final bool center;

  const ProgressView({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.padding,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? Theme.of(context).colorScheme.primary;

    Widget indicator;

    if (Platform.isIOS || Platform.isMacOS) {
      indicator = CupertinoActivityIndicator(
        color: indicatorColor,
        radius: size != null ? size! / 2 : 14.0,
      );
    } else {
      indicator = SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 3.5,
          strokeCap: StrokeCap.round,
          valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
        ),
      );
    }

    final paddedIndicator = padding != null
        ? Padding(padding: padding!, child: indicator)
        : indicator;

    if (center) {
      return Center(child: paddedIndicator);
    }

    return paddedIndicator;
  }

  // Convenience constructors for common cases

  /// Small loading indicator (good for buttons, chips)
  const ProgressView.small({Key? key, Color? color, double? strokeWidth})
    : this(
        key: key,
        size: 20,
        strokeWidth: strokeWidth ?? 2.8,
        color: color,
        center: true,
      );

  /// Medium size (most common inline / centered loader)
  const ProgressView.medium({Key? key, Color? color, double? strokeWidth})
    : this(
        key: key,
        size: 36,
        strokeWidth: strokeWidth ?? 3.5,
        color: color,
        center: true,
      );

  /// Large size (full-screen / big waiting states)
  const ProgressView.large({Key? key, Color? color})
    : this(key: key, size: 56, strokeWidth: 4.5, color: color, center: true);
}

/// Default centered loader
// ProgressView(),
//
// // Small loader inside button
// ElevatedButton.icon(
//   icon: const ProgressView.small(),
//   label: const Text("Loading..."),
//   onPressed: null,
// ),
//
// // Custom color + size in the middle of screen
// Center(
//   child: ProgressView(
//     size: 48,
//     color: Colors.teal,
//     strokeWidth: 5,
//   ),
// ),
//
// // With padding, without forced centering
// ProgressView(
//   padding: const EdgeInsets.all(24),
//   center: false,
//   size: 32,
// ),
