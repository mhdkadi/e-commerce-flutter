import 'package:e_commerce_app/view/screens/home/screens/discover/discover_list_view.dart';
import 'package:e_commerce_app/view_model/products_api_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsModel _productsModel = Provider.of<ProductsModel>(context);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
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
            categories: _productsModel.productsList[index].categories,
          );
        },
      ),
    );
  }
}
