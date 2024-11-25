import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/core/api_url.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Column(
            children: [
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Ensures the container is circular
                    image: DecorationImage(
                      image: state.user.profilePicture == null ||
                              state.user.profilePicture!.isEmpty
                          ? const AssetImage(
                              "assets/images/boy.png") // Placeholder image
                          : NetworkImage(
                              '${ApiUrl.userProfileImageUrl}${state.user.profilePicture}'),
                      fit: BoxFit
                          .cover, // Ensures the image covers the circle properly
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.user.name,
                style: theme.typography.headlineMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                state.user.phone ?? state.user.email!,
                style: theme.typography.titleSmall,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }
        return Center(
          child: Text(
            'Sign in Required!',
            style: theme.typography.headlineSmall,
          ),
        );
      },
    );
  }
}
