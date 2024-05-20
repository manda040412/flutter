import 'package:flutter/material.dart';

// Ubah nama kelas menjadi CamelCase
class Sdg extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final String sdgFocus;
  final String budget;
  final String dateInfo;
  final String buttonText;
  final String buttonText1;

  const Sdg({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.sdgFocus,
    required this.budget,
    required this.dateInfo,
    required this.buttonText,
    required this.buttonText1,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: double.infinity,
        height: 380,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [Color(0xFFEEDFFF), Color(0xFFD8B5FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            Text(
              sdgFocus,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Image.asset(
              imageAsset,
              width: 70,
              height: 70,
            ),
            SizedBox(height: 8),
            Text(
              budget,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\n$dateInfo',
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Tindakan untuk tombol pertama
                  },
                  child: Text(buttonText),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Tindakan untuk tombol kedua
                  },
                  child: Text(buttonText1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}