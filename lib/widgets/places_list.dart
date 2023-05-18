import 'package:flutter/material.dart';

import '../models/place.dart';
import '../screens/place_detail.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places yet, start adding some!'),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return PlaceDetailScreen(place: places[index]);
            }));
          },
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          subtitle: places[index].location.address == null
              ? null
              : Text(places[index].location.address!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
        );
      },
    );
  }
}
