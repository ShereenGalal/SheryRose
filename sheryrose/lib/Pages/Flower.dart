import 'package:flutter/material.dart';

class Flower extends StatelessWidget {
  const Flower({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8E4E5).withOpacity(1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Stack(
                  children: const [
                    Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/Info_flower.jpg')),
                    Padding(
                      padding: EdgeInsets.only(top: 120, left: 30),
                      child: Text(
                        'SheryRose',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0XffAC7B81)),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0XffAC7B81),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(children: const [
                  Text(
                    'Our app features a vast selection of flowers, all of which are carefully curated to ensure the highest quality. Each flower is accompanied by a detailed description, including pricing information, so you can make an informed decision before making a purchase.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffE8E4E5)),
                  )
                ]),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
