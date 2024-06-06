import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ijob_clone_app/user_state.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs Screen'),
        centerTitle: false,
      ),
      body: ElevatedButton(
          onPressed: () {
            _firebaseAuth.signOut();
            Navigator.canPop(context) ? Navigator.pop(context) : null;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const UserState(),
              ),
            );
          },
          child: const Text('Logout')),
    );
  }
}
