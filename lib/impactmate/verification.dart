import 'package:flutter/material.dart';
import 'package:maxmovement/impactmate/company_form.dart';
import 'package:maxmovement/maxmovement/select_page.dart';

class IMVerificationPage extends StatelessWidget {
  const IMVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Ubah menjadi MainAxisAlignment.start
              children: <Widget>[
                SizedBox(height: 1), // Tambahkan SizedBox
                Image.asset( // Tambahkan gambar logo
                  'assets/impactmate_logo.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 1), // Tambahkan SizedBox // Tambahkan SizedBox
                Text(
                  'Sign In to continue to Impact Mate',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFFD3E2E5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.verified_user, size: 80, color: Colors.black),
                      SizedBox(height: 20),
                      Text(
                        "Verify Your Account",
                        style: TextStyle(fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "We’ve sent you the code to your email!\nPlease check your email and enter the code below.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      verificationCodeInput(),
                      SizedBox(height: 5),
                      MaterialButton(
                        onPressed: () {
                          print("Done button pressed");
                          showVerificationSuccess(context);
                        },
                        color: Color(0xFF434343),
                        minWidth: double.infinity,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget verificationCodeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Enter your verification code",
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
            keyboardType: TextInputType.number,
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

  void showVerificationSuccess(BuildContext context) {
    print("Showing verification success dialog");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
          print("Dialog closed");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CompanyForm ()));
          print("Navigated to SelectPage");
        });
        return AlertDialog(
          title: Text('Verification Successful!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline, color: Colors.green),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "You have successfully verified your account!",
                      overflow: TextOverflow.visible,
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
}
