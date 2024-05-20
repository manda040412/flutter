import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String? label; // Make the label parameter optional
  final TextEditingController? controller;

  const PasswordInput({Key? key, this.label, this.controller}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null) // Check if the label is provided
          Text(
            widget.label!,
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
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                minWidth: 50,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.grey.withOpacity(0.5),
                child: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
