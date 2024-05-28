import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/new_project.dart';
import 'package:maxmovement/impactmate/profile_page.dart';
import 'package:maxmovement/impactmate/projects.dart';
import 'package:maxmovement/impactmate/report_page.dart';

class NewReport extends StatefulWidget {
  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  int _selectedIndex = 2;

  // BottomNavigationBarItem generator
  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label, int index) {
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
                  fontFamily: 'Poppins', // Set font menjadi Poppins
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
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Set font menjadi Poppins
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
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Set font menjadi Poppins
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('New Impact Report', style: TextStyle(fontFamily: 'Poppins')), // Set font menjadi Poppins
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCAD32C)),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFFFDFDFD),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose the project you want to report the impact',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Set font menjadi Poppins
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF778E95), Color(0xFFB0BD7D)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 50.0, // Atur tinggi container sesuai kebutuhan
                      child: DropdownButtonFormField<String>(
                        items: [
                          DropdownMenuItem(
                            child: Text('Project A', style: TextStyle(color: Colors.black, fontFamily: 'Poppins')), // Set font menjadi Poppins
                            value: 'Project A'
                          ),
                          DropdownMenuItem(
                            child: Text('Project B', style: TextStyle(color: Colors.black, fontFamily: 'Poppins')), // Set font menjadi Poppins
                            value: 'Project B'
                          ),
                          DropdownMenuItem(
                            child: Text('Project C', style: TextStyle(color: Colors.black, fontFamily: 'Poppins')), // Set font menjadi Poppins
                            value: 'Project C'
                          ),
                        ],
                        onChanged: (value) {
                          // Implementasi logika saat pilihan berubah
                        },
                        hint: Text('By Metrics', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')), // Set font menjadi Poppins
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                  'Fill the fields below to update your impact!',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Set font menjadi Poppins
                  ),
                  SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCAD32C)),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFFFDFDFD),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  'Report Title',
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Set font menjadi Poppins
                  ),
                  SizedBox(height: 10.0),
                    Container( // Container untuk Report Title
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      height: 50.0, // Atur tinggi container sesuai kebutuhan
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Report Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Set font menjadi Poppins
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Give us the detail from the indicator you choose (Ex: Our target is to fulfill the 4.4.1 indicator by 50% in February)',
                      style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'), // Set font menjadi Poppins
                    ),
                    SizedBox(height: 10.0),
                    Container( // Container untuk Indicator details
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 50.0, // Atur tinggi container sesuai kebutuhan
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Indicator details',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Upload Impact File',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Set font menjadi Poppins
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container( // Container untuk Upload Button
                          width: 328.0, // Atur lebar container sesuai kebutuhan
                          height: 100.0, // Atur tinggi container sesuai kebutuhan
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload),
                                SizedBox(width: 10.0),
                                Text('Maximum 100MB', style: TextStyle(fontFamily: 'Poppins')), // Set font menjadi Poppins
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Upload Survey Results*',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'), // Set font menjadi Poppins
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '*Make sure the survey is based on the template from your On Going Project page.',
                      style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'), // Set font menjadi Poppins
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container( // Container untuk Upload Button
                          width: 328.0, // Atur lebar container sesuai kebutuhan
                          height: 100.0, // Atur tinggi container sesuai kebutuhan
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload),
                                SizedBox(width: 10.0),
                                Text('Maximum 100MB', style: TextStyle(fontFamily: 'Poppins')), // Set font menjadi Poppins
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Implementasi logika untuk tombol Draft
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFAAAAAA), // Warna latar belakang tombol
                            minimumSize: Size(140, 40), // Ukuran minimum tombol
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Mengatur border radius
                            ),
                          ),
                          child: Text('Draft', style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Poppins')), // Set font menjadi Poppins
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Implementasi logika untuk tombol Save & Upload
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF395143), // Warna latar belakang tombol
                            minimumSize: Size(120, 40), // Ukuran minimum tombol
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Mengatur border radius
                            ),
                          ),
                          child: Text('Save & Upload', style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Poppins')), // Set font menjadi Poppins
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
}

void main() {
  runApp(MaterialApp(
    home: NewReport(),
  ));
}

