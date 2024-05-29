import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/profile_page.dart'; // Import halaman splash screen
import 'package:maxmovement/impactmate/new_project.dart'; // Import halaman new project
import 'package:maxmovement/impactmate/projects.dart';
import 'package:maxmovement/impactmate/report_page.dart'; // Import halaman report
import 'package:maxmovement/impactmate/new_report.dart'; // Import halaman new report

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  int _selectedIndex = 0;

  void saveChanges(BuildContext context) {
    // Implement your save changes logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()), // Ganti ke ProfilePage setelah menyimpan perubahan
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
    } else if (index == 2) {
      _showPopupMenu(context);
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

  BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()), // Ganti ke halaman splash screen
        );
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Edit Profile', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpeg'), // Ganti dengan path gambar Anda
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Jake',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                      'Change Profile Picture',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    constraints: BoxConstraints(
                      maxWidth: 360,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Color(0xFFCAD32C)), // Add black border
                    ),
                    child: Column(
                      children: <Widget>[
                        accountInfoSection(
                          icon: Icons.email,
                          label: 'Email',
                          controller: emailController,
                        ),
                        SizedBox(height: 5),
                        accountInfoSection(
                          icon: Icons.lock,
                          label: 'Password',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        SizedBox(height: 5),
                        accountInfoSection(
                          icon: Icons.phone,
                          label: 'Phone',
                          controller: phoneController,
                        ),
                        SizedBox(height: 5),
                        accountInfoSection(
                          icon: Icons.business,
                          label: 'Company',
                          controller: companyController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        saveChanges(context); // Panggil fungsi saveChanges saat tombol ditekan
                      },
                      minWidth: 200, // Set the width of the button to match its parent
                      height: 50, // Atur tinggi tombol
                      child: Text(
                        "Save Changes",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: Color(0xFF395143),
                      elevation: 0, // Remove button elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                ],
              ),
            ),
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
              _bottomNavigationBarItem(Icons.line_axis, 'Reports', 3),
              _bottomNavigationBarItem(Icons.perm_identity, 'Profile', 4),
            ],
            currentIndex: 4,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  Widget accountInfoSection({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Icon(icon, color: Colors.grey),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFEAECF4),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
