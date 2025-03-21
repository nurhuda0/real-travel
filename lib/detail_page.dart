import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> trip;

  DetailPage({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(trip['photo'], height: 200, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(trip['title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Text(' ${trip['rating']}'),
                ],
              ),
              SizedBox(height: 16),
              Text('Summary:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              SizedBox(height: 16),
              Text('Price: ${trip['price']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text('Includes:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('- Accommodation\n- Meals\n- Transportation'),
              SizedBox(height: 16),
              Text('Terms & Conditions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('1. No refunds.\n2. Must bring ID.'),
            ],
          ),
        ),
      ),
    );
  }
}