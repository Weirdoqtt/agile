import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sholat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SholatScreen(),
    );
  }
}

class SholatScreen extends StatefulWidget {
  @override
  _SholatScreenState createState() => _SholatScreenState();
}

class _SholatScreenState extends State<SholatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text('Sholat'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStep(
                step: 1,
                title: 'Membaca Niat',
                description:
                    'Baca Niat sholat sebelum atau ketika sedang takbir',
                illustration: Image.asset('assets/niat.png'),
              ),
              _buildStep(
                step: 2,
                title: 'Takbiratul ihram',
                description: '"Allahu Akbar"',
                illustration: Image.asset('assets/takbir.png'),
              ),
              _buildStep(
                step: 3,
                title: 'Membaca doa iftitah',
                description:
                    'الله أكبر كبرًا وَالحَمدُ لِلَّهِ كَثِيرًا وَسُبْحَانَ اللهِ بُكْرَةً وَأَصِيلًا. إِنِّي وَجَهْتُ\nوَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالَّا أَرْضَ حَنِيفًا مُسْلِمًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ .\nإِن صَلَاتِي وَنُسُكِي وَعَيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ . لَا شَرِيكَ لَهُ وَبِذَلِكَ\nأُمِرْتُ وَآنَ مِنَ الْمُسْلِمِينَ.',
                illustration: Image.asset('assets/doa_iftitah.png'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Shalat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on selected item
        },
      ),
    );
  }

  Widget _buildStep({
    required int step,
    required String title,
    required String description,
    required Image illustration,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 20,
                  child: Text(
                    '$step',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Center(child: illustration),
          ],
        ),
      ),
    );
  }
}
