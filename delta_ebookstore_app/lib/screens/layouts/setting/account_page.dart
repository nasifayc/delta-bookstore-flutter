import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Manage Account',
          style: theme.typography.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.edit,
                  color: theme.primary,
                ),
                title: Text(
                  'Edit Account',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('username, profile, email, phone',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/edit-account');
                  // Navigate to Account Settings screen
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.security,
                  color: theme.primary,
                ),
                title: Text(
                  'Change Password',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('reset, change, password',
                    style: theme.typography.titleSmall
                        .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
                trailing: Icon(
                  Icons.arrow_right,
                  color: theme.primary,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/change-password');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.delete_sweep_outlined,
                  color: theme.primary,
                ),
                title: Text(
                  'Delete Account',
                  style: theme.typography.titleSmall
                      .copyWith(color: theme.primary),
                ),
                subtitle: Text('Remove your account from this app',
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
