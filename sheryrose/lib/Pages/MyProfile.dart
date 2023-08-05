import 'package:flutter/material.dart';
import 'package:sheryrose/Pages/HomeLayout.dart';

class MyProfile extends StatelessWidget {
  String? email;
  String? name;
  MyProfile({super.key, this.email, this.name});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0XffAC7B81),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                  )),
              Expanded(flex: 2, child: Container()),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 30),
                  child: Text(
                    name!,
                    style: const TextStyle(
                        color: Color(0xffE8E4E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xffE8E4E5),
                  radius: 80,
                  child: Icon(
                    color: Color(0XffAC7B81),
                    size: 80,
                    Icons.person,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: name!,
                    hintStyle: const TextStyle(
                      color: Color(0xff513D3D),
                    ),
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      size: 30,
                    ),
                    prefixIconColor: const Color(0XffAC7B81),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffC6BDC2),
                      ),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: email!,
                    hintStyle: const TextStyle(
                      color: Color(0xff513D3D),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 30,
                    ),
                    prefixIconColor: const Color(0XffAC7B81),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffC6BDC2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: null,
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0XffAC7B81)),
                    child: const Center(
                        child: Text(
                      'Edit profile',
                      style: TextStyle(
                          color: Color(0xffE8E4E5),
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.white.withOpacity(0.2),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeLayout()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
