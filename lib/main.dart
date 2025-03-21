import 'package:flutter/material.dart';
import 'detail_page.dart'; // Import DetailPage
import 'package:flutter_svg/flutter_svg.dart'; // Import SVG support

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/images/real_travel_logo.svg',
                height: 24,
                width: 24,
              ),
              SizedBox(width: 8),
              Text('Real Travel'),
            ],
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> trips = [
    {
      'title': 'Komodo Island Expedition - Open Tour',
      'photo': 'assets/images/komodo_island.webp',
      'price': '\$200',
      'rating': 4.5,
      'description': 'Explore the exotic Komodo Island, home of the legendary '
          'Komodo dragons. Experience breathtaking views and crystal-clear '
          'waters perfect for snorkeling.'
    },
    {
      'title': 'Bromo Sunrise Tour - Private Tour',
      'photo': 'assets/images/bromo_sunrise.webp',
      'price': '\$150',
      'rating': 4.2,
      'description': 'Watch the sun rise over Mount Bromo, one of Indonesia’s '
          'most stunning volcanic landscapes. A perfect trip for adventure '
          'seekers and photographers alike.'
    },
    {
      'title': 'Raja Ampat Diving Escape - Private Tour',
      'photo': 'assets/images/raja_ampat.webp',
      'price': '\$350',
      'rating': 4.7,
      'description': 'Dive into the world-famous Raja Ampat, known for its '
          'vibrant coral reefs and diverse marine life. Ideal for both beginner'
          ' and experienced divers.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Travel Locations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: trip['photo'].startsWith('http')
                        ? Image.network(trip['photo'], width: 100, height: 100, fit: BoxFit.cover)
                        : Image.asset(trip['photo'], width: 100, height: 100, fit: BoxFit.cover),
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
          ),
        ],
      ),
    );
  }
}
