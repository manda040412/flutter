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
  final VoidCallback onUpdatePressed;

  const Sdg({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.sdgFocus,
    required this.budget,
    required this.dateInfo,
    required this.buttonText,
    required this.buttonText1,
    required this.onUpdatePressed,
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
          color: Color(0xFFFDFDFD), // Warna penuh FDFDFD
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 8,
              offset: Offset(0, 0), // perubahan posisi shadow
            ),
          ],
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
                  onPressed: onUpdatePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF395143), // Warna latar belakang tombol
                    foregroundColor: Color(0xFFFFFFFF), // Warna teks tombol
                  ),
                  child: Text(buttonText),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Tindakan untuk tombol kedua
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF395143), // Warna latar belakang tombol
                    foregroundColor: Color(0xFFFFFFFF), // Warna teks tombol
                  ),
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
