import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:maxmovement/impactmate/im_home_page.dart';

class CompanyForm extends StatefulWidget {
  @override
  _CompanyFormState createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyProfileController = TextEditingController();
  final TextEditingController _picController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _employeesController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();

  File? _logoImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Image selection cancelled"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Registration Form'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 380, // Specify the width
          height: 1000, // Specify the height
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0xFFD3E2E5), // Background color
              borderRadius: BorderRadius.circular(20), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text('Company Logo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 24), // Correct position for SizedBox
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: _logoImage != null ? FileImage(_logoImage!) : null,
                      child: _logoImage == null ? Icon(Icons.camera_alt, size: 50, color: Colors.grey.shade300) : null,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildTextField('Company Name', _companyNameController),
                  _buildTextField('Company Profile', _companyProfileController),
                  _buildTextField('PIC', _picController),
                  _buildTextField('PIC\'s Department', _departmentController),
                  _buildTextField('Phone Number', _phoneController),
                  _buildTextField('Country/Region/Territory', _countryController),
                  _buildTextField('State/Province/Region', _stateController),
                  _buildTextField('Number of Employees', _employeesController),
                  _buildTextField('Company Field', _fieldController),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _saveForm(context),
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF434343),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  void _saveForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      print('Company Name: ${_companyNameController.text}');
      print('Company Profile: ${_companyProfileController.text}');
      print('PIC: ${_picController.text}');
      print('Department: ${_departmentController.text}');
      print('Phone: ${_phoneController.text}');
      print('Country: ${_countryController.text}');
      print('State: ${_stateController.text}');
      print('Employees: ${_employeesController.text}');
      print('Field: ${_fieldController.text}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form saved successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IMHomePage()),
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: CompanyForm(),
  ));
}
