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
  String? _filter = 'Bike'; // Default to Bike

  void _onBottomBarTap(int index) {
    print('Tapped index: $index');
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

  void _onFilterChanged(String? filter) {
    setState(() {
      _filter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define 17 dummy rides
    final allRides = [
      {
        'title': 'Kathmandu to Patan',
        'pickup': 'Kathmandu',
        'dropoff': 'Patan',
        'date': '2025-06-28',
        'type': 'Cancelled',
        'cost': 'NPR 500',
        'profileImage': 'https://i.pravatar.cc/150?img=1',
      },
      {
        'title': 'Lalitpur to Bhaktapur',
        'pickup': 'Lalitpur',
        'dropoff': 'Bhaktapur',
        'date': '2025-06-27',
        'type': 'Cancelled',
        'cost': 'NPR 600',
        'profileImage': 'https://i.pravatar.cc/150?img=2',
      },
      {
        'title': 'Thamel to Boudha',
        'pickup': 'Thamel',
        'dropoff': 'Boudha',
        'date': '2025-06-26',
        'type': 'Bike',
        'cost': 'NPR 300',
        'profileImage': 'https://i.pravatar.cc/150?img=3',
      },
      {
        'title': 'Kirtipur to Durbar Square',
        'pickup': 'Kirtipur',
        'dropoff': 'Durbar Square',
        'date': '2025-06-25',
        'type': 'Bike',
        'cost': 'NPR 350',
        'profileImage': 'https://i.pravatar.cc/150?img=4',
      },
      {
        'title': 'Baneshwor to Swayambhu',
        'pickup': 'Baneshwor',
        'dropoff': 'Swayambhu',
        'date': '2025-06-24',
        'type': 'Car',
        'cost': 'NPR 800',
        'profileImage': 'https://i.pravatar.cc/150?img=5',
      },
      {
        'title': 'Patan to Pashupatinath',
        'pickup': 'Patan',
        'dropoff': 'Pashupatinath',
        'date': '2025-06-23',
        'type': 'Car',
        'cost': 'NPR 700',
        'profileImage': 'https://i.pravatar.cc/150?img=6',
      },
      {
        'title': 'Kathmandu to Nagarkot',
        'pickup': 'Kathmandu',
        'dropoff': 'Nagarkot',
        'date': '2025-06-22',
        'type': 'Cancelled',
        'cost': 'NPR 1000',
        'profileImage': 'https://i.pravatar.cc/150?img=7',
      },
      {
        'title': 'Boudha to Thamel',
        'pickup': 'Boudha',
        'dropoff': 'Thamel',
        'date': '2025-06-21',
        'type': 'Cancelled',
        'cost': 'NPR 450',
        'profileImage': 'https://i.pravatar.cc/150?img=8',
      },
      {
        'title': 'Swayambhu to Lalitpur',
        'pickup': 'Swayambhu',
        'dropoff': 'Lalitpur',
        'date': '2025-06-20',
        'type': 'Cancelled',
        'cost': 'NPR 550',
        'profileImage': 'https://i.pravatar.cc/150?img=9',
      },
      {
        'title': 'Durbar Square to Kirtipur',
        'pickup': 'Durbar Square',
        'dropoff': 'Kirtipur',
        'date': '2025-06-19',
        'type': 'Cancelled',
        'cost': 'NPR 400',
        'profileImage': 'https://i.pravatar.cc/150?img=10',
      },
      {
        'title': 'Pashupatinath to Baneshwor',
        'pickup': 'Pashupatinath',
        'dropoff': 'Baneshwor',
        'date': '2025-06-18',
        'type': 'Cancelled',
        'cost': 'NPR 600',
        'profileImage': 'https://i.pravatar.cc/150?img=11',
      },
      {
        'title': 'Kathmandu to Bhaktapur',
        'pickup': 'Kathmandu',
        'dropoff': 'Bhaktapur',
        'date': '2025-06-17',
        'type': 'Bike',
        'cost': 'NPR 320',
        'profileImage': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'title': 'Lalitpur to Thamel',
        'pickup': 'Lalitpur',
        'dropoff': 'Thamel',
        'date': '2025-06-16',
        'type': 'Bike',
        'cost': 'NPR 340',
        'profileImage': 'https://i.pravatar.cc/150?img=13',
      },
      {
        'title': 'Patan to Boudha',
        'pickup': 'Patan',
        'dropoff': 'Boudha',
        'date': '2025-06-15',
        'type': 'Bike',
        'cost': 'NPR 360',
        'profileImage': 'https://i.pravatar.cc/150?img=14',
      },
      {
        'title': 'Nagarkot to Kathmandu',
        'pickup': 'Nagarkot',
        'dropoff': 'Kathmandu',
        'date': '2025-06-14',
        'type': 'Car',
        'cost': 'NPR 900',
        'profileImage': 'https://i.pravatar.cc/150?img=15',
      },
      {
        'title': 'Bhaktapur to Patan',
        'pickup': 'Bhaktapur',
        'dropoff': 'Patan',
        'date': '2025-06-13',
        'type': 'Car',
        'cost': 'NPR 750',
        'profileImage': 'https://i.pravatar.cc/150?img=16',
      },
      {
        'title': 'Thamel to Swayambhu',
        'pickup': 'Thamel',
        'dropoff': 'Swayambhu',
        'date': '2025-06-12',
        'type': 'Car',
        'cost': 'NPR 700',
        'profileImage': 'https://i.pravatar.cc/150?img=17',
      },
    ];

    // Filter rides based on selected filter
    final filteredRides = _filter == null || _filter == 'Cancelled Rides'
        ? allRides.where((ride) => ride['type'] == 'Cancelled').toList()
        : allRides.where((ride) => ride['type'] == _filter).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      appBar: ActivityAppBar(onFilterChanged: _onFilterChanged),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Section Title
            Text(
              _filter == 'Bike'
                  ? 'Bike Rides'
                  : _filter == 'Car'
                      ? 'Car Rides'
                      : 'Cancelled Rides',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            // Filtered Ride Items
            if (filteredRides.isEmpty)
              const Center(
                child: Text(
                  'No rides found',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            else
              ...filteredRides.asMap().entries.map((entry) {
                final index = entry.key;
                final ride = entry.value;
                return GestureDetector(
                  onTap: () {
                    print('Ride item tapped: ${ride['title']}');
                    Navigator.pushNamed(context, '/ride_details', arguments: ride);
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
                          backgroundImage: NetworkImage(ride['profileImage']!),
                          backgroundColor: Colors.grey,
                          onBackgroundImageError: (exception, stackTrace) {
                            print('Failed to load image: ${ride['profileImage']}');
                          },
                        ),
                        const SizedBox(width: 12),
                        // Ride Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ride['title']!,
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
                                    'Pickup: ${ride['pickup']}',
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
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
                                    'Drop-off: ${ride['dropoff']}',
                                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Date: ${ride['date']}',
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              // Buttons based on ride type
                              Row(
                                children: [
                                  if (ride['type'] == 'Cancelled') ...[
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'Cancelled',
                                        style: TextStyle(fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        print('Request Again tapped for ${ride['title']}');
                                        Navigator.pushNamed(context, '/book_ride', arguments: {
                                          'pickup': ride['pickup'],
                                          'dropoff': ride['dropoff'],
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'Request Again',
                                          style: TextStyle(fontSize: 12, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ] else ...[
                                    GestureDetector(
                                      onTap: () {
                                        print('Rate Now tapped for ${ride['title']}');
                                        Navigator.pushNamed(context, '/rate_ride', arguments: ride['title']);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'Rate Now',
                                          style: TextStyle(fontSize: 12, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        ride['cost']!,
                                        style: const TextStyle(fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Arrow Icon
                        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
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