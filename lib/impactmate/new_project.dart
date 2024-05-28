import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';

import 'package:maxmovement/impactmate/im_home_page.dart';
import 'package:maxmovement/impactmate/new_report.dart';
import 'package:maxmovement/impactmate/profile_page.dart';
import 'package:maxmovement/impactmate/projects.dart';
import 'package:maxmovement/impactmate/report_page.dart';

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
  String? location;
  List<String> selectedTags = [];
  String? selectedIndicator;
  String? selectedMetric;
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
                  fontFamily: 'Poppins',
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
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Ubah warna teks menjadi putih
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
                              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'), // Ubah warna teks menjadi putih
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
        title: Text('New Project', style: TextStyle(fontFamily: 'Poppins',),
                    ),
      ),
      body: 
      SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 15),
                  _buildTextField('Project Name', (value) {
                    projectName = value;
                  },),
                  SizedBox(height: 15),
                  _buildTextField('Project Description', (value) {
                    projectDescription = value;
                  }),
                  SizedBox(height: 15),
                  _buildTextField('Project Goals', (value,) {
                    projectGoals = value;
                  }),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: _buildTextField('Start Project', (value) {},),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: AbsorbPointer(
                      child: _buildTextField('End Project', (value) {}),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      location = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                  Text(
                    '(Enter the amount of money that will be used for this project)',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      suffixText: 'USD',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
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
                    style: TextStyle(fontSize: 12, color: Colors.red, fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
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
                            decoration: BoxDecoration(
                              color: Color(0xFFB8B8B8), // Warna bisa disesuaikan dengan kebutuhan desain Anda
                              borderRadius: BorderRadius.circular(10), // Membuat border radius bulat
                            ),
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
                          backgroundColor: Color(0xFF7FA57E),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 10),
                        ),
                        child: Text('Cancel', style: TextStyle(fontFamily: 'Poppins',)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5B8759),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 10),
                        ),
                        child: Text('Add to Draft', style: TextStyle(fontFamily: 'Poppins',)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3A6238),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 10),
                        ),
                        child: Text('Save & Upload', style: TextStyle(fontFamily: 'Poppins',)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
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
                          backgroundColor: Color(0xFF7FA57E),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal:  25),
                          textStyle: TextStyle(fontSize: 10),
                        ),
                        child: Text('Cancel', style: TextStyle(fontFamily: 'Poppins',)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5B8759),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 10),
                        ),
                        child: Text('Add to Draft', style: TextStyle(fontFamily: 'Poppins',)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3A6238),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          textStyle: TextStyle(fontSize: 10),
                        ),
                        child: Text('Save & Upload', style: TextStyle(fontFamily: 'Poppins',)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    'SDG Indicators',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Choose from the SDG indicator which goal are you achieving in this report.',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choose Indicators',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    value: selectedIndicator, // Tambahkan nilai yang dipilih
                    onChanged: (newValue) {
                      setState(() {
                        selectedIndicator = newValue; // Perbarui nilai yang dipilih saat opsi dipilih
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('Indicator 1'),
                        value: 'Indicator 1',
                      ),
                      DropdownMenuItem(
                        child: Text('Indicator 2'),
                        value: 'Indicator 2',
                      ),
                      DropdownMenuItem(
                        child: Text('Indicator 3'),
                        value: 'Indicator 3',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    'Define Project by Metrics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Choose the metrics which goal are you achieving in this report.',
                    style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Choose Metrics',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    value: selectedMetric, // Ubah nilai selectedMetric dengan nilai yang sesuai
                    onChanged: (newValue) {
                      setState(() {
                        selectedMetric = newValue; // Perbarui nilai selectedMetric saat opsi dipilih
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('Metric 1'),
                        value: 'Metric 1',
                      ),
                      DropdownMenuItem(
                        child: Text('Metric 2'),
                        value: 'Metric 2',
                      ),
                      DropdownMenuItem(
                        child: Text('Metric 3'),
                        value: 'Metric 3',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDFDFD), // Set background color
                borderRadius: BorderRadius.circular(20.0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
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
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                    onPressed: () {
                      if (_filePath.isNotEmpty) {
                        // Use _filePath to import the file
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF395143)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(Size(100, 45)), // Atur lebar dan tinggi
                    ),
                    child: Text('Create', style: TextStyle(fontFamily: 'Poppins',)),
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
        borderRadius: BorderRadius.circular(13.0),
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    ),
    onChanged: onChanged,
    style: TextStyle(
      fontFamily: 'Poppins',
    ),
  );
}

  Widget _buildDropdownField(String labelText, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
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
          child: Text(value,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),),
        );
      }).toList(),
    );
  }
}


