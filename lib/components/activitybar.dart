import 'package:flutter/material.dart';

class ActivityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActivityAppBar({super.key});

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
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 2.0), // Further reduced vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ride History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10), // Reduced spacing
              Row(
                children: [
                  _buildButton(context, 'Bike', false),
                  const SizedBox(width: 8),
                  _buildButton(context, 'Car', false),
                  const SizedBox(width: 8),
                  _buildButton(context, 'Rental', false),
                  const SizedBox(width: 8),
                  _buildButton(context, 'Cancelled Rides', true),
                ],
              ),
              const SizedBox(height: 10), // Reduced spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, bool isBike) {
    return GestureDetector(
      onTap: () {
        print('$label button pressed');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 4), // Reduced padding
        decoration: BoxDecoration(
          color: isBike ? Colors.black : Colors.white,
          border: isBike ? null : Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12, // Reduced font size
            color: isBike ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(96); // Increased to cover 5.8-pixel overflow
}
