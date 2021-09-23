import 'package:flutter/material.dart';

class PopularListView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String shortDescription;
  final String description;
  final String id;
  final String price;
  final List categories;
  const PopularListView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.id,
    required this.price,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO GO to details page
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 300,
        width: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('images/image1.jpg'),
              ),
            ),
            Container(
              height: 300,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.black12,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        shortDescription,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$$price',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
