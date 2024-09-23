import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ChicCycle());
}

class ChicCycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF81C784), // Pastel yeşil
        hintColor: Color(0xFF4FC3F7), // Pastel mavi
        scaffoldBackgroundColor: Color(0xFFF1F8E9), // Açık pastel arka plan
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // Beyaz zeminli TextField
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
          EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          labelStyle: TextStyle(color: Color(0xFF4FC3F7)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF81C784), // Buton rengi pastel yeşil
            foregroundColor: Colors.white, // Buton metin rengi
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Şık Döngü"),
          centerTitle: true,
          backgroundColor: Color(0xFF81C784), // Pastel yeşil AppBar
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CommonTextFieldDemo(),
          ),
        ),
      ),
    );
  }
}

class CommonTextFieldDemo extends StatefulWidget {
  @override
  _CommonTextFieldDemoState createState() => _CommonTextFieldDemoState();
}

class _CommonTextFieldDemoState extends State<CommonTextFieldDemo> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ideaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 1000,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'İsim',
                  prefixIcon: Icon(Icons.person, color: Color(0xFF4FC3F7)),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 1000,
              child: TextFormField(
                controller: _ideaController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Dönüşüm Fikri',
                  prefixIcon: Icon(Icons.message, color: Color(0xFF4FC3F7)),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              child: Text("Fotoğraf Ekle"),
            ),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text("Lütfen bir fotoğraf seçiniz."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _clearForm();
              },
              child: Text("Gönder"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  void _clearForm() {
    setState(() {
      _nameController.clear();
      _ideaController.clear();
      _selectedImage = null;
    });
  }
}
