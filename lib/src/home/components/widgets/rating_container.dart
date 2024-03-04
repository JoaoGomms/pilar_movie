import 'package:flutter/material.dart';

import '../../../models/text_model.dart';

class RatingContainer extends StatelessWidget {
  final double rating;
  final TextModel text = TextModel();

  RatingContainer({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            text.avaliation,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '${rating.toStringAsFixed(1)}/10',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}