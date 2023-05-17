import 'package:favorite_places/providers/user_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    if (_formKey.currentState!.validate()) {
      ref.read(userPlaceProvider.notifier).addPlace(_titleController.text);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              //Image input
              const ImageInput(),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  onPressed: _savePlace,
                  label: const Text('Add Place'))
            ],
          ),
        ),
      ),
    );
  }
}
