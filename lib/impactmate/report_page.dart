import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/new_project.dart';
import 'package:maxmovement/impactmate/new_report.dart';
import 'package:maxmovement/impactmate/profile_page.dart';
import 'package:maxmovement/impactmate/projects.dart';

void main() {
  runApp(MaterialApp(
    home: ReportPage(),
    theme: ThemeData(
      fontFamily: 'Poppins', // Mengatur font default menjadi Poppins
    ),
  ));
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Reports'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recently Made Reports
            Text(
              'Recently Made Reports',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Dropdown to select metrics
            _buildOuterBox(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  _buildReportCard(
                    title: 'Report Impact xxxxx',
                    sdgImage: 'assets/sdg1.png',
                    fundingUsed: '\$4500 are used in this project',
                    startDate: 'Starting Date: 22/02/2024',
                    endDate: 'Ends by: 22/06/2024',
                    backgroundColor: Colors.white, // Ganti warna latar belakang sesuai keinginan
                  ),
                ],
              ),
              width: 400, // Atur lebar di sini
              color: Colors.white, // Atur warna di sini
            ),
            SizedBox(height: 20),
            // Group by Metrics (scroll)
            _buildGroupBySection(
              title: 'Group by Metrics',
            ),
            SizedBox(height: 20),
            // Group by Tags (scroll)
            _buildGroupBySection(
              title: 'Group by Tags',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          items: [
            _bottomNavigationBarItem(Icons.home_outlined, 'Home', 0),
            _bottomNavigationBarItem(Icons.library_books_outlined, 'Projects', 1),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _showPopupMenu(context);
                },
                child: Transform.translate(
                  offset: Offset(0, -30),
                  child: Icon(Icons.control_point_outlined, size: 70),
                ),
              ),
              label: '',
            ),
            _bottomNavigationBarItem(Icons.line_axis, 'Reports', 2),
            _bottomNavigationBarItem(Icons.perm_identity, 'Profile', 3),
          ],
          currentIndex: 3, // Ubah currentIndex menjadi 2
          selectedItemColor: Colors.black,
          onTap: (index) {
            _onItemTapped(context, index); // Tambahkan context sebagai parameter
          },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
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
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }
  
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
                        // Navigator.pop(context); // Close the bottom sheet
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
                              style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
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
                              style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
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

  Widget _buildOuterBox(Widget child, {double? width, Color? color}) {
    return Container(
      width: width,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }

  Widget _buildReportCard({
    required String title,
    required String sdgImage,
    required String fundingUsed,
    required String startDate,
    required String endDate,
    Color? backgroundColor, // Tambahkan parameter backgroundColor di sini
  }) {
    return Card(
      color: Colors.transparent, // Atur warna kartu menjadi transparan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Color (0xFFCAD32C)), // Tambahkan border dengan warna hijau
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor, // Gunakan warna latar belakang dari parameter
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(sdgImage, height: 50),
                      SizedBox(height: 5),
                      Text(
                        'SDG Focus',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fundingUsed,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(startDate),
                        Text(endDate),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupBySection({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        // Scrollable list of report cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildOuterBox(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 380, // Atur lebar dropdown di sini
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF778E95), Color(0xFFB0BD7D)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Select Metrics',
                          hintStyle: TextStyle(color: Colors.white), // Ubah warna teks hint menjadi putih
                        ),
                        items: ['Item 1', 'Item 2', 'Item 3']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildReportCard(
                      title: 'Report Impact xxxxx',
                      sdgImage: 'assets/sdg1.png',
                      fundingUsed: '\$4500 are used in this project',
                      startDate: 'Starting Date: 22/02/2024',
                      endDate: 'Ends by: 22/06/2024',
                      backgroundColor: Colors.white, // Ganti warna latar belakang sesuai keinginan
                    ),
                  ],
                ),
                width: 358, // Atur lebar di sini
                color: Colors.white, // Atur warna di sini
              ),
            ],
          ),
        ),
      ],
    );
  }
}

