import 'package:flutter/material.dart';
//import 'package:instagram_clone_/home_page.dart';
import 'package:instagram/login_page.dart';
import 'controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 200),
              Text(
                'Instagram',
                style: TextStyle(fontSize: 60, fontFamily: 'Cookie'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70),
              TextFormField(
                controller: idController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  hintText: 'Phone number, email, or username',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Border radius
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 25,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Border radius
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 25,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(221, 94, 94, 94),
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms, Privacy\nPolicy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Cookies Policy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  if (idController.text.trim().isNotEmpty &&
                      passController.text.trim().isNotEmpty) {
                    await Login().signup(
                      idController.text.trim(),
                      passController.text.trim(),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Account Created!'),
                        duration: Duration(seconds: 4),
                      ),
                    );
                    idController.clear();
                    passController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 210),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
