import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({Key? key, required this.fnc}) : super(key: key);

  final VoidCallback fnc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          icon: const Icon(Icons.logout),
          label: Text(
            S.of(context).logout,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onPressed: fnc,
        ),
      ),
    );
  }
}
