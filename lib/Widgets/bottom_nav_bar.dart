import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ijob_clone_app/Jobs/upload_job.dart';
import 'package:ijob_clone_app/Search/profile_company.dart';
import 'package:ijob_clone_app/Search/search_companies.dart';
import 'package:ijob_clone_app/user_state.dart';

import '../Jobs/jobs_screen.dart';

class BottomNavigationBarForApp extends StatelessWidget {
  final int indexNum;

  const BottomNavigationBarForApp({super.key, required this.indexNum});

  void _logout(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black45,
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
            content: const Text(
              'Do you want to logout?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  firebaseAuth.signOut();
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const UserState()),
                  );
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.deepOrange.shade400,
      backgroundColor: Colors.blueAccent,
      buttonBackgroundColor: Colors.deepOrange.shade300,
      height: 50,
      index: indexNum,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.bounceInOut,
      items: const [
        Icon(Icons.list, size: 19, color: Colors.black),
        Icon(Icons.search, size: 19, color: Colors.black),
        Icon(Icons.add, size: 19, color: Colors.black),
        Icon(Icons.person_pin, size: 19, color: Colors.black),
        Icon(Icons.exit_to_app, size: 19, color: Colors.black),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(
              builder: (context) {
                return const JobsScreen();
              },
            ),
          );
        }
        if (index == 1) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(
              builder: (context) {
                return const AllWorkersScreen();
              },
            ),
          );
        }
        if (index == 2) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(
              builder: (context) {
                return const UploadJobNow();
              },
            ),
          );
        }
        if (index == 3) {
          Navigator.pushReplacement(
            context,
            CustomPageRoute(
              builder: (context) {
                return const ProfileScreen();
              },
            ),
          );
        }
        if (index == 4) {
          _logout(context);
        }
      },
    );
  }
}

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') {
      return child;
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
