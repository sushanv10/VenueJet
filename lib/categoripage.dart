import 'package:flutter/material.dart';
import 'venue_detail.dart';

class CategoriesPage extends StatelessWidget {
  final String category;
  final List<Map<String, String>> venues;

  CategoriesPage({required this.category, required this.venues});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: venues.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(context, venues[index]);
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Map<String, String> venue) {
    return GestureDetector(
      onTap: () {
        _navigateToVenueDetailPage(context, venue);
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          height: 250.0, // Set the height as needed
          width: 250.0,  // Set the width as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  venue['imagePath'] ?? 'assets/images/default.jpg',
                  height: 150.0, // Adjust the height of the image as needed
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      venue['name'] ?? '',
                      style: TextStyle(
                        fontSize: 18.0, // Increase the font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0), // Adjust the space between text and description
                    Text(
                      venue['description'] ?? '',
                      style: TextStyle(fontSize: 16.0), // Increase the font size as needed
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToVenueDetailPage(BuildContext context, Map<String, String> venue) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VenueDetailPage(selectedVenue: venue),
        ),
      );
    }

  }

