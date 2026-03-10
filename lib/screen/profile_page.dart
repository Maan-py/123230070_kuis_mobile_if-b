import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // final String nama;
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"), backgroundColor: Colors.blue),
      body: Center(child: Text("Selamat datang luqmaan")),
    );
  }
}
