import 'package:flutter/material.dart';
import 'package:ride_sharing_app/components/activitybar.dart';
import 'package:ride_sharing_app/components/bottombar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _currentIndex = 1;

  void _onBottomBarTap(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        // Already on HistoryPage
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/offers');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ActivityAppBar(),
      body: const Center(
        child: Text(
          'History Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: _onBottomBarTap,
      ),
    );
  }
}
