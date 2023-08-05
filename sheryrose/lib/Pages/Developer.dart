import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80, bottom: 30),
                child: Text(
                  'Shereen Galal El-kassaby',
                  style: TextStyle(
                      color: Color(0xffE8E4E5),
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ),
              const CircleAvatar(
                backgroundColor: Color(0xffE8E4E5),
                radius: 75,
                child: Icon(
                  color: Color(0XffAC7B81),
                  size: 80,
                  Icons.person,
                ),
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                    color: Color(0xff513D3D),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: 390,
                  child: Column(
                    children: [
                      Row(children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.email_outlined,
                            color: Color(0XffAC7B81),
                          ),
                        ),
                        Text(
                          'shereengalal60@gmail.com',
                          style: TextStyle(
                              color: Color(0xff513D3D),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      const Divider(color: Color(0XffAC7B81)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: 390,
                  child: Column(
                    children: [
                      Row(children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.phone_android,
                            color: Color(0XffAC7B81),
                          ),
                        ),
                        Text(
                          '01011487026',
                          style: TextStyle(
                              color: Color(0xff513D3D),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      const Divider(color: Color(0XffAC7B81)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
