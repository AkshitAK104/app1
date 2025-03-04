import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomeScreen(),
    );
  }
}

class WeatherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Current weather section
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Location',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Monday, Sep 9', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text('25°C',
                    style:
                        TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                Text('Sunny', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          // Hourly forecast section
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 24, // Example for 24 hours
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('${index + 1}h', style: TextStyle(fontSize: 16)),
                      Icon(Icons.wb_sunny, size: 40),
                      Text('22°C', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              },
            ),
          ),
          // Daily forecast section
          Expanded(
            child: ListView.builder(
              itemCount: 7, // Example for 7 days
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('Day ${index + 1}'),
                    subtitle: Text('High: 30°C, Low: 20°C'),
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
