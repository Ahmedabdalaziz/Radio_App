import 'package:flutter/material.dart';

class ColorSchemePreview extends StatelessWidget {
  const ColorSchemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("ColorScheme Preview")),
      body: ListView(
        children: [
          buildColorTile("Primary", scheme.primary, scheme.onPrimary),
          buildColorTile("Secondary", scheme.secondary, scheme.onSecondary),
          buildColorTile("Tertiary", scheme.tertiary, scheme.onTertiary),
          buildColorTile("Background", scheme.background, scheme.onBackground),
          buildColorTile("Surface", scheme.surface, scheme.onSurface),
          buildColorTile("Error", scheme.error, scheme.onError),
        ],
      ),
    );
  }

  Widget buildColorTile(String name, Color bg, Color fg) {
    return Container(
      height: 60,
      color: bg,
      alignment: Alignment.center,
      child: Text(
        name,
        style: TextStyle(color: fg, fontWeight: FontWeight.bold),
      ),
    );
  }
}
