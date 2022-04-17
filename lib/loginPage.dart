import 'package:btt/dashboard.dart';
import 'package:btt/validation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

TextEditingController _emailTextController = TextEditingController();
TextEditingController _passwordTextController = TextEditingController();
final _focusEmail = FocusNode();
final _focusPassword = FocusNode();
final _formkey = GlobalKey<FormState>();
bool _isProcessing = false;
User? user = FirebaseAuth.instance.currentUser;

class _login_pageState extends State<login_page> {
  void _navigatetodashboardpage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width),
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
                                  keyboardType: TextInputType.text,
                                  textDirection: TextDirection.ltr,
                                  controller: _emailTextController,
                                  focusNode: _focusEmail,
                                  validator: (value) => Validator.validateEmail(
                                    email: value,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: 'Enter email',
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
                                    hintText: 'Password',
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
                                _focusEmail.unfocus();
                                _focusPassword.unfocus();

                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    _isProcessing = true;
                                  });
                                  User? user =
                                      await FireAuth.signInUsingEmailPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                  );
                                  setState(() {
                                    _isProcessing = false;
                                  });

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
                                margin: EdgeInsets.only(top: 30),
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
                                    'Login',
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
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: null,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(250, 10, 30, 0),
                              height: 30,
                              child: Text('Forgot Password ?'),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(200, 0, 150, 0),
                            height: 30,
                            child: Text('OR'),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: _navigatetodashboardpage,
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                width: 340,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border:
                                        Border.all(color: Color(0xff3b5998)),
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
                                          'Login with Facebook',
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
      ),
    );
  }
}
