import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/consts.dart';
import '../../../../../view_model/products_api_model.dart';
import 'categorie_list_view.dart';
import 'discover_list_view.dart';
import 'popular_list_view.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    final ProductsModel _productsModel =
        Provider.of<ProductsModel>(context, listen: false);
    _productsModel.getProducts();
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ProductsModel _productsModel = Provider.of<ProductsModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                          hintText: 'Search Products',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_searchController.text.isNotEmpty) {
                      } else {}
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Text(
                  'Popular Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _productsModel.productsList.length,
                itemBuilder: (context, index) {
                  return PopularListView(
                      imageUrl: _productsModel.productsList[index].imageUrl,
                      title: _productsModel.productsList[index].title,
                      shortDescription:
                          _productsModel.productsList[index].shortDescription,
                      description:
                          _productsModel.productsList[index].description,
                      id: _productsModel.productsList[index].id,
                      price: _productsModel.productsList[index].price,
                      categories:
                          _productsModel.productsList[index].categories);
                },
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategorieWidget(
                    categorie: categories[index],
                  );
                },
              ),
            ),
            Row(
              children: const [
                Text(
                  'Discover Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: _productsModel.productsList.length,
              itemBuilder: (context, index) {
                return DiscoverListView(
                    imageUrl: _productsModel.productsList[index].imageUrl,
                    title: _productsModel.productsList[index].title,
                    shortDescription:
                        _productsModel.productsList[index].shortDescription,
                    description: _productsModel.productsList[index].description,
                    id: _productsModel.productsList[index].id,
                    price: _productsModel.productsList[index].price,
                    categories: _productsModel.productsList[index].categories);
              },
            ),
          ],
        ),
      ),
    );
  }
}
