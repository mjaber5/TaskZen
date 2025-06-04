import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.example.com/profile_image.png',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('John Doe'),
            const SizedBox(height: 8),
            Text('@johndoe'),
          ],
        ),
      ),
    );
  }
}
