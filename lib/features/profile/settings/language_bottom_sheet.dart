import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/utils/language_service.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/l10n/l10n_extension.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return StreamBuilder<Locale>(
      stream: locator<LanguageService>().stream,
      builder: (context, snapshot) {
        final currentLocale = snapshot.data ?? const Locale('uz');
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(28)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: scheme.onSurface.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tilni tanlang",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: scheme.onSurface,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: scheme.surfaceVariant,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: scheme.onSurface,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Language List
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: supportedLocales.length,
                  itemBuilder: (context, index) {
                    final locale = supportedLocales[index];
                    final isSelected = locale == currentLocale;

                    return _LanguageItem(
                      locale: locale,
                      isSelected: isSelected,
                      onTap: () {
                        locator<LanguageService>().saveLanguage(locale);
                        context.pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final Locale locale;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageItem({
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? scheme.primary : Colors.transparent,
            width: 2.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Flag
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(locale.getFlag()),
            ),

            const SizedBox(width: 16),

            // Language Name
            Expanded(
              child: Text(
                locale.getDisplayName(context.l10n),
                style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
              ),
            ),

            // Selected Check
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: scheme.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
