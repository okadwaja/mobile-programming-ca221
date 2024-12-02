import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAction extends StatelessWidget {
  const PostAction({
    super.key,
    required this.icon,
    required this.label,
    this.onTap, // Tambahkan parameter onTap
  });

  final String icon;
  final String label;
  final VoidCallback? onTap; // Deklarasi onTap

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap, // Panggil onTap ketika ikon diklik
          icon: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              Colors.white70,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}