import 'package:flutter/material.dart';
import '../utils/navigation_helper.dart';

/// Header cu imagine pentru detaliile rețetei.
class RecipeImageHeader extends StatelessWidget {
  final String image;

  const RecipeImageHeader({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _HeaderImage(image: image),
        const _BackButton(),
      ],
    );
  }
}

// ========== WIDGET-URI PRIVATE ==========

class _HeaderImage extends StatelessWidget {
  final String image;

  const _HeaderImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 280,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => NavigationHelper.goBack(context),
        ),
      ),
    );
  }
}
