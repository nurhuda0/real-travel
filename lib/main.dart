import 'package:flutter/material.dart';
import 'detail_page.dart'; // We'll create this later

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Dummy data for trips
  final List<Map<String, dynamic>> trips = [
    {
      'title': 'Bali Private Trip',
      'photo': 'https://picsum.photos/200',
      'price': '\$500',
      'rating': 4.5,
    },
    {
      'title': 'Yogyakarta Open Trip',
      'photo': 'https://picsum.photos/201',
      'price': '\$300',
      'rating': 4.2,
    },
    {
      'title': 'Lombok Adventure',
      'photo': 'https://picsum.photos/202',
      'price': '\$400',
      'rating': 4.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip List'),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(trip['photo'], width: 100, height: 100, fit: BoxFit.cover),
              title: Text(trip['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trip['price']),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' ${trip['rating']}'),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(trip: trip),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}