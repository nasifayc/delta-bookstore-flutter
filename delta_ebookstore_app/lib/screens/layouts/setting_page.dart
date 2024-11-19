import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/setting/user_info.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: theme.typography.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const UserInfo(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1,
                  color: theme.primary.withOpacity(0.3),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person_outline_rounded,
                  color: theme.primary,
                ),
                title: Text(
                  'Account',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('Manage your account',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  // Navigate to Account Settings screen
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.widgets_outlined,
                  color: theme.primary,
                ),
                title: Text(
                  'Preferences',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('Customize features',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  // Navigate to Account Settings screen
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.history,
                  color: theme.primary,
                ),
                title: Text(
                  'Purchase History',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('Track your Transactions',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  // Navigate to Account Settings screen
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1,
                  color: theme.primary.withOpacity(0.3),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: theme.primary,
                ),
                title: Text(
                  'Help',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('Support center',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  // Navigate to Account Settings screen
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: theme.primary,
                ),
                title: Text(
                  'Share',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('Share the app with your friends',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  // Navigate to Account Settings screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
