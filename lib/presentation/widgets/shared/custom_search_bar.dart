import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cats_flutter_app/presentation/providers/breeds/breeds_providers.dart';

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          onChanged: (value) {
            ref.read(searchTextProvider.notifier).state = value;
          },
          decoration: const InputDecoration(
            hintText: 'Buscar...',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
          ),
        ),
      ),
    );
  }

}