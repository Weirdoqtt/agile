import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surah App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Surah App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Implementasi untuk pencarian
          },
        ),
        actions: [
          // Tombol pengaturan (jika perlu)
          // IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Container(
        color: Colors.green[200], // Background hijau muda
        child: ListView.builder(
          itemCount: 8, // Jumlah surah
          itemBuilder: (context, index) {
            return SurahItem(
              nomor: index + 1,
              nama: _getSurahNama(index + 1),
              ayat: _getSurahAyat(index + 1),
              lokasi: _getSurahLokasi(index + 1),
            );
          },
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
            label: 'Surah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementasi untuk membuka menu surah
        },
        child: Icon(Icons.menu_book),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Fungsi untuk mendapatkan nama surah
  String _getSurahNama(int nomor) {
    switch (nomor) {
      case 1:
        return 'Al-Fatihah';
      case 2:
        return 'Al-Baqarah';
      case 3:
        return 'Al \'Imran';
      case 4:
        return 'An-Nisa';
      case 5:
        return 'Al-Mai\'dah';
      case 6:
        return 'Al-An\'am';
      case 7:
        return 'Al-Araf';
      case 8:
        return 'Al-Anfal';
      default:
        return 'Surah $nomor';
    }
  }

  // Fungsi untuk mendapatkan jumlah ayat surah
  int _getSurahAyat(int nomor) {
    switch (nomor) {
      case 1:
        return 7;
      case 2:
        return 286;
      case 3:
        return 200;
      case 4:
        return 176;
      case 5:
        return 120;
      case 6:
        return 165;
      case 7:
        return 206;
      case 8:
        return 75;
      default:
        return 0;
    }
  }

  // Fungsi untuk mendapatkan lokasi surah
  String _getSurahLokasi(int nomor) {
    switch (nomor) {
      case 1:
      case 4:
      case 6:
      case 7:
        return 'Mekah';
      default:
        return 'Madinah';
    }
  }
}

class SurahItem extends StatelessWidget {
  final int nomor;
  final String nama;
  final int ayat;
  final String lokasi;

  const SurahItem({
    Key? key,
    required this.nomor,
    required this.nama,
    required this.ayat,
    required this.lokasi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            '$nomor',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          nama,
          