import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/projects.dart';

class NewReport extends StatefulWidget {
  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        // Jika indeks 0 (Home) ditekan, pindahkan ke HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IMHomePage()),
        );
      } else if (_selectedIndex == 1) {
        // Jika indeks 1 (Projects) ditekan, pindahkan ke ProjectsPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProjectPage()),
        );
      }
      // Tambahkan logika untuk item lainnya jika diperlukan
    });
  }

  // BottomNavigationBarItem generator
  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  void _showPopupMenu(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Impact Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
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
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Container( // Container untuk Dropdown Your Projects
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 50.0, // Atur tinggi container sesuai kebutuhan
                      child: DropdownButtonFormField<String>(
                        items: [
                          DropdownMenuItem(child: Text('Project A'), value: 'Project A'),
                          DropdownMenuItem(child: Text('Project B'), value: 'Project B'),
                          DropdownMenuItem(child: Text('Project C'), value: 'Project C'),
                        ],
                        onChanged: (value) {
                          // Implementasi logika saat pilihan berubah
                        },
                        hint: Text('Your Projects'),
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
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
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
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                    Container( // Container untuk Report Title
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                      'SDG Indicator',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Choose from the SDG indicator which goal are you achieving in this report.',
                      style: TextStyle(fontSize: 13.0),
                    ),
                    SizedBox(height: 10.0),
                    Container( // Container untuk SDG Indicator Dropdown
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 50.0, // Atur tinggi container sesuai kebutuhan
                      child: DropdownButtonFormField<String>(
                        items: [
                          DropdownMenuItem(child: Text('Indicator 1'), value: 'Indicator 1'),
                          DropdownMenuItem(child: Text('Indicator 2'), value: 'Indicator 2'),
                          DropdownMenuItem(child: Text('Indicator 3'), value: 'Indicator 3'),
                        ],
                        onChanged: (value) {
                          // Implementasi logika saat pilihan berubah
                        },
                        hint: Text('Choose Indicator'),
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Give us the detail from the indicator you choose (Ex: Our target is to fulfill the 4.4.1 indicator by 50% in February)',
                      style: TextStyle(fontSize: 13.0),
                    ),
                    SizedBox(height: 10.0),
                    Container( // Container untuk Indicator details
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
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
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload),
                                SizedBox(width: 10.0),
                                Text('Maximum 100MB'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Upload Survey Results*',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '*Make sure the survey is based on the template from your On Going Project page.',
                      style: TextStyle(fontSize: 13.0,),
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload),
                                SizedBox(width: 10.0),
                                Text('Maximum 100MB'),
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
                          child: Text('Draft', style: TextStyle(fontSize: 15, color: Colors.white)), // Mengatur style teks
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Implementasi logika untuk tombol Save & Upload
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6298CB), // Warna latar belakang tombol
                            minimumSize: Size(120, 40), // Ukuran minimum tombol
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Mengatur border radius
                            ),
                          ),
                          child: Text('Save & Upload', style: TextStyle(fontSize: 15, color: Colors.white)), // Mengatur style teks
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
  