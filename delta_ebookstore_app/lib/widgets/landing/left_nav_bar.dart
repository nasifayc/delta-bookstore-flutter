import 'dart:developer';

import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/controllers/theme/theme_cubit.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Drawer(
      backgroundColor: theme.primaryBackground,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    state.user.name,
                    style: theme.typography.headlineMedium,
                  ),
                  accountEmail: Text(
                    state.user.phone ?? state.user.email!,
                    style: theme.typography.headlineSmall,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: theme.tertiary,
                    child: ClipOval(
                      child: Image.asset('assets/images/boy.png'),
                    ),
                  ),
                  decoration: BoxDecoration(color: theme.primaryBackground),
                );
              }
              return Center(
                child: Text(
                  'Sign In Required',
                  style: theme.typography.headlineSmall,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: theme.primary,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.card_giftcard_outlined,
              color: theme.primary,
            ),
            title: Text(
              'Gifts',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_outline_rounded,
              color: theme.primary,
            ),
            title: Text(
              'Wishlist',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.download,
              color: theme.primary,
            ),
            title: Text(
              'Downloads',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: theme.primary,
              thickness: 1,
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              return ListTile(
                leading: Icon(
                  state == ThemeMode.dark ? Icons.wb_sunny : Icons.dark_mode,
                  color: theme.primary,
                ),
                title: Text(
                  state == ThemeMode.dark ? 'Light Mode' : 'Dark Mode',
                  style: theme.typography.headlineSmall.copyWith(fontSize: 16),
                ),
                onTap: () {
                  final isDarkMode = state == ThemeMode.dark;
                  log(isDarkMode.toString()); // Access state
                  context
                      .read<ThemeCubit>()
                      .toggleTheme(!isDarkMode); // Toggle the theme
                },
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: theme.primary,
            ),
            title: Text(
              'Settings',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: theme.primary,
            ),
            title: Text(
              'About Us',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              color: theme.primary,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: theme.primary,
            ),
            title: Text(
              'Logout',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const Onboarding()), // Your main screen widget
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
