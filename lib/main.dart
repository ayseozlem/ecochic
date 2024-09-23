import 'package:flutter/material.dart';
import 'splash_screen.dart';

import 'chic_dongu.dart';
import 'eco_stil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "ECO CHIC",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(7, 10),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/images/eco_stil.jpg'),
                    fit: BoxFit.contain, // Görselin tamamının görünmesi için
                  ),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Route sayfa1yeGecis=MaterialPageRoute(builder: (context) {
                        return EcoStilPage();
                      });
                      Navigator.push(context, sayfa1yeGecis);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0), // İç boşluklar
                      backgroundColor: Colors.purple.shade100.withOpacity(0.7), // Buton arka planı
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Buton köşeleri
                      ),
                    ),
                    child: const Text(
                      'Eco Stil',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // Yazı rengi beyaz
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Aralarına boşluk koyduk
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(7, 10),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/images/stil_dongusu.jpg'),
                    fit: BoxFit.contain, // Görselin tamamının görünmesi için
                  ),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Route sayfa2yeGecis=MaterialPageRoute(builder: (context) {
                        return   ChicCycle();
                        ();
                      });
                      Navigator.push(context, sayfa2yeGecis);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      backgroundColor: Colors.green.shade200.withOpacity(0.7), // Buton arka planı
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Şık Döngü',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}