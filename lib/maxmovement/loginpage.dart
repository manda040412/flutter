import 'package:flutter/material.dart';
import 'package:maxmovement/maxmovement/home_page.dart';
import 'package:maxmovement/maxmovement/signup_page.dart';

class LoginPagee extends StatelessWidget {
  LoginPagee({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String FontPoppins = 'Poppins';

  void login(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
                  "Login",
                  style: TextStyle(fontFamily: FontPoppins, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    fontFamily: FontPoppins,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
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
                      SizedBox(height: 10),
                      inputFile(label: "Password", obscureText: true, controller: passwordController),
                      SizedBox(height: 10),
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                            onPressed: () {
                              login(context);
                            },
                            minWidth: 120,
                            height: 40,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: FontPoppins,
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
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Forgot password action
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontFamily: FontPoppins,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontFamily: FontPoppins),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        "Create your account now",
                        style: TextStyle(
                          fontFamily: FontPoppins,
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
            fontFamily: FontPoppins,
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
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
