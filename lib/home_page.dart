import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'featured_venue.dart';
import 'favourite_page.dart';// Import the BookingPage class
import 'categoripage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // categories detail for featured venue page
  final List<Map<String, String>> featuredVenues = [
    {'name': 'Heritage Garden', 'description': 'Beautiful space for events and parties.', 'imagePath': 'assets/images/Heritageg.jpeg'},
    {'name': 'The Everest Hotel', 'description': 'Luxurious venue for special occasions.', 'imagePath': 'assets/images/teh.jpg'},
    {'name': 'The Annapurna Hotel', 'description': 'Spacious hall with stunning views.', 'imagePath': 'assets/images/ha.jpg'},
  ];

  // Define separate lists for each category
  final List<Map<String, String>> weddingVenues = [
    // Wedding venues data
    {
      'name': 'Heritage Garden',
      'description': 'Description :Beautiful space for events and parties.',
      'imagePath': 'assets/images/Heritageg.jpeg'
      // Add more details as needed
    },
    // {
    //   'name': 'Venue 2',
    //   'description': 'Description. Another beautiful venue for weddings.',
    //   'imagePath': 'assets/images/yala.jpeg'
    //   // Add more details as needed
    // },
    // Add more wedding venues as needed
  ];

  final List<Map<String, String>> conferenceVenues = [
    // Conference venues data
    {
      'name': 'The Everest Hotel',
      'description': 'Description: Great place for weddings.',
      'imagePath': 'assets/images/teh.jpg'
      // Add more details as needed
    },
    {
      'name': 'Grand Hotel',
      'description': 'Description. Perfect venue for conference.',
      'imagePath': 'assets/images/gh.jpeg'
    }
  ];


  final List<Map<String, String>> villasVenues = [
    // Villas venues data
    {
      'name': 'The Annapurna Hotel',
      'description': 'Description: Spacious hall with stunning views.',
      'imagePath': 'assets/images/ha.jpg'
      // Add more details as needed
    },
    // {
    //   'name': 'Venue 2',
    //   'description': 'Description. Another beautiful venue for weddings.',
    //   'imagePath': 'assets/images/yala.jpeg'
    //   // Add more details as needed
    // },
    // Add more wedding venues as needed
  ];

  final List<String> categories = ['Wedding', 'Conference', 'Villas'];

  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Venue Jet'),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildFeaturedVenues(),
            _buildCategories(),
            // Add more sections as needed
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search Venues',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedVenues() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Featured Venues',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          items: featuredVenues.map((venue) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    _navigateToBookingPage(context, venue); // Call the method when the venue is tapped
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(venue['imagePath'] ?? 'assets/images/default.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  venue['name'] ?? '',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    favorites.contains(venue['name'] ?? '') ? Icons.favorite : Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _toggleFavorite(venue['name'] ?? '');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              venue['description'] ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _navigateToVenuePage(context, categories[index]);
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Card(
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  // navigate to booking page
  void _navigateToBookingPage(BuildContext context, Map<String, String> venue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeaturedVenuePage.FeaturedVenues(selectedVenue: venue),
      ),
    );
  }
  //navigate to venue page
  void _navigateToVenuePage(BuildContext context, String category) {
    // Navigate to CategoriesPage based on the selected category
    List<Map<String, String>> selectedCategoryVenues = [];
    if (category == 'Wedding') {
      selectedCategoryVenues = weddingVenues;
    } else if (category == 'Conference') {
      selectedCategoryVenues = conferenceVenues;
    } else if (category == 'Villas') {
      selectedCategoryVenues = villasVenues;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoriesPage(category: category, venues: selectedCategoryVenues),
      ),
    );
  }

  //toggle favorite page
  void _toggleFavorite(String venueName) {
    setState(() {
      if (favorites.contains(venueName)) {
        favorites.remove(venueName);
      } else {
        favorites.add(venueName);
      }
    });
  }
// bottom_navigation_bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        // Handle navigation to different tabs based on the index
        if (index == 1) {
          _navigateToFavoritesPage(context);
        }
      },
    );
  }
  //navigate to favorite page
  void _navigateToFavoritesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesPage(favorites: favorites),
      ),
    );
  }
}
