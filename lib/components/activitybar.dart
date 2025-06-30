import 'package:flutter/material.dart';

class ActivityAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String?) onFilterChanged;

  const ActivityAppBar({super.key, required this.onFilterChanged});

  @override
  ActivityAppBarState createState() => ActivityAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(96);
}

class ActivityAppBarState extends State<ActivityAppBar> {
  String? _selectedFilter = 'Bike'; // Default to Bike

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Ride History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildButton(context, 'Bike', _selectedFilter == 'Bike'),
                  const SizedBox(width: 8),
                  _buildButton(context, 'Car', _selectedFilter == 'Car'),
                  const SizedBox(width: 8),
                  _buildButton(context, 'Cancelled Rides', _selectedFilter == 'Cancelled Rides'),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
        print('$label button pressed');
        widget.onFilterChanged(_selectedFilter);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: isSelected ? null : Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}