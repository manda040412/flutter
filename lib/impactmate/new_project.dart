import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';

import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/projects.dart';

void main() {
  runApp(MaterialApp(
    home: NewProject(),
  ));
}

class NewProject extends StatefulWidget {
  const NewProject({Key? key}) : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  // Define variables to store form values
  String projectName = '';
  String projectDescription = '';
  String projectGoals = '';
  DateTime? startDate;
  DateTime? endDate;
  double fundingAmount = 0.0;
  String? fundingType;
  double otherFundingAmount = 0.0;
  String? otherFundingType;
  List<String> selectedTags = [];
  TextEditingController _filePathController = TextEditingController();
  String _filePath = '';
  List<String> selectedSDGCategories = [];

  // List of options for other funding type dropdown
  List<String> fundingOptions = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  // Method to handle submission of the form
  void submitForm() {
    // Logic to submit the form data
  }

  // Method to show calendar picker
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  int _selectedIndex = 0;

  // BottomNavigationBarItem generator
  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

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

  void _showPopupMenu(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Project'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE2C8FD), Color(0xFFA3E3F1)],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'About Your Project',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  _buildTextField('Project Name', (value) {
                    projectName = value;
                  }),
                  SizedBox(height: 15),
                  _buildTextField('Project Description', (value) {
                    projectDescription = value;
                  }),
                  SizedBox(height: 15),
                  _buildTextField('Project Goals', (value) {
                    projectGoals = value;
                  }),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE2C8FD), Color(0xFFA3E3F1)],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Start Project & End Project',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: _buildTextField('Start Date', (value) {}),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: AbsorbPointer(
                      child: _buildTextField('End Date', (value) {}),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE2C8FD), Color(0xFFA3E3F1)],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Funding',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '(Enter the amount of money that will be used for this project)',
                    style: TextStyle(fontSize: 12,),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      suffixText: 'USD',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      fundingAmount = double.parse(value);
                    },
                  ),
                  Text(
                    '*After you successfully create a new project, the amount you input will automatically be deducted from your total grants',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  _buildDropdownField('Other Funding', (newValue) {
                    setState(() {
                      otherFundingType = newValue;
                    });
                  }),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE2C8FD), Color(0xFFA3E3F1)],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tags',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(10, (index) {
                      if (index < 9) {
                        return GestureDetector(
                          onTap: () {
                            // Handle tap on tag
                            setState(() {
                              // Toggle selection status
                              if (selectedTags.contains('Tag ${index + 1}')) {
                                selectedTags.remove('Tag ${index + 1}');
                              } else {
                                selectedTags.add('Tag ${index + 1}');
                              }
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                'assets/tag${index + 1}.png', // assuming your images are named as tag1.png, tag2.png, etc.
                                fit: BoxFit.cover,
                                color: selectedTags.contains('Tag ${index + 1}') ? Colors.grey : null,
                                colorBlendMode: selectedTags.contains('Tag ${index + 1}') ? BlendMode.color : null,
                              ),
                            ),
                          ),
                        );
                      } else {
                        // Widget untuk tombol tambahan "+"
                        return GestureDetector(
                          onTap: () {
                            // Handle tap on the "+" button
                            // Misalnya, tampilkan dialog untuk menambahkan tag baru
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            color: Color(0xFFE0C9FD), // Warna bisa disesuaikan dengan kebutuhan desain Anda
                            child: Icon(Icons.add),
                          ),
                        );
                      }
                    }),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC893FD),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9F3FFF),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Add to Draft'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8000FF),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Save & Upload'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE2C8FD), Color(0xFFA3E3F1)],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'SDG Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(17, (index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle tap on SDG category
                          setState(() {
                            if (selectedSDGCategories.contains('SDG ${index + 1}')) {
                              selectedSDGCategories.remove('SDG ${index + 1}');
                            } else {
                              selectedSDGCategories.add('SDG ${index + 1}');
                            }
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              'assets/sdg${index + 1}.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              color: selectedSDGCategories.contains('SDG ${index + 1}') ? Colors.grey : null,
                              colorBlendMode: selectedSDGCategories.contains('SDG ${index + 1}') ? BlendMode.color : null,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC893FD),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9F3FFF),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Add to Draft'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8000FF),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 12),
                        ),
                        child: Text('Save & Upload'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE2C8FD), Color(0xFFA3E3F1)],
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Import Data',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: TextFormField(
                          readOnly: true,
                          controller: _filePathController,
                          decoration: InputDecoration(
                            hintText: 'Select file...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.folder_open),
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            setState(() {
                              _filePath = result.files.single.path!;
                              _filePathController.text = _filePath;
                            });
                          }
                        },
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _filePathController.clear();
                          _filePath = '';
                        },
                        icon: Icon(Icons.delete),
                        iconSize: 30,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_filePath.isNotEmpty) {
                        // Use _filePath to import the file
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8000FF),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Import'),
                  ),
                ],
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

  Widget _buildTextField(String labelText, Function(String) onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownField(String labelText, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      value: otherFundingType,
      onChanged: onChanged,
      items: fundingOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


