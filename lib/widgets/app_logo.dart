import 'package:flutter/material.dart';

/// Logo-ul aplicației – modern, atractiv, cu efect de glow.
class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 🔥 Glow exterior
        Container(
          width: size * 1.15,
          height: size * 1.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                // ignore: deprecated_member_use
                Colors.orange.withOpacity(0.35),
                Colors.transparent,
              ],
            ),
          ),
        ),

        // 🟠 Ring exterior
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade200,
                Colors.deepOrange.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.deepOrange.withOpacity(0.45),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ],
          ),
        ),

        // 🔥 Cerc interior
        Container(
          width: size * 0.78,
          height: size * 0.78,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.orange.shade100,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              '🔥',
              style: TextStyle(
                fontSize: size * 0.45,
                shadows: [
                  Shadow(
                    // ignore: deprecated_member_use
                    color: Colors.deepOrange.withOpacity(0.4),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
