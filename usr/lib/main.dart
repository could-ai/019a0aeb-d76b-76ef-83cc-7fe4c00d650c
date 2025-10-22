import 'package:flutter/material.dart';

void main() {
  runApp(const DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery App'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Restaurants',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  RestaurantCard(
                    name: 'Pizza Palace',
                    cuisine: 'Italian',
                    rating: 4.5,
                    deliveryTime: '25-30 min',
                  ),
                  RestaurantCard(
                    name: 'Burger Joint',
                    cuisine: 'American',
                    rating: 4.2,
                    deliveryTime: '20-25 min',
                  ),
                  RestaurantCard(
                    name: 'Sushi Express',
                    cuisine: 'Japanese',
                    rating: 4.7,
                    deliveryTime: '30-35 min',
                  ),
                  RestaurantCard(
                    name: 'Taco Fiesta',
                    cuisine: 'Mexican',
                    rating: 4.3,
                    deliveryTime: '15-20 min',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          // TODO: Navigate to different screens
        },
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
  });

  final String name;
  final String cuisine;
  final double rating;
  final String deliveryTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.restaurant, size: 40),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(cuisine, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('$rating'),
                      const SizedBox(width: 16),
                      Icon(Icons.access_time, size: 16),
                      Text(deliveryTime),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}