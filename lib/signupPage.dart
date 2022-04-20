import 'package:btt/dashboard.dart';
import 'package:btt/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';

class signup_page extends StatefulWidget {
late String person;
signup_page({required this.person});
  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  void _navigatetodashboardpage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => dashboard()));
  }

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focususername = FocusNode();
  final _focusPassword = FocusNode();
  final _formkey = GlobalKey<FormState>();
  bool _isProcessing = false;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery
                    .of(context)
                    .size
                    .height,
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                      width: double.infinity,
                      height: 30,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Text(
                            '< ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/1.png'),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 20,
                          margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.only(bottom: 0),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(1)),
                                height: 40,
                                width: 340,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                textDirection: TextDirection.ltr,
                                controller: _usernameTextController,
                                focusNode: _focususername,
                                validator: (value) =>
                                    Validator.validateName(
                                      name: value,
                                    ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: 'Enter username',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFF338BFF),
                                    fontSize: 14,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    height: 1,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 20,
                          margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.only(bottom: 0),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(1)),
                                height: 40,
                                width: 340,
                              ),
                              TextFormField(
                                controller: _emailTextController,
                                focusNode: _focusEmail,
                                validator: (value) =>
                                    Validator.validateEmail(
                                      email: value,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFF338BFF),
                                    fontSize: 14,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    height: 1,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 20,
                          margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 340,
                          height: 60,
                          padding: EdgeInsets.only(bottom: 0),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                padding: EdgeInsets.fromLTRB(2, 0, 0, 5),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(1)),
                                height: 40,
                                width: 340,
                              ),
                              TextFormField(
                                controller: _passwordTextController,
                                focusNode: _focusPassword,
                                obscureText: true,
                                validator: (value) =>
                                    Validator.validatePassword(
                                      password: value,
                                    ),
                                keyboardType: TextInputType.text,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFF338BFF),
                                    fontSize: 14,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    height: 1,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              if (_formkey.currentState!.validate()) {
                                setState(
                                      () {
                                    _isProcessing = true;
                                  },
                                );
                                User? user =
                                await FireAuth.registerUsingEmailPassword(
                                  name: _usernameTextController.text,
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                );
                                setState(
                                      () {
                                    _isProcessing = false;
                                  },
                                );
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => dashboard(),
                                    ),
                                  );
                                } else if (user == null) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text(errormessage),
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 340,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: Colors.orange),
                                  color: Colors.orange,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.orange,
                                      offset: const Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 0.5,
                                      spreadRadius: 0.2,
                                    ),
                                  ]),
                              child: Center(
                                child: (Text(
                                  'Register Now',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text);
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 30,
                          child: Text('Forgot Password ?'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 30,
                            child: Text('OR'),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: null,
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 340,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: Color(0xff3b5998)),
                                  color: Color(0xff3b5998),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff3b5998),
                                      offset: const Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 0.5,
                                      spreadRadius: 0.2,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/facebook.png'))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                                    child: Center(
                                      child: (Text(
                                        'SignUp with Facebook',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
