import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/im_login.dart';
import 'package:maxmovement/impactmate/new_project.dart';
import 'package:maxmovement/impactmate/new_report.dart';
import 'package:maxmovement/impactmate/projects.dart';
import 'package:maxmovement/impactmate/report_page.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    theme: ThemeData(
      fontFamily: 'Poppins', // Mengatur font default menjadi Poppins
    ),
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _buildProfileHeader(),

            SizedBox(height: 20),

            // Account Profile
            _buildCard(
              title: 'Account Profile',
              icon: Icons.person,
              color: Color(0xFFFDFDFD), // Warna kartu pertama
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardContentRow(Icons.message, 'jakee02@gmail.com'),
                  _buildCardContentRow(Icons.phone, '+628-4584-2341'),
                  _buildCardContentRow(Icons.business, 'Adisierra Corporations'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add edit profile functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF395143), // Ubah warna tombol
                        ),
                        child: Text('Edit Profile', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Other Settings
            _buildCard(
              title: 'Other Settings',
              icon: Icons.settings,
              color: Color(0xFFFDFDFD), // Warna kartu kedua
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardContentRow(Icons.arrow_drop_down, 'Expertise'),
                  _buildCardContentRow(Icons.arrow_drop_down, 'Language'),
                  _buildCardContentRow(Icons.arrow_drop_down, 'Notifications'),
                  _buildCardContentRow(Icons.arrow_drop_down, 'Company Profile'),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => IMLoginPage()), // Navigasi ke halaman login
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF395143), // Ubah warna tombol
                  textStyle: TextStyle(fontSize: 18), // Ubah ukuran teks tombol
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Logout', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18.0),
          child: Image.asset(
            'assets/profile.jpeg',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jake',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 5),
                Text('Joined 28 June 2028'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text('Depok'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({required String title, required IconData icon, required Widget content, Color color = Colors.white}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFCAD32C),
            Color(0xFF3E5E68),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.all(1.0), // Ketebalan border
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 24),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardContentRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 10),
                   Text(
            text,
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  void _onItemTapped(int index) {
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
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
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
}

