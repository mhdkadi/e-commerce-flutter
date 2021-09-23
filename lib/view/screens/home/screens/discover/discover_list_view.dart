import 'package:flutter/material.dart';

class DiscoverListView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String shortDescription;
  final String description;
  final String id;
  final String price;
  final List categories;
  const DiscoverListView({
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
        Navigator.of(context).pushNamed('/DetailsScreen', arguments: id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/image1.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(shortDescription),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '\$$price',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
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
