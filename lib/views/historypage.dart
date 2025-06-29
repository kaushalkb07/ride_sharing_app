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
    print('Tapped index: $index'); // Debug navigation
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
      backgroundColor: const Color(0xFFF5F6F7), // Match HomePage background
      appBar: const ActivityAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cancelled Rides Section
            const Text(
              'Cancelled Rides',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            // 7 Cancelled Ride Items
            ...List.generate(7, (index) {
              // Define dummy data
              final titles = [
                'Kathmandu to Patan',
                'Lalitpur to Bhaktapur',
                'Thamel to Boudha',
                'Kirtipur to Durbar Square',
                'Baneshwor to Swayambhu',
                'Patan to Pashupatinath',
                'Kathmandu to Nagarkot',
              ];
              final pickups = [
                'Kathmandu',
                'Lalitpur',
                'Thamel',
                'Kirtipur',
                'Baneshwor',
                'Patan',
                'Kathmandu',
              ];
              final dropoffs = [
                'Patan',
                'Bhaktapur',
                'Boudha',
                'Durbar Square',
                'Swayambhu',
                'Pashupatinath',
                'Nagarkot',
              ];
              final dates = [
                '2025-06-28',
                '2025-06-27',
                '2025-06-26',
                '2025-06-25',
                '2025-06-24',
                '2025-06-23',
                '2025-06-22',
              ];
              // Unique profile image URLs from pravatar.cc
              final profileImages = [
                'https://i.pravatar.cc/150?img=1',
                'https://i.pravatar.cc/150?img=2',
                'https://i.pravatar.cc/150?img=3',
                'https://i.pravatar.cc/150?img=4',
                'https://i.pravatar.cc/150?img=5',
                'https://i.pravatar.cc/150?img=6',
                'https://i.pravatar.cc/150?img=7',
              ];
              return GestureDetector(
                onTap: () {
                  print('Ride item tapped: ${titles[index]}');
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rider Image
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(profileImages[index]),
                        backgroundColor: Colors.grey,
                        onBackgroundImageError: (exception, stackTrace) {
                          print(
                              'Failed to load image: ${profileImages[index]}');
                        },
                      ),
                      const SizedBox(width: 12),
                      // Ride Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Pickup: ${pickups[index]}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Drop-off: ${dropoffs[index]}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Date: ${dates[index]}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            // Cancelled and Request Again in Bordered Box
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Cancelled',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    print(
                                        'Request Again tapped for ${titles[index]}');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Request Again',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Arrow Icon
                      const Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentIndex,
        onTap: _onBottomBarTap,
      ),
    );
  }
}
