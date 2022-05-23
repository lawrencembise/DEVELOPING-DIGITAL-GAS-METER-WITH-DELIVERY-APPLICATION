import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';

class SidebarItem extends StatelessWidget {
  String title;
  IconData icon;

  SidebarItem({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF58BE3F),
                    Color(0xFF4048BF),
                  ],
                ),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: sidebarText,
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
