import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/settings/regional_settings_cubit.dart';
import 'package:testabd/features/profile/settings/regional_settings_state.dart';
import 'package:testabd/main.dart';

class RegionalSettingsScreen extends StatelessWidget {
  const RegionalSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<RegionalSettingsCubit>()..fetchCountries(),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Joylashuv",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
            builder: (context, state) => IconButton(
              onPressed: context
                  .read<RegionalSettingsCubit>()
                  .toggleEditableMode,
              icon: Icon(
                state.isEditable ? Icons.close_rounded : Icons.edit_rounded,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
        buildWhen: (s1, s2) => s1.isLoading != s2.isLoading,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: context.read<RegionalSettingsCubit>().refresh,
            child: state.isLoading
                ? const ProgressView()
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 140, 20, 160),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── PREMIUM GRADIENT HEADER ──
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                                size: 36,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Joylashuv",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "O‘zingizning joylashuvingizni tanlang",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.85),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        CountriesSection(),

                        const SizedBox(height: 24),
                        RegionSection(),

                        const SizedBox(height: 24),
                        DistrictsSection(),

                        const SizedBox(height: 24),
                        SettlementSection(),
                      ],
                    ),
                  ),
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
            builder: (context, state) => state.isEditable
                ? FloatingActionButton.extended(
                    onPressed: () {
                      context.read<RegionalSettingsCubit>().save();
                      context
                          .read<RegionalSettingsCubit>()
                          .toggleEditableMode();
                    },
                    label: const Text(
                      "O‘zgarishlarni saqlash",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    icon: const Icon(Icons.check_rounded, size: 28),
                    backgroundColor: scheme.primary,
                    foregroundColor: scheme.onPrimary,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : SizedBox.shrink(),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     MODERN DROPDOWN (replaces old _DropdownField)
// ─────────────────────────────────────────────────────────────
class _ModernDropdown extends StatelessWidget {
  final String label;
  final int? value;
  final String hint;
  final bool enabled;
  final bool isLoading;
  final List<DropdownItem> items;
  final ValueChanged<int?> onChanged;

  const _ModernDropdown({
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.enabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<int>(
          value: value,
          hint: Text(hint, style: const TextStyle(color: Colors.grey)),
          onChanged: enabled ? onChanged : null,
          dropdownColor: scheme.surface,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 28),
          decoration: InputDecoration(
            filled: true,
            fillColor: scheme.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: scheme.primary, width: 2.5),
            ),
          ),
          items: items
              .map(
                (e) => DropdownMenuItem<int>(
                  value: e.id,
                  child: Text(
                    e.name,
                    style: TextStyle(fontSize: 16.5, color: scheme.onSurface),
                  ),
                ),
              )
              .toList(),
        ),
        if (isLoading)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: ProgressView(),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     SECTIONS (updated to use modern dropdown)
// ─────────────────────────────────────────────────────────────
class CountriesSection extends StatelessWidget {
  const CountriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
      buildWhen: (s1, s2) =>
          s1.countries != s2.countries || s1.isEditable != s2.isEditable,
      builder: (context, state) {
        final s = state.countries;
        return _ModernDropdown(
          label: "Davlat",
          hint: "Davlatni tanlang",
          enabled: state.isEditable,
          value: s.selected?.id,
          items: s.countries
              .map((e) => DropdownItem(id: e.id, name: e.name ?? ''))
              .toList(),
          onChanged: context.read<RegionalSettingsCubit>().selectCountry,
        );
      },
    );
  }
}

class RegionSection extends StatelessWidget {
  const RegionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
      buildWhen: (s1, s2) =>
          s1.regions != s2.regions || s1.isEditable != s2.isEditable,
      builder: (context, state) {
        final s = state.regions;
        return _ModernDropdown(
          label: "Region",
          hint: "Regionni tanlang",
          enabled: state.isEditable,
          value: s.selected?.id,
          isLoading: s.isLoading,
          items: s.regions
              .map((e) => DropdownItem(id: e.id, name: e.name ?? ''))
              .toList(),
          onChanged: context.read<RegionalSettingsCubit>().selectRegion,
        );
      },
    );
  }
}

class DistrictsSection extends StatelessWidget {
  const DistrictsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
      buildWhen: (s1, s2) =>
          s1.districts != s2.districts || s1.isEditable != s2.isEditable,
      builder: (context, state) {
        final s = state.districts;
        return _ModernDropdown(
          label: "District",
          hint: "Districtni tanlang",
          enabled: state.isEditable,
          value: s.selected?.id,
          isLoading: s.isLoading,
          items: s.districts
              .map((e) => DropdownItem(id: e.id, name: e.name ?? ''))
              .toList(),
          onChanged: context.read<RegionalSettingsCubit>().selectDistrict,
        );
      },
    );
  }
}

class SettlementSection extends StatelessWidget {
  const SettlementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionalSettingsCubit, RegionalSettingsState>(
      buildWhen: (s1, s2) =>
          s1.settlement != s2.settlement || s1.isEditable != s2.isEditable,
      builder: (context, state) {
        final s = state.settlement;
        return _ModernDropdown(
          label: "Settlement",
          hint: "Settlementni tanlang",
          enabled: state.isEditable,
          value: s.selected?.id,
          isLoading: s.isLoading,
          items: s.settlements
              .map((e) => DropdownItem(id: e.id, name: e.name ?? ''))
              .toList(),
          onChanged: context.read<RegionalSettingsCubit>().selectSettlement,
        );
      },
    );
  }
}

class DropdownItem {
  final int? id;
  final String name;

  DropdownItem({required this.id, required this.name});
}
