import 'package:favorite_places/providers/user_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_place.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlaceProvider);

    void _addPlace() {
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
        return const AddPlaceScreen();
      })));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: PlaceList(places: userPlaces),
    );
  }
}
