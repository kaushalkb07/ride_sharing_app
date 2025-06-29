import 'package:flutter/material.dart';

class CustomHamburgerIcon extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomHamburgerIcon({
    super.key,
    this.width = 28,
    this.height = 20,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final lineHeight = height / 6;
    final lineSpacing = lineHeight;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: width, height: lineHeight, color: color),
          SizedBox(height: lineSpacing),
          Container(width: width, height: lineHeight, color: color),
          SizedBox(height: lineSpacing),
          Container(width: width * 0.5, height: lineHeight, color: color),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? profileImage;

  const CustomAppBar({
    super.key,
    required this.title,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                icon: const CustomHamburgerIcon(color: Colors.black),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Welcome, ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: '!',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: profileImage ??
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      backgroundColor: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Drawer included in CustomAppBar
  Widget get drawer => Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Settings')),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
