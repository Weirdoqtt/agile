import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wudhu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WudhuScreen(),
    );
  }
}

class WudhuScreen extends StatefulWidget {
  @override
  _WudhuScreenState createState() => _WudhuScreenState();
}

class _WudhuScreenState extends State<WudhuScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Actions when back button is pressed.
          },
        ),
        title: Center(child: Text('Wudhu')),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[700],
              Colors.green[400],
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stepper(
            currentStep: _currentStep,
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            onStepContinue: () {
              if (_currentStep < 3) {
                setState(() {
                  _currentStep++;
                });
              }
            },
            steps: [
              Step(
                title: Text('Membaca Niat'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nawaytul wudhū\'a lillāhi ta\'ālā.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'نَوَيْتُ الْوُضُوءَ لِلَّهِ تَعَالَى',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Basuh Kedua Tangan'),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/step2_left.png'),
                    Image.asset('assets/images/step2_right.png'),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Berkumur'),
                content: Image.asset('assets/images/step3.png'),
                isActive: _currentStep >= 2,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Basuh Hidung'),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/step4_left.png'),
                    Image.asset('assets/images/step4_right.png'),
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
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
            icon: Icon(Icons.prayer_times),
            label: 'Shalat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Wudhu',
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
        currentIndex: 2, // Set the current index to 2 for the Wudhu screen
        onTap: (index) {
          // Actions when an item is tapped.
        },
      ),
    );
  }
}
