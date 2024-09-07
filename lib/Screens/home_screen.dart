import 'package:flutter/material.dart';
import 'search_screen.dart'; // Import the SearchScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the search screen when search bar is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              child: _buildSearchBar(),
            ),
            const SizedBox(height: 20),
            _buildPromotionalBanner(),
            const SizedBox(height: 20),
            _buildCategoriesSection(),
            const SizedBox(height: 20),
            _buildRestaurantsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false, // Remove the back arrow
      title: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Align with the search bar
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            const Text(
              'Deliver to',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.orangeAccent),
                SizedBox(width: 5),
                Text(
                  'Current Location',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        enabled: false, // Disable text input to only allow click action
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          hintText: 'Search for restaurants, groceries...',
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PageView(
        children: [
          _buildBanner(
              'https://cdn.grabon.in/gograbon/images/merchant/1610000375685.png'), // Grocery discount image
          _buildBanner(
              'https://cdn.pixabay.com/photo/2016/11/23/14/45/beef-1851441_960_720.jpg'), // Another promo
          _buildBanner(
              'https://cdn.pixabay.com/photo/2017/12/09/08/18/sushi-3007395_960_720.jpg'), // Sushi promo
        ],
      ),
    );
  }

  Widget _buildBanner(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Explore Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryItem(
                  'https://cdn.pixabay.com/photo/2017/06/02/18/24/cherry-2367023_960_720.jpg',
                  'Groceries'),
              _buildCategoryItem(
                  'https://cdn.pixabay.com/photo/2015/04/10/00/41/food-715542_960_720.jpg',
                  'Restaurants'),
              _buildCategoryItem(
                  'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_960_720.jpg',
                  'Snacks'),
              _buildCategoryItem(
                  'https://cdn.pixabay.com/photo/2017/06/23/19/29/milk-2434157_960_720.jpg',
                  'Dairy Products'),
              _buildCategoryItem(
                  'https://cdn.pixabay.com/photo/2015/09/30/12/16/juice-965860_960_720.jpg',
                  'Beverages'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String imageUrl, String label) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popular Restaurants',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            _buildRestaurantItem(
                'https://cdn.pixabay.com/photo/2016/11/18/15/52/pizza-1838548_960_720.jpg',
                'Pizzeria',
                '4.5',
                'Italian'),
            _buildRestaurantItem(
                'https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_960_720.jpg',
                'Burger Hub',
                '4.3',
                'Fast Food'),
            _buildRestaurantItem(
                'https://cdn.pixabay.com/photo/2016/11/29/09/32/food-1869716_960_720.jpg',
                'Sushi House',
                '4.8',
                'Japanese'),
          ],
        ),
      ],
    );
  }

  Widget _buildRestaurantItem(
      String imageUrl, String name, String rating, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  '$category · $rating ★',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
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
    );
  }
}
