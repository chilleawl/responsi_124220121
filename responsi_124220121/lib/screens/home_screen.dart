import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/amiibo_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Amiibo>> amiibos;

  @override
  void initState() {
    super.initState();
    amiibos = ApiService.fetchAmiibos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nitendo Amiibo'),
      ),
      body: FutureBuilder<List<Amiibo>>(
        future: amiibos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final amiibo = snapshot.data![index];
              return ListTile(
                leading: Image.network(amiibo.imageUrl),
                title: Text(amiibo.name),
                subtitle: Text(amiibo.gameSeries),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(amiibo: amiibo),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
