import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/form_components.dart';
import 'package:delta_ebookstore_app/widgets/common/google_auth_button.dart';
import 'package:delta_ebookstore_app/widgets/common/or_divider.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';

class SignupFrom extends StatefulWidget {
  const SignupFrom({super.key});

  @override
  State<SignupFrom> createState() => _SignupFromState();
}

class _SignupFromState extends State<SignupFrom> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
                style: theme.typography.titleSmall,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: formComponents.buildNormalTextField(
                        _usernameController,
                        Text(
                          'Username',
                          style: theme.typography.titleSmall,
                        ),
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: formComponents.buildNormalTextField(
                        _emailController,
                        Text(
                          'Email',
                          style: theme.typography.titleSmall,
                        ),
                        prefixIcon: const Icon(Icons.email)),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildNormalTextField(
                  _phoneController,
                  Text(
                    "Phone",
                    style: theme.typography.titleSmall,
                  ),
                  prefixIcon: const Icon(Icons.phone)),
              const SizedBox(
                height: 10,
              ),
              formComponents.buildPasswordField(
                  _passwordController,
                  Text(
                    'Password',
                    style: theme.typography.titleSmall,
                  )),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  onPressed: null,
                  color: theme.primary,
                  child: Text(
                    'Sign Up',
                    style: theme.typography.bodyMediumWhite,
                  )),
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
    );
  }
}