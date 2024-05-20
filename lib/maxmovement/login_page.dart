// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:maxmovement/maxmovement/home_page.dart';
// import 'package:maxmovement/maxmovement/signup_page.dart';
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   Future<void> login(BuildContext context) async {
//     var url = Uri.parse("http://192.168.18.66/maxmovement/maxmovement/flutter/login.php");

//     try {
//       var response = await http.post(url, body: {
//         "email": emailController.text,
//         "password": passwordController.text, // Send hashed password
//       });

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         var data = json.decode(response.body);
//         if (data == "Success") {
//           Fluttertoast.showToast(
//               msg: "Login Successful",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.green,
//               textColor: Colors.white,
//               fontSize: 16.0
//           );
//           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//         } else {
//           Fluttertoast.showToast(
//               msg: responseData['message'],
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0
//           );
//         }
//       } else {
//         // Handle HTTP error response
//         Fluttertoast.showToast(
//             msg: "Failed to connect to server",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0
//         );
//       }
//     } catch (e) {
//       // Handle connection error
//       Fluttertoast.showToast(
//           msg: "Connection Error: $e",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "Login",
//                   style: TextStyle(fontFamily: 'Inter', fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   "Login to your account",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                   constraints: BoxConstraints(
//                     maxWidth: 360,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFCB042),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       inputFile(label: "Email", controller: emailController),
//                       SizedBox(height: 10),
//                       inputFile(label: "Password", obscureText: true, controller: passwordController),
//                       SizedBox(height: 10),
//                       Container(
//                         child: Material(
//                           color: Colors.transparent,
//                           borderRadius: BorderRadius.circular(10),
//                           child: MaterialButton(
//                             onPressed: () {
//                               login(context);
//                             },
//                             minWidth: 120,
//                             height: 40,
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xFF232E66),
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               // Forgot password action
//                             },
//                             child: Text(
//                               "Forgot Password?",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("Don't have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SignUpPage()),
//                         );
//                       },
//                       child: Text(
//                         "Create your account now",
//                         style: TextStyle(
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget inputFile({required String label, bool obscureText = false, TextEditingController? controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 5),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.shade400),
//           ),
//           child: TextField(
//             obscureText: obscureText,
//             controller: controller,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               border: InputBorder.none,
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:maxmovement/maxmovement/home_page.dart';
import 'package:maxmovement/maxmovement/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    var url = Uri.parse("http://192.168.124.142/maxmovement/maxmovement/flutter/login.php");

    try {
      var response = await http.post(url, body: {
        "email": emailController.text,
        "password": passwordController.text,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          Fluttertoast.showToast(
              msg: "Login Successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Fluttertoast.showToast(
              msg: responseData['message'] ?? 'An error occurred',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      } else {
        // Handle HTTP error response
        Fluttertoast.showToast(
            msg: "Failed to connect to server",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      // Handle connection error
      Fluttertoast.showToast(
          msg: "Connection Error: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
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
                  style: TextStyle(fontFamily: 'Inter', fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "Login to your account",
                  style: TextStyle(
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
                    Text("Don't have an account?"),
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
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}




