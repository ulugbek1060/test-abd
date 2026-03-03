import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/account/entities/personal_info_dto.dart';
import 'package:testabd/features/profile/settings/personal_info_cubit.dart';
import 'package:testabd/features/profile/settings/personal_info_state.dart';
import '../../../core/theme/app_images.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<PersonalInfoCubit>(),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _usernameTextController;
  late final TextEditingController _nameTextController;
  late final TextEditingController _lastnameTextController;
  late final TextEditingController _emailTextController;
  late final TextEditingController _phoneNumberTextController;
  late final TextEditingController _bioTextController;
  late final ImagePicker _picker;

  @override
  void initState() {
    _picker = ImagePicker();
    _usernameTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _lastnameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _bioTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _nameTextController.dispose();
    _lastnameTextController.dispose();
    _emailTextController.dispose();
    _phoneNumberTextController.dispose();
    _bioTextController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (file != null) {
      context.read<PersonalInfoCubit>().changeProfileImage(file.path);
    }
  }

  void _showImagePickerSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text(
                "Gallerydan tanlash",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.camera_alt_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text(
                "Kamera orqali olish",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void onSaveChanges() {
    final dto = PersonalInfoDto(
      username: _usernameTextController.text,
      firstName: _nameTextController.text,
      lastName: _lastnameTextController.text,
      email: _emailTextController.text,
      phoneNumber: _phoneNumberTextController.text,
      bio: _bioTextController.text,
    );
    context.read<PersonalInfoCubit>().changePersonalInfo(dto);
    context.read<PersonalInfoCubit>().toggleEditableMode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
      listener: (context, state) {
        _usernameTextController.text = state.myInfo?.username ?? '';
        _nameTextController.text = state.myInfo?.firstName ?? '';
        _lastnameTextController.text = state.myInfo?.lastName ?? '';
        _emailTextController.text = state.myInfo?.email ?? '';
        _phoneNumberTextController.text = state.myInfo?.phoneNumber ?? '';
        _bioTextController.text = state.myInfo?.bio ?? '';
      },
      builder: (context, state) {
        final isEditable = state.isEditable;
        final scheme = Theme.of(context).colorScheme;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              "Profilni tahrirlash",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: context.read<PersonalInfoCubit>().toggleEditableMode,
                icon: Icon(
                  isEditable ? Icons.close_rounded : Icons.edit_rounded,
                  size: 26,
                ),
              ),
            ],
          ),
          body: state.status == PersonalInfoStatus.loading
              ? const ProgressView()
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 140, 20, 160),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── PREMIUM AVATAR (gradient ring only static colors) ──
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 168,
                              height: 168,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFE1306C),
                                    Color(0xFF405DE6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: state.myInfo?.profileImage ?? '',
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => Image.asset(
                                      AppImages.defaultAvatar,
                                      fit: BoxFit.cover,
                                    ),
                                    errorWidget: (_, __, ___) => Image.asset(
                                      AppImages.defaultAvatar,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (isEditable)
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: _showImagePickerSheet,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: scheme.primary,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: scheme.surface,
                                        width: 3,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: scheme.onPrimary,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      Center(
                        child: Text(
                          "${state.myInfo?.firstName ?? ''} ${state.myInfo?.lastName ?? ''}"
                              .trim(),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: scheme.onSurface,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Form fields
                      const _ModernLabel("Username"),
                      const SizedBox(height: 10),
                      _ModernTextField(
                        controller: _usernameTextController,
                        hint: "@username",
                        enabled: isEditable,
                      ),

                      const SizedBox(height: 16),
                      const _ModernLabel("Ism"),
                      const SizedBox(height: 10),
                      _ModernTextField(
                        controller: _nameTextController,
                        hint: "Ismingizni kiriting",
                        enabled: isEditable,
                      ),

                      const SizedBox(height: 16),
                      const _ModernLabel("Familiya"),
                      const SizedBox(height: 10),
                      _ModernTextField(
                        controller: _lastnameTextController,
                        hint: "Familiyangizni kiriting",
                        enabled: isEditable,
                      ),

                      const SizedBox(height: 16),
                      const _ModernLabel("Email"),
                      const SizedBox(height: 10),
                      _ModernTextField(
                        controller: _emailTextController,
                        hint: "example@email.com",
                        enabled: isEditable,
                      ),

                      const SizedBox(height: 16),
                      const _ModernLabel("Telefon raqami"),
                      const SizedBox(height: 10),
                      _ModernTextField(
                        controller: _phoneNumberTextController,
                        hint: "+998 xx xxx xx xx",
                        enabled: isEditable,
                      ),

                      const SizedBox(height: 16),
                      const _ModernLabel("Bio"),
                      const SizedBox(height: 10),
                      _ModernTextField(
                        controller: _bioTextController,
                        hint: "O‘zingiz haqingizda ma’lumot bering...",
                        maxLines: 5,
                        enabled: isEditable,
                      ),
                    ],
                  ),
                ),
          floatingActionButton: isEditable
              ? FloatingActionButton.extended(
                  onPressed: onSaveChanges,
                  label: const Text(
                    "O‘zgarishlarni saqlash",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  icon: const Icon(Icons.check_rounded, size: 28),
                  backgroundColor: scheme.primary,
                  foregroundColor: scheme.onPrimary,
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     MODERN REUSABLE WIDGETS
// ─────────────────────────────────────────────────────────────
class _ModernLabel extends StatelessWidget {
  final String text;

  const _ModernLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
        color: Colors.grey,
      ),
    );
  }
}

class _ModernTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool enabled;
  final int? maxLines;

  const _ModernTextField({
    required this.controller,
    required this.hint,
    this.enabled = true,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: scheme.surface,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: scheme.primary, // ← Primary from scheme
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
