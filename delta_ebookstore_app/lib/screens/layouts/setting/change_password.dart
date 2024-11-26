import 'dart:developer';

import 'package:delta_ebookstore_app/controllers/user/user_cubit.dart';
import 'package:delta_ebookstore_app/controllers/user/user_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/utils/static_data.dart';
import 'package:delta_ebookstore_app/widgets/common/form_components.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _prevController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    _prevController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    FormComponents formComponents = FormComponents(context: context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Change Password',
          style: theme.typography.bodyMedium,
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is PasswordChangedSuccess) {
            StaticData.showDialogBox(
              context,
              Text(
                'Success',
                style: theme.typography.headlineSmall
                    .copyWith(color: Colors.green),
              ),
              Text(
                'Password Changed!',
                style: theme.typography.bodySmall,
              ),
            );
          }

          if (state is PasswordChangedFailure) {
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
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      formComponents.buildPasswordField(
                        _prevController,
                        Text(
                          'old password',
                          style: theme.typography.bodySmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      formComponents.buildPasswordField(
                        _newController,
                        Text(
                          'new password',
                          style: theme.typography.bodySmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      formComponents.buildPasswordField(
                        _confirmController,
                        Text(
                          'confirm new password',
                          style: theme.typography.bodySmall,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'required!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                          return PrimaryButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<UserCubit>().changePassword(
                                      _prevController.text.trim(),
                                      _newController.text.trim(),
                                      _confirmController.text.trim());
                                }
                              },
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: theme.primary,
                              child: state is ChangingPassword
                                  ? CircularProgressIndicator(
                                      color: theme.secondary,
                                    )
                                  : Text(
                                      'Update',
                                      style: theme.typography.labelSmall,
                                    ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
