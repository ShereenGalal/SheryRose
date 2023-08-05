// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<String> imagesUrlCategories = [
  'assets/images/Gifts&Bundles.jpg',
  'assets/images/OnlyFlowers.jpg',
  'assets/images/HandBouquets.jpg',
  'assets/images/FlowersinVases.jpg',
  'assets/images/FlowersinBaskets.jpg',
  'assets/images/HomeAccessories.jpg',
];
int categoryIndex = 0;
List<String> categories = [
  "Gifts & Bundles",
  "Only Flowers",
  "Hand Bouquets",
  "Flowers in Vases",
  "Flowers in Baskets",
  "Home Accessories"
];

class _HomeState extends State<Home> {
  final flowerStream =
      FirebaseFirestore.instance.collection('flowers').snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
           Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                hintText: 'What are you looking for?',
                hintStyle: const TextStyle(
                  color: Color(0xff513D3D),
                ),
                suffixIcon: Container(
                  height: 20,
                  width: 30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                  color: const Color(0XffAC7B81)),
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                suffixIconColor: const Color(0xffE8E4E5),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(
                    color: Color(0xffC6BDC2),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Shop our categories",
              style: TextStyle(
                  color: Color(0XffAC7B81),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                      height: 150,
                      width: 150,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 140,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage(imagesUrlCategories[index])),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            categories[index],
                            style: const TextStyle(
                                color: Color(0xff513D3D),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemCount: categories.length),
          ),
          const Text(
            "Our best sellers",
            style: TextStyle(
                color: Color(0XffAC7B81),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: StreamBuilder(
              stream: flowerStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Connection error');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading....');
                }
                var docs = snapshot.data!.docs;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: docs.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(docs[index]['imageUrl'])),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 5),
                              child: Row(
                                children: [
                                  Text(
                                    docs[index]['name'],
                                    style: const TextStyle(
                                        color: Color(0xff513D3D),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "${docs[index]['price']}\$",
                                    style: const TextStyle(
                                        color: Color(0xff513D3D),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
