import 'package:flutter/material.dart';
import 'package:maxmovement/maxmovement/password.dart';
import 'package:maxmovement/maxmovement/verification_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto/crypto.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String generateSHA256(String input) {
    var bytes = utf8.encode(input); // Convert text to bytes
    var digest = sha256.convert(bytes); // Generate SHA-256 hash
    return digest.toString(); // Return the hash as a string
  }

  Future<void> signup(BuildContext context) async {
    // Check if confirm password matches password
    String hashedPassword = generateSHA256(passwordController.text);
    String hashedConfirmPassword = generateSHA256(confirmPasswordController.text);
    if (hashedPassword != hashedConfirmPassword) {
      Fluttertoast.showToast(
        msg: "Password and confirm password do not match!",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
      return; // Stop further execution
    }

    // Continue with registration process
    var url = Uri.parse("http://192.168.124.142/maxmovement/maxmovement/flutter/signup.php");
    var response = await http.post(url, body: {
      "email": emailController.text,
      "password": hashedPassword, // Use hashed password for security
    });
    print(response.body);

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "This User Already Exists!",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
        msg: "SignUp Successful!",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }

    // Handle response here, e.g., show verification page or error message
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerificationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign Up",
                  style: TextStyle(fontFamily: 'Inter', fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  constraints: BoxConstraints(
                    maxWidth: 360,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCB042),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email", controller: emailController),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PasswordInput(label: "Password", controller: passwordController),
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PasswordInput(label: "Confirm Password", controller: confirmPasswordController),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                            onPressed: () {
                              signup(context);
                            },
                            minWidth: 120,
                            height: 40,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF232E66),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputFile({required String label, bool obscureText = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: InputBorder.none,
              labelText: label,
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {},
                      icon: obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
