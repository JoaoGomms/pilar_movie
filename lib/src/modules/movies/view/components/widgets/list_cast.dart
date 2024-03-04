import 'package:flutter/material.dart';

import '../../../data/services/constants.dart';

class ListCast extends StatelessWidget {
  const ListCast({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data![index].profilePath}',
                      semanticLabel: snapshot.data![index].name,
                      errorBuilder: (context, error, stackTrace) => Container(
                        child: Image.asset(
                          'lib/assets/no_picture.jpg',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${snapshot.data[index].name}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
