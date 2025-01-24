import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/gluten_free_meals_provider.dart';

class SingleSwitchTileWidget extends ConsumerStatefulWidget {
  const SingleSwitchTileWidget({super.key, required this.title});

  final String title;

  @override
  ConsumerState<SingleSwitchTileWidget> createState() =>
      _SingleSwitchTileWidgetState();
}

class _SingleSwitchTileWidgetState
    extends ConsumerState<SingleSwitchTileWidget> {
  @override
  Widget build(BuildContext context) {
    bool isGluttenFree = ref.read(gluten_free_meals.notifier).isGluttenFree;
    bool toggleValue = isGluttenFree;
    return SwitchListTile(
      value: toggleValue,
      onChanged: (bool value) {
        setState(() {
          toggleValue = isGluttenFree;
        });
        ref.read(gluten_free_meals.notifier).toggleGluten(value);
      },
      title: Text(widget.title),
    );
  }
}
