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
  final TextEditingController _employeesController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _workingDepartmentController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryRegionController = TextEditingController();
  final TextEditingController _stateProvinceController = TextEditingController();

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
        title: Text(
          'Registration Form',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFDBE1B7), Color(0xFFD4DCD1), Colors.white],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: 380,
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFFFDFDFD).withOpacity(0.9), // Add opacity here
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(8, 20),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Company Information',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: Text(
                            'Company Logo',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: _logoImage != null ? FileImage(_logoImage!) : null,
                            child: _logoImage == null ? Icon(Icons.camera_alt, size: 50, color: Colors.grey.shade300) : null,
                          ),
                        ),
                        SizedBox(height: 24),
                        _buildTextField('Company Name', _companyNameController),
                        _buildTextField('Company Profile', _companyProfileController),
                        _buildTextField('Number of Employees', _employeesController),
                        _buildTextField('Company Field', _fieldController),
                        SizedBox(height: 24),
                        Center(
                          child: Text(
                            'About Yourself',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        _buildTextField('Name', _nameController),
                        _buildTextField('Your Working Department', _workingDepartmentController),
                        _buildTextField('Phone Number', _phoneNumberController),
                        _buildTextField('Country/Region/Territory', _countryRegionController),
                        _buildTextField('State/Province/Region', _stateProvinceController),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => _saveForm(context),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF395143),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                            textStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: 'Poppins',
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorStyle: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.red,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ),
    );
  }

  void _saveForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      print('Company Name: ${_companyNameController.text}');
      print('Company Profile: ${_companyProfileController.text}');
      print('Number of Employees: ${_employeesController.text}');
      print('Company Field: ${_fieldController.text}');
      print('Name: ${_nameController.text}');
      print('Your Working Department: ${_workingDepartmentController.text}');
      print('Phone Number: ${_phoneNumberController.text}');
      print('Country/Region/Territory: ${_countryRegionController.text}');
      print('State/Province/Region: ${_stateProvinceController.text}');

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
