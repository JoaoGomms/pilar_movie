import 'package:flutter/material.dart';

import '../../../models/text_model.dart';

class ReleaseDateContainer extends StatelessWidget {
  final String releaseDate;
  
  final TextModel text = TextModel();

  ReleaseDateContainer({super.key, required this.releaseDate});

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
            text.nowPlayingMovies,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            releaseDate,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}