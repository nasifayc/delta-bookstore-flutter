import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/form_components.dart';
import 'package:delta_ebookstore_app/widgets/common/google_auth_button.dart';
import 'package:delta_ebookstore_app/widgets/common/or_divider.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupFrom extends StatefulWidget {
  const SignupFrom({super.key});

  @override
  State<SignupFrom> createState() => _SignupFromState();
}

class _SignupFromState extends State<SignupFrom> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isPhoneSelected = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    FormComponents formComponents = FormComponents(context: context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: theme.primaryBackground,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Create account",
                  style: theme.typography.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Enter your details below",
                  style: theme.typography.titleSmall
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Selector for Phone or Email
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrimaryButton(
                        width: MediaQuery.of(context).size.width * 0.3,
                        onPressed: () => setState(() {
                              _isPhoneSelected = true;
                            }),
                        color: _isPhoneSelected
                            ? theme.primary
                            : theme.primary.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 15,
                              color: _isPhoneSelected
                                  ? theme.secondary
                                  : theme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Phone',
                              style: _isPhoneSelected
                                  ? theme.typography.bodySmallWhite
                                  : theme.typography.titleMedium,
                            ),
                          ],
                        )),
                    PrimaryButton(
                        width: MediaQuery.of(context).size.width * 0.3,
                        onPressed: () => setState(() {
                              _isPhoneSelected = false;
                            }),
                        color: !_isPhoneSelected
                            ? theme.primary
                            : theme.primary.withOpacity(0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 15,
                              color: !_isPhoneSelected
                                  ? theme.secondary
                                  : theme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Email',
                              style: !_isPhoneSelected
                                  ? theme.typography.bodySmallWhite
                                  : theme.typography.titleMedium,
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: formComponents.buildNormalTextField(
                        _usernameController,
                        Text(
                          'Username',
                          style: theme.typography.titleSmall
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'username is required!';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: _isPhoneSelected
                          ? formComponents.buildNormalTextField(
                              _phoneController,
                              Text(
                                "Phone",
                                style: theme.typography.titleSmall
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              prefixIcon: const Icon(Icons.phone),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'phone is required!';
                                }

                                return null;
                              },
                            )
                          : formComponents.buildNormalTextField(
                              _emailController,
                              Text(
                                'Email',
                                style: theme.typography.titleSmall
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              prefixIcon: const Icon(Icons.email),
                              validator: (value) {
                                final emailRegex =
                                    RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                if (value == null || value.isEmpty) {
                                  return 'email is required!';
                                }

                                // Validate email format
                                if (!emailRegex
                                    .hasMatch(_emailController.text.trim())) {
                                  return 'Invalid email format.';
                                }
                                return null;
                              },
                            ), // Dynamically show Email or Phone input
                    )
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                formComponents.buildPasswordField(
                  _passwordController,
                  Text(
                    'Password',
                    style: theme.typography.titleSmall
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    final passwordRegex =
                        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
                    if (value == null || value.isEmpty) {
                      return 'password is required!';
                    }

                    if (!passwordRegex
                        .hasMatch(_passwordController.text.trim())) {
                      return 'Password must be at least 8 characters long and contain both letters and numbers.';
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
                    'Confirm',
                    style: theme.typography.titleSmall
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    final passwordRegex =
                        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
                    if (value == null || value.isEmpty) {
                      return 'confirm password!';
                    }

                    if (!passwordRegex
                        .hasMatch(_passwordController.text.trim())) {
                      return 'Password must be at least 8 characters long and contain both letters and numbers.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_isPhoneSelected) {
                            context.read<AuthCubit>().signUpPhone(
                                _usernameController.text.trim(),
                                _phoneController.text.trim(),
                                _passwordController.text.trim(),
                                _confirmController.text.trim());
                          } else {
                            context.read<AuthCubit>().signUpEmail(
                                _usernameController.text.trim(),
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                _confirmController.text.trim());
                          }
                        }
                      },
                      color: theme.primary,
                      child: state is Authenticating
                          ? CircularProgressIndicator(
                              color: theme.primary,
                            )
                          : Text(
                              'Sign Up',
                              style: theme.typography.bodyMediumWhite,
                            ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account?',
                      style: theme.typography.bodyMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/login'),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: theme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const OrDivider(),
                const SizedBox(
                  height: 25,
                ),
                const GoogleAuthButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
