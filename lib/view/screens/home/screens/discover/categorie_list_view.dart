import 'package:flutter/material.dart';

class CategorieWidget extends StatelessWidget {
  const CategorieWidget({Key? key, required this.categorie}) : super(key: key);
  final String categorie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionChip(
          label: Text(categorie),
          onPressed: () {
            //TODO GO to details page
          },
          backgroundColor: Colors.blueGrey[50],
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
