import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/new_project.dart';
import 'package:maxmovement/impactmate/new_report.dart';
import 'package:maxmovement/impactmate/ongoing.dart';
import 'package:maxmovement/impactmate/profile_page.dart';
import 'package:maxmovement/impactmate/report_page.dart';
import 'package:maxmovement/impactmate/sdg.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int _selectedTab = 1;
  int _projectStatus = 0;

  void _onBottomNavigationTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _changeProjectStatus(int status) {
    setState(() {
      _projectStatus = status;
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label, int tabIndex) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 25,
        color: _selectedTab == tabIndex ? Color(0xFF273526) : null,
      ),
      label: label,
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IMHomePage()));
  }

  void _navigateToOnGoingPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingProject()));
  }

  // Method untuk menampilkan menu saat tombol ditekan
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
                            Icon(Icons.add, color:Colors.white),
                            SizedBox(width: 10),
                            Text('New Project',
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
                            Text('Report Impact', 
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
  
  void _navigateToReportsPage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ReportPage()));
  }

  void _navigateToProfilePage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _selectedTab == 1
              ? _projectStatus == 0
                  ? 'Ongoing Projects'
                  : _projectStatus == 1
                      ? 'Scheduled Projects'
                      : _projectStatus == 2
                          ? 'Draft Projects'
                          : 'Done Projects'
              : 'Other Tabs',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _changeProjectStatus(0),
                  child: Text(
                    'Ongoing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _projectStatus == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: _projectStatus == 0
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontFamily: 'Poppins', // Set font menjadi Poppins
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _changeProjectStatus(1),
                  child: Text(
                    'Scheduled',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _projectStatus == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: _projectStatus == 1
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontFamily: 'Poppins', // Set font menjadi Poppins
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _changeProjectStatus(2),
                  child: Text(
                    'Draft',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _projectStatus == 2
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: _projectStatus == 2
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontFamily: 'Poppins', // Set font menjadi Poppins
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _changeProjectStatus(3),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _projectStatus == 3
                          ? FontWeight.bold
                          : FontWeight.normal,
                      decoration: _projectStatus == 3
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontFamily: 'Poppins', // Set font menjadi Poppins
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: _selectedTab == 0 ? 3 : 0,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  if (_projectStatus == 0)
                    Sdg(
                      title: 'Materials translation quality',
                      description:
                          'Ensuring the correct translation from other foreign language in scope of international online learning platform',
                      imageAsset: 'assets/sdg4.png',
                      sdgFocus: 'SDG Focus',
                      budget: '\$4500 are used in this project',
                      dateInfo:
                          'Starting Date : 22/02/2024\nEnds by: 22/06/2024 (Ending in 43 days)',
                      buttonText: 'Update',
                      buttonText1: 'Delete',onUpdatePressed: () => _navigateToOnGoingPage(context),
                    ),
                  if (_projectStatus == 1)
                    Sdg(
                      title: 'Animal Rescue',
                      description:
                          'Rescue stray dog and cats from the street to be treated well in our facilities and cure the disease they have.',
                      imageAsset: 'assets/sdg16.png',
                      sdgFocus: 'SDG Focus',
                      budget: '\$4500 are placed for this project',
                      dateInfo:
                          'Starting Date : 22/02/2024 (12 days to start)\nEnds by: 22/06/2024',
                      buttonText: 'Start',
                      buttonText1: 'Delete',
                      onUpdatePressed: () {},
                    ),
                  if (_projectStatus == 2)
                    Sdg(
                      title: 'Title Project xxxxx',
                      description:
                          'Rescue stray dog and cats from the street to be treated well in our facilities and cure the disease they have.',
                      imageAsset: 'assets/sdg16.png',
                      sdgFocus: 'SDG Focus',
                      budget: '\$4500 are used in this project',
                      dateInfo:
                          'Starting Date : 22/02/2024\nEnded on: 22/06/2024 ',
                      buttonText: 'Update', // Tombol pertama untuk status Draft
                      buttonText1: 'Delete',
                      onUpdatePressed: () {}, // Tombol kedua untuk status Draft
                    ),
                  if (_projectStatus == 3)
                    Sdg(
                      title: 'Materials translation quality',
                      description:
                          'Ensuring the correct translation from other foreign language in scope of international online learning platform',
                      imageAsset: 'assets/sdg16.png',
                      sdgFocus: 'SDG Focus',
                      budget: '\$4500 are placed for this project',
                      dateInfo:
                          'Starting Date : 22/02/2024\nEnded on: 22/06/2024 ',
                      buttonText: 'Review Survey', // Tombol pertama untuk status Done
                      buttonText1: 'Export in Docs', // Tombol kedua untuk status Done
                      onUpdatePressed: () {},
                    ),
                  // Add other project cards based on different statuses
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
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
            _bottomNavigationBarItem(Icons.line_axis, 'Reports', 3),
            _bottomNavigationBarItem(Icons.perm_identity, 'Profile', 4),
          ],
          currentIndex: _selectedTab,
          selectedItemColor: Colors.black,
          onTap: (index) {
            if (index == 0) {
              _navigateToHomePage(context);
            } else if (index == 3) {
              _navigateToReportsPage(context);
            } else if (index == 4) { // Ini harus index 3 untuk Reports, bukan 3 untuk Profile
              _navigateToProfilePage(context);
            } else {
              _onBottomNavigationTapped(index);
            }
          },

          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
      // Atur gaya teks default di sini jika diperlukan
    ),
    home: ProjectPage(),
  ));
}

