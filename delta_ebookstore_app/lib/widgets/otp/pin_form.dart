import 'dart:convert';

import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 =
      TextEditingController(); // Input to verify OTP// Specify email or phone verification

  PinForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verification Sent',
                        style: theme.typography.headlineMedium,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is OtpPending) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'We have sent the verification code to your ${state.signedUpwithPhone ? 'phone number' : 'email'}: ${state.phoneOrEmail}',
                            style: theme.typography.titleSmall,
                            maxLines: 10,
                          ),
                        );
                      }
                      return Text('Something went wrong!',
                          style: theme.typography.headlineMedium);
                    },
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _otpTextField(context, pin1),
                      _otpTextField(context, pin2),
                      _otpTextField(context, pin3),
                      _otpTextField(context, pin4),
                    ],
                  ),
                  const SizedBox(height: 100),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final otpCode =
                                "${pin1.text}${pin2.text}${pin3.text}${pin4.text}";
                            if (state is OtpPending) {
                              context.read<AuthCubit>().validateOtp(
                                    state.phoneOrEmail,
                                    otpCode,
                                    "REGISTRATION_OTP",
                                  );
                            }
                          }
                        },
                        color: theme.primary,
                        child: state is Authenticating
                            ? CircularProgressIndicator(
                                color: theme.primary,
                              )
                            : Text(
                                'Verify',
                                style: theme.typography.labelMedium,
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, TextEditingController controller) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headlineSmall,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        decoration: const InputDecoration(
          hintText: '0',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
