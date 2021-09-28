import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/auth_services.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<AuthServices>(
          builder: (context, auth, child) {
            return Column(
              children: [
                TextButton(
                  child: const Text('Sign Out'),
                  onPressed: () {
                    auth.logout();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
