import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/new_project.dart';
import 'package:maxmovement/impactmate/new_report.dart';
import 'package:maxmovement/impactmate/profile_page.dart';
import 'package:maxmovement/impactmate/projects.dart';
import 'package:maxmovement/impactmate/report_page.dart';
import 'package:url_launcher/url_launcher.dart';

class OnGoingProject extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ongoing Project',
          style: TextStyle(fontFamily: 'Poppins'), // Menggunakan font Poppins
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCard(
              context,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Materials Translation Quality',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF273526),
                      fontFamily: 'Poppins', // Menggunakan font Poppins
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ensuring the correct translation from other foreign language in scope of international online learning platform.',
                    style: TextStyle(fontFamily: 'Poppins'), // Menggunakan font Poppins
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('SDG Focus', style: TextStyle(fontFamily: 'Poppins')), // Menggunakan font Poppins
                          SizedBox(height: 10),
                          Image.asset('assets/sdg1.png', height: 60), // Pastikan gambar ini ada
                          SizedBox(height: 10),
                        ],
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Progress', style: TextStyle(fontFamily: 'Poppins')), // Menggunakan font Poppins
                            LinearProgressIndicator(
                              value: 0.7, // Nilai contoh progress (70%)
                              backgroundColor: Colors.grey[300],
                              color: Colors.red,
                            ),
                            SizedBox(height: 10),
                            Wrap(
                              spacing: 8.0,
                              children: <Widget>[
                                Chip(label: Text('Education', style: TextStyle(fontFamily: 'Poppins'))), // Menggunakan font Poppins
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'General Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Menggunakan font Poppins
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildCard(
                    context,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Funding Used',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Menggunakan font Poppins
                        ),
                        SizedBox(height: 10),
                        Text('\$1000', style: TextStyle(fontFamily: 'Poppins')), // Menggunakan font Poppins
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildCard(
                    context,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Location',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Menggunakan font Poppins
                        ),
                        SizedBox(height: 10),
                        Text('Cipete, Tangerang', style: TextStyle(fontFamily: 'Poppins')), // Menggunakan font Poppins
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildCard(
              context,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Project Timeline',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Menggunakan font Poppins
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This project has started since 24 November 2023 and expected to end in 24 March 2024',
                    style: TextStyle(fontFamily: 'Poppins'), // Menggunakan font Poppins
                  ),
                  SizedBox(height: 15),
                  Text(
                    'You got 12 more days',
                    style: TextStyle(fontFamily: 'Poppins'), // Menggunakan font Poppins
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Project Survey',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Menggunakan font Poppins
            ),
            SizedBox(height: 10),
            Text(
              'Ensure that the survey you conduct to whom you impacted were using these question template.',
              style: TextStyle(fontFamily: 'Poppins'), // Menggunakan font Poppins
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE2E2E2), // Warna latar belakang tombol
                    foregroundColor: Color(0xFF7C7C7C), // Warna teks tombol
                  ),
                  onPressed: () async {
                    const url = 'https://docs.google.com/document/d/1yqWbdZoWf_k8B5-o4PQupkcfEbUhjUpDTvYT7kxF-_4/edit?usp=sharing';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text('English', style: TextStyle(fontFamily: 'Poppins')), // Menggunakan font Poppins
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE2E2E2), // Warna latar belakang tombol
                    foregroundColor: Color(0xFF7C7C7C), // Warna teks tombol
                  ),
                  onPressed: () {},
                  child: Text('Indonesia', style: TextStyle(fontFamily: 'Poppins')), // Menggunakan font Poppins
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          items: [
            _bottomNavigationBarItem(Icons.home_outlined, 'Home', 0, 25),
            _bottomNavigationBarItem(Icons.library_books_outlined, 'Projects', 1, 25),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  // Panggil method _showPopupMenu saat tombol ditekan
                  _showPopupMenu(context);
                },
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: Icon(Icons.control_point_outlined, size: 70),
                ),
              ),
              label: '',
            ),
            _bottomNavigationBarItem(Icons.line_axis, 'Reports', 2, 25),
            _bottomNavigationBarItem(Icons.perm_identity, 'Profile', 3, 25),
          ],
          currentIndex: 1, // Sesuaikan dengan tab yang diinginkan
          selectedItemColor: Colors.black,
          onTap: (index) {
            _onItemTapped(context, index); // Tambahkan context di sini
          },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Widget child) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFFFDFDFD), // Warna penuh FDFDFD
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // Perubahan posisi shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

void _onItemTapped(BuildContext context, int index) {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IMHomePage()),
    );
  } else if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProjectPage()),
    );
  } else if (index == 2) {
    // Tambahkan logika untuk navigasi ke halaman baru
  } else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportPage()),
    );
  } else if (index == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
  // setState tidak diperlukan di sini karena ini adalah kelas StatelessWidget
}
    // Metode untuk menampilkan popup menu
  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose what you want to create',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins', // Menggunakan font Poppins
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF517D5A),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        // Navigate to NewProjectPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewProject()),
                        );
                      },
                      child: Container(
                        width: 500,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'New Project',
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Menggunakan font Poppins
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF517D5A),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        // Navigate to NewReportPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewReport()),
                        );
                      },
                      child: Container(
                        width: 500,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            Icon(Icons.report, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Report Impact',
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Menggunakan font Poppins
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Metode untuk membuat BottomNavigationBarItem dengan ukuran ikon yang berbeda
  BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, String label, int tabIndex, double iconSize) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: iconSize,
      ),
      label: label,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OnGoingProject(),
  ));
}

