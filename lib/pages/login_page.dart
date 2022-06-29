import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                //main heading
                child: Text(
                  "HAVI.Inc",
                  style: GoogleFonts.angkor(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                //sub heading
                child: Text(
                  "Welcome To Naive World!",
                  style: GoogleFonts.angkor(
                    color: Colors.grey[800],
                    wordSpacing: 5,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //Android Icon
              Icon(
                Icons.apple_sharp,
                size: 200,
              ),
              SizedBox(
                height: 30,
              ),
              //Email TextFiled
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Password TextFiled
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: Colors.white)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ForgotPasswordPage();
                      },
                    ),
                  );
                },
                child: Text(
                  'Oops Forgot Password?',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Sign In button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                      height: 50,
                      //width: 300,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.b612Mono(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not A Member?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
