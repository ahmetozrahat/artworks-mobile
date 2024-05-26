import 'package:flutter/material.dart';

class ArtworksPage extends StatefulWidget {
  const ArtworksPage({super.key});

  static const String routeName = 'artworks_page';

  @override
  State<ArtworksPage> createState() => _ArtworksPageState();
}

class _ArtworksPageState extends State<ArtworksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Artworks App"),
      ),
    );
  }
}