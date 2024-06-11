import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ijob_clone_app/Jobs/upload_job.dart';
import 'package:ijob_clone_app/Search/search_companies.dart';

import '../Jobs/jobs_screen.dart';

class BottomNavigationBarForApp extends StatelessWidget {
  final int indexNum;

  const BottomNavigationBarForApp({super.key, required this.indexNum});

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
