import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);

  void addPlace(String title) {
    state = [...state, Place(title: title)];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlaceNotifier, List<Place>>((ref) {
  return UserPlaceNotifier();
});
