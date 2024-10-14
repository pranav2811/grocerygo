import 'package:flutter/material.dart';
import 'package:grocerygo/Screens/photo_order.dart';
import 'search_screen.dart';
import 'checkout.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // For bottom navigation bar

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
            _buildCategoriesGrid(),
            const SizedBox(height: 20),
            _buildFeaturedProductsList(),
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
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deliver to',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
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
        enabled: false,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          hintText: 'Search for products...',
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
              'https://images.unsplash.com/photo-1516684669134-de6f85e0f1b8'),
          _buildBanner(
              'https://images.unsplash.com/photo-1498579809087-ef1e558fd1dc'),
          _buildBanner(
              'https://images.unsplash.com/photo-1556912167-f556f1c44f4c'),
        ],
      ),
    );
  }

  Widget _buildBanner(String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shop by Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildCategoryItem(
                  'https://images.unsplash.com/photo-1579613833672-f1d1a81a7b9e',
                  'Fruits & Vegetables'),
              _buildCategoryItem(
                  'https://images.unsplash.com/photo-1599639958261-7b747867bb5c',
                  'Dairy & Eggs'),
              _buildCategoryItem(
                  'https://images.unsplash.com/photo-1532635245-91008b5b24b7',
                  'Bakery'),
              _buildCategoryItem(
                  'https://images.unsplash.com/photo-1514515020721-3c8a2fabe870',
                  'Meat & Seafood'),
              _buildCategoryItem(
                  'https://images.unsplash.com/photo-1566843974233-4314a1ea3a0d',
                  'Snacks & Beverages'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imageUrl, String label) {
    return Column(
      children: [
        Flexible(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeaturedProductsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildFeaturedProductItem(
              'https://images.unsplash.com/photo-1586201375761-83865001a0d5',
              'Fresh Vegetables'),
          _buildFeaturedProductItem(
              'https://images.unsplash.com/photo-1543353071-873f17a7a088',
              'Premium Meat'),
          _buildFeaturedProductItem(
              'https://images.unsplash.com/photo-1533777324565-a040eb52fac1',
              'Baked Goods'),
        ],
      ),
    );
  }

  Widget _buildFeaturedProductItem(String imageUrl, String label) {
    int quantity = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      if (quantity > 0) {
                        setState(() => quantity--);
                      }
                    },
                  ),
                  Text('$quantity'),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() => quantity++);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.grey,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        if (value == 0) {
          // Stay on Home
        } else if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PhotoOrderPage()),
          );
        } else if (value == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckoutPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Scan',
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
