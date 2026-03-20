import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

abstract class AppMessageHandler {
  void handleDialog(
    Messenger exception, {
    (String, VoidCallback)? secondaryAction,
  });

  void handleSnackBar(
    Messenger exception, {
    (String, VoidCallback)? secondaryAction,
  });
}

@Singleton(as: AppMessageHandler)
class AppMessenger implements AppMessageHandler {
  BuildContext get context => navigatorKey.currentContext!;

  bool _isDialogEnabled = false;
  bool _isSnackBarEnabled = false;

  @override
  void handleDialog(
    Messenger exception, {
    (String, VoidCallback)? secondaryAction,
  }) async {
    if (_isDialogEnabled) return;
    _isDialogEnabled = true;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final title = exception.title(context);
    final message = exception.message;
    final type = exception.getMessageType();
    final accentColor = type.getColor(context);
    final icon = type.icon;

    // TODO Make secondaryAction for each type
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: MediaQuery.of(sheetContext).viewInsets, // ← keyboard support
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modern drag handle (thicker + more contrast)
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                      color: colorScheme.onSurfaceVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Animated icon area
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.85 + value * 0.15,
                      child: Opacity(opacity: value, child: child),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 56, color: accentColor),
                  ),
                ),

                const SizedBox(height: 24),

                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                      height: 1.24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 12),

                // Message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    message,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 32),

                // Buttons area
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
                  child: Row(
                    children: [
                      // Optional secondary button (e.g. "Retry", "Details")
                      if (secondaryAction != null) ...[
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(sheetContext);
                              secondaryAction.$2.call();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              side: BorderSide(
                                color: accentColor.withOpacity(0.6),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              secondaryAction.$1,
                              style: TextStyle(color: accentColor),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],

                      // Primary button
                      Expanded(
                        child: FilledButton(
                          onPressed: () => Navigator.pop(sheetContext),
                          style: FilledButton.styleFrom(
                            backgroundColor: accentColor,
                            foregroundColor: colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 1,
                          ),
                          child: const Text(
                            'Got it',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    _isDialogEnabled = false;
  }

  @override
  void handleSnackBar(
    Messenger exception, {
    (String, VoidCallback)? secondaryAction,
  }) {
    if (_isSnackBarEnabled) return;
    _isSnackBarEnabled = true;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(exception.message))).closed.then((_) {
      _isSnackBarEnabled = false;
    });
  }
}
