import 'dart:developer';
import 'dart:io';

import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/controllers/user/user_cubit.dart';
import 'package:delta_ebookstore_app/controllers/user/user_state.dart';
import 'package:delta_ebookstore_app/core/api_url.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/utils/static_data.dart';
import 'package:delta_ebookstore_app/widgets/common/form_components.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _initialize() {
    final authCubit = context.read<AuthCubit>();
    final authState = authCubit.state;

    if (authState is Authenticated) {
      final user = authState.user; // Access userModel from Authenticated state
      _nameController.text = user.name;
      _usernameController.text = user.username ?? '';
      _emailController.text = user.email ?? '';
      _phoneController.text = user.phone ?? '';
    }
  }

  Future<void> _pickImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    FormComponents formComponents = FormComponents(context: context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Account',
          style: theme.typography.bodyMedium,
        ),
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserProfileUpdatedFailed) {
            StaticData.showDialogBox(
              context,
              Text(
                'Error',
                style:
                    theme.typography.headlineSmall.copyWith(color: theme.error),
              ),
              Text(
                state.error,
                style: theme.typography.bodySmall,
                maxLines: 10,
              ),
            );
          }

          if (state is UserProfileUpdatedSucceeded) {
            StaticData.showDialogBox(
              context,
              Text(
                'Success',
                style: theme.typography.headlineSmall
                    .copyWith(color: Colors.green),
              ),
              Text(
                state.successMessage,
                style: theme.typography.bodySmall,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  String? username = state.user.username;
                  String? name = state.user.name;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _selectedImage != null
                                ? FileImage(_selectedImage!)
                                : (state.user.profilePicture != null &&
                                        state.user.profilePicture!.isNotEmpty
                                    ? NetworkImage(
                                        '${ApiUrl.userProfileImageUrl}${state.user.profilePicture}')
                                    : const AssetImage(
                                        'assets/images/boy.png')) as ImageProvider<
                                    Object>,
                            backgroundColor: theme.tertiary,
                          ),

                          // Camera Icon
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: theme.primary,
                                child: Icon(Icons.camera_alt,
                                    color: theme.secondary, size: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Form Fields
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            formComponents.buildNormalTextField(
                              _nameController,
                              Text(
                                'name',
                                style: theme.typography.bodySmall,
                              ),
                            ),
                            const SizedBox(height: 10),
                            formComponents.buildNormalTextField(
                              _usernameController,
                              Text(
                                'username',
                                style: theme.typography.bodySmall,
                              ),
                            ),
                            const SizedBox(height: 10),
                            state.user.phone == null
                                ? formComponents.buildNormalTextField(
                                    _emailController,
                                    isReadOnly: true,
                                    Text(
                                      'email',
                                      style: theme.typography.bodySmall,
                                    ),
                                  )
                                : formComponents.buildNormalTextField(
                                    _phoneController,
                                    isReadOnly: true,
                                    Text(
                                      'phone',
                                      style: theme.typography.bodySmall,
                                    ),
                                  ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                return PrimaryButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  onPressed: () {
                                    String? updatedUsername;

                                    String? updatedName;

                                    if (username !=
                                        _usernameController.text.trim()) {
                                      updatedUsername =
                                          _usernameController.text.trim();
                                    }

                                    if (name != _nameController.text.trim()) {
                                      updatedName = _nameController.text.trim();
                                    }
                                    if (_selectedImage == null &&
                                        updatedUsername == null &&
                                        updatedName == null) {
                                      StaticData.showDialogBox(
                                        context,
                                        Text(
                                          'Message',
                                          style: theme.typography.headlineSmall,
                                        ),
                                        Text(
                                          'No changes made.',
                                          style: theme.typography.bodySmall,
                                        ),
                                      );

                                      return;
                                    }
                                    context.read<UserCubit>().updateProfile(
                                        _selectedImage,
                                        updatedUsername,
                                        updatedName);
                                  },
                                  color: theme.primary,
                                  child: state is UpdatingProfile
                                      ? CircularProgressIndicator(
                                          color: theme.secondary,
                                        )
                                      : Text(
                                          'Save Changes',
                                          style: theme.typography.labelSmall,
                                        ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: Text(
                    'You are not logged in.',
                    style: theme.typography.headlineMedium,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
