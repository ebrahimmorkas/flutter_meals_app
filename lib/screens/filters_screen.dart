import 'package:flutter/material.dart';
import 'package:meals_app/widgets/single_switch_tile_widget.dart';
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
    bool isGluttenFree = ref.read(gluten_free_meals.notifier).isGluttenFree;
    bool toggleValue = isGluttenFree;
    return Scaffold(
      body: SwitchListTile(
        value: toggleValue,
        onChanged: (bool value) {
          setState(() {
            toggleValue = isGluttenFree;
          });
          ref.read(gluten_free_meals.notifier).toggleGluten(value);
        },
        title: Text('Glutten Free'),
      ),
    );
  }
}
