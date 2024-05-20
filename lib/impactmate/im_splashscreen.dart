import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_signup.dart';

class IMSplashScreen extends StatefulWidget {
  const IMSplashScreen({Key? key}) : super(key: key);

  @override
  State<IMSplashScreen> createState() => _IMSplashScreenState();
}

class _IMSplashScreenState extends State<IMSplashScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaxMovement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ImpactMate',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('assets/impactmate_logo.png'),
            const Text(
              'TBN Indonesia IMM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => IMSignInPage())).then((value) {
                  if (value != null && value is int) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  }
                });
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cottage_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories_rounded),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'IMM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedIndex == 2 ? Colors.amber : Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

const IconData cottage_rounded = IconData(0xf677, fontFamily: 'MaterialIcons');
const IconData auto_stories_rounded = IconData(0xf59c, fontFamily: 'MaterialIcons');
const IconData assignment = IconData(0xe0a5, fontFamily: 'MaterialIcons', matchTextDirection: true);
const IconData people_alt = IconData(0xe487, fontFamily: 'MaterialIcons');
const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');
