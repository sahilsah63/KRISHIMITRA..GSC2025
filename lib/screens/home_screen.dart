import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/chatbot.dart';
import 'package:flutter_application_1/screens/croprecomandation.dart';
import 'package:flutter_application_1/screens/learning.dart';
import 'package:flutter_application_1/screens/marketplace_screen.dart';
import 'package:flutter_application_1/screens/toolsrent.dart';
import 'package:flutter_application_1/screens/weather_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  

  final List<String> imagePaths = [
    'assets/images/crops.jpeg',
    'assets/images/weather.jpeg',
    'assets/images/market.jpeg',
    'assets/images/tools.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.green[700];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.location_pin, color: Colors.green),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi, Sahil',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Bakshi ka talab, Lucknow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.notifications_none, color: Colors.black),
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(
                  'assets/images/profile.png'), 
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            // Quick Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _quickAction(Icons.qr_code_scanner, "Scan"),
                _quickAction(Icons.calendar_today, "Calender"),
                _quickAction(Icons.science, "Soil Test"),
              ],
            ),
            const SizedBox(height: 16),
            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/banner.jpeg', //asset
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Features",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Features Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
              children: [
                _featureCard(
                    "Crops Recommendation", "assets/images/crops.jpeg", CropsRecommendationScreen(),),
                _featureCard(
                    "Weather Prediction", "assets/images/weather.jpeg", WeatherPredictionScreen(),),
                _featureCard("Market Places", "assets/images/market.jpeg", MarketplaceScreen(),),
                _featureCard("Tools Rent", "assets/images/tools.jpeg", ToolsRentScreen(),),
                _featureCard("Learning Tutorials", "assets/images/learn.png", LearningTutorialsScreen(), ),
                _featureCard("ChatBot", "assets/images/support.png", ChatBotScreen(),),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MarketplaceScreen()),
        );
          });
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "MarketPlace"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "Chatbot"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }

  Widget _quickAction(IconData icon, String label, ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green[100],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green[700]),
        ),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _featureCard(String title, String imagePath, Widget navigateToPage,) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
