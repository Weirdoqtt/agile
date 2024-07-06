import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niat Sholat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Niat Sholat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    SholatScreen(title: 'Subuh', niat: 'أُصَلِّي فَرْضَ الصُّبْحِ رَكَعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لِلَّهِ تَعَالَى', artinya: 'Ushalli fardlosh shubhi rak\'ataini mustaqbilal qiblati adaaan lillahi ta\'alaa.',),
    SholatScreen(title: 'Dzuhur', niat: 'أَصَلَّى فَرْضَ الظهْرِ أَرْبَعَ رَكَعَاتٍ مُسْتَقْبِلَ الْقِبْلَةِ اداء مامُومًا لِلَّهِ تَعَالَى', artinya: 'Ushallii fardhazh zhuhri arba\'a raka\'aatin mustaqbilal qiblati adaa\'an lillaahi ta\'aalaa',),
    SholatScreen(title: 'Ashar', niat: 'أُصَلِّي فَرْضَ العَصْرِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لِلَّهِ تَعَالَى', artinya: 'Ushalli fardhal \'ashri arba\'a raka\'aatain mustaqbilal qiblati adaa-an lillahi ta\'aala',),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green[600],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement your back button logic here
          },
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Subuh',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Dzuhur',