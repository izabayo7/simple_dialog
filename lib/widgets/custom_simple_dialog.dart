import 'package:flutter/material.dart';
import '../models/user_model.dart';

class CustomSimpleDialog extends StatelessWidget {
  final UserModel user;
  final Function(String) onOptionSelected;

  const CustomSimpleDialog({
    super.key,
    required this.user,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  user.name.substring(0, 2).toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.email,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              SimpleDialogOption(
                onPressed: () => onOptionSelected('View Profile'),
                child: const Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.blue),
                    SizedBox(width: 16),
                    Text('View Profile'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () => onOptionSelected('Edit Profile'),
                child: const Row(
                  children: [
                    Icon(Icons.edit_outlined, color: Colors.green),
                    SizedBox(width: 16),
                    Text('Edit Profile'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () => onOptionSelected('Settings'),
                child: const Row(
                  children: [
                    Icon(Icons.settings_outlined, color: Colors.grey),
                    SizedBox(width: 16),
                    Text('Settings'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () => onOptionSelected('Sign Out'),
                child: const Row(
                  children: [
                    Icon(Icons.logout_outlined, color: Colors.red),
                    SizedBox(width: 16),
                    Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
