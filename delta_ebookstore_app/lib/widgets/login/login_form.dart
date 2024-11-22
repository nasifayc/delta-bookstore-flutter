import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/form_components.dart';
import 'package:delta_ebookstore_app/widgets/common/google_auth_button.dart';
import 'package:delta_ebookstore_app/widgets/common/or_divider.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
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
                  "Welcome Back",
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
                  height: 40,
                ),
                formComponents.buildNormalTextField(
                  _userController,
                  Text(
                    'Email/Phone',
                    style: theme.typography.titleSmall
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  prefixIcon: const Icon(Icons.person_2_rounded),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email/phone number is required!';
                    }

                    return null;
                  },
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
                    if (value == null || value.isEmpty) {
                      return 'password is required!';
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
                          context.read<AuthCubit>().signIn(
                                _userController.text.trim(),
                                _passwordController.text.trim(),
                              );
                        },
                        color: theme.primary,
                        child: state is Authenticating
                            ? CircularProgressIndicator(
                                color: theme.secondary,
                              )
                            : Text(
                                'Login',
                                style: theme.typography.bodyMediumWhite,
                              ));
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: theme.typography.bodyMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/signup'),
                      child: Text(
                        'Sign Up',
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
