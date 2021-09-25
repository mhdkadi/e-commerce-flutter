import 'package:e_commerce_app/view_model/products_api_model.dart';
import 'package:e_commerce_app/view_model/user_authentication_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final ProductsModel _productsModel =
        Provider.of<ProductsModel>(context, listen: false);
    final UserAuthentication _userAuthentication =
        Provider.of<UserAuthentication>(context, listen: false);
    if (_productsModel.favoritesList.length == 0) {
      _productsModel.getFavorite(_userAuthentication.uid);
    }
    List _product = _productsModel.productsList
        .where((element) => element.id == widget.id)
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('images/image1.jpg'),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  left: 20,
                  top: 20,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _product[0].title,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Consumer<ProductsModel>(
                          builder: (context, model, child) {
                            return IconButton(
                              onPressed: () {
                                if (model.favoritesList.contains(widget.id)) {
                                  model.removeFavorite(
                                      productId: widget.id,
                                      uid: _userAuthentication.uid);
                                } else {
                                  model.addFavorite(
                                      productId: widget.id,
                                      uid: _userAuthentication.uid);
                                }
                              },
                              icon: model.favoritesList.contains(widget.id)
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 50,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 50,
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      "\$${_product[0].price}",
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            _product[0].description,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                child: Text(
                  'Add To Chart',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
