import 'package:flutter/material.dart';
import '../models/amiibo_model.dart';

class DetailScreen extends StatelessWidget {
  final Amiibo amiibo;

  const DetailScreen({super.key, required this.amiibo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(amiibo.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(amiibo.imageUrl),
            const SizedBox(height: 16),
            Text(amiibo.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(amiibo.gameSeries,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: amiibo.details.entries.map((entry) {
                  return ListTile(
                    title: Text(entry.key),
                    subtitle: Text(entry.value.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
