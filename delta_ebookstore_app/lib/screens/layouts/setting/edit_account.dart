import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/auth/auth_state.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/widgets/setting/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  void initState() {
    super.initState();
    _initializ();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  void _initializ() {
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

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit',
          style: theme.typography.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: theme.typography.titleSmall.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal)),
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
                          style: theme.typography.titleSmall.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal)),
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
                        Icons.delete_sweep_outlined,
                        color: theme.primary,
                      ),
                      title: Text(
                        'Delete Account',
                        style: theme.typography.titleSmall
                            .copyWith(color: theme.primary),
                      ),
                      subtitle: Text('Remove your account from this app',
                          style: theme.typography.titleSmall.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal)),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: theme.primary,
                      ),
                      onTap: () {
                        // Navigate to Account Settings screen
                      },
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
    );
  }
}
