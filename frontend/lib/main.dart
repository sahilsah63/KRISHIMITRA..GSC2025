import 'package:flutter/material.dart';

void main() {
  runApp(KrishiMitraApp());
}

class KrishiMitraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KrishiMitra',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, Shiva", style: TextStyle(fontSize: 18, color: Colors.black)),
                Text("Bakshi ka talab, Lucknow", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            CircleAvatar(backgroundColor: Colors.grey.shade300),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  QuickButton(icon: Icons.qr_code, label: 'Scan'),
                  QuickButton(icon: Icons.calendar_today, label: 'Calender'),
                  QuickButton(icon: Icons.science, label: 'Soil Test'),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: NetworkImage(''),
                  fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Features', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  FeatureCard(title: 'Crops Recommendation', img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.csm.tech%2Fblog-details%2Fwhy-you-need-agritech-for-food-security-farmers-empowerment&psig=AOvVaw0_HDOs-KsD4fl5f4TyYKYR&ust=1744015091939000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPizptWAw4wDFQAAAAAdAAAAABAJ'),
                  FeatureCard(title: 'Weather Prediction', img: 'https://www.google.com/imgres?q=weather%20prediction&imgurl=https%3A%2F%2Fwww.gconnect.in%2Fgc22%2Fwp-content%2Fuploads%2F2024%2F09%2Fimd-weather-forecast.jpg&imgrefurl=https%3A%2F%2Fwww.gconnect.in%2Fnews%2Fimd-current-weather-status-and-extended-range-forecast-for-next-two-weeks-5-18-sept-2024.html&docid=dXLowz_EA0KgNM&tbnid=Wo6imLx4YfsklM&vet=12ahUKEwig0_LtgMOMAxWz6TQHHaIpB2gQM3oECDAQAA..i&w=739&h=415&hcb=2&ved=2ahUKEwig0_LtgMOMAxWz6TQHHaIpB2gQM3oECDAQAA'),
                  FeatureCard(title: 'Market Places', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj4nwGRpMT7atswHGFjYGXUjMOzO1dDbtLKd81elljCEd4rL85lVslFmDq6n0aRz1hm7U&usqp=CAU'),
                  //FeatureCard(title: 'Tools Rent', img: 'https://via.placeholder.com/150x100?text=Tools'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}

class QuickButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 30, color: Colors.green),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black))
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String img;

  const FeatureCard({required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(8),
      child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
