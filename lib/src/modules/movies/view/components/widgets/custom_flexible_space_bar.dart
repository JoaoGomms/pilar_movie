import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomFlexibleSpaceBar extends StatelessWidget {
  final String posterUrl;

  const CustomFlexibleSpaceBar({super.key, 
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Image.network(
          posterUrl,
          filterQuality: FilterQuality.high,
          fit: kIsWeb ? BoxFit.contain : BoxFit.cover,
        ),
      ),
    );
  }
}
