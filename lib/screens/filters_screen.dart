import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/gluten_free_meals_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    // Variable assignment for glutten
    bool isGluttenFree = ref.read(gluten_free_meals.notifier).isGluttenFree;
    bool gluttenToggleValue = isGluttenFree;
    return Scaffold(
      body: Column(
        children: [
          SwitchListTile(
            value: gluttenToggleValue,
            onChanged: (bool value) {
              setState(() {
                gluttenToggleValue = isGluttenFree;
              });
              ref.read(gluten_free_meals.notifier).toggleGluten(value);
            },
            title: Text('Glutten Free'),
          ),
        ],
      ),
    );
  }
}
