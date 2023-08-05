// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sheryrose/Pages/HomeLayout.dart';
import 'package:sheryrose/Pages/SignUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool visible = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Image(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                image: AssetImage('assets/images/login.jpg')),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 500,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, left: 10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Join to find your ",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "favorite flowers.",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value != null) {
                                    if (value.contains('@') &&
                                        value.endsWith('.com')) {
                                      return null;
                                    }
                                    return 'Enter a valid email';
                                  }
                                  if (value!.isEmpty) {
                                    return "Email must not be empty";
                                  }

                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (String value) {},
                                /*onChanged: (String value) {
                                  print(value);
                                },*/
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter your email',
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "password  must not be empty";
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters in length';
                                  }
                                  return null;
                                },
                                obscureText: visible,
                                onFieldSubmitted: (String value) {},
                                onChanged: (String value) {},
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter the password',
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          visible = !visible;
                                        });
                                      },
                                      icon: visible
                                          ? const Icon(
                                              Icons.remove_red_eye,
                                            )
                                          : const Icon(Icons.visibility_off)),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      FloatingActionButton(
                                          heroTag: "fab1",
                                          mini: true,
                                          backgroundColor:
                                              const Color(0XffAC7B81),
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              /* FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: emailController.text,
                                                      password:
                                                          passwordController.text)
                                                  .then((value) {
                                                print(value.user?.email);
                                              
                                              });*/
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignUp()),
                                              );
                                            }
                                          },
                                          child: const Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Colors.white,
                                            size: 20,
                                          )),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text(
                                        "SignUp",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 75,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "LogIn",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      FloatingActionButton(
                                          mini: true,
                                          backgroundColor:
                                              const Color(0XffAC7B81),
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text)
                                                  .then((value) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomeLayout()),
                                                );
                                              });
                                            } else {}
                                          },
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
