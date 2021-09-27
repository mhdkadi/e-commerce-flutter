import 'package:e_commerce_app/repository/srevice_manager.dart';
import 'package:e_commerce_app/view/screens/loading/loading_screen.dart';
import 'package:e_commerce_app/repository/user_authentication_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/consts.dart';
import 'categorie_list_view.dart';
import 'discover_list_view.dart';
import 'popular_list_view.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    final UserAuthentication _userAuthentication =
        Provider.of<UserAuthentication>(context, listen: false);
    final ServiceManager _serviceManager =
        Provider.of<ServiceManager>(context, listen: false);
    _serviceManager.getProducts();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _serviceManager.getFavorites(_userAuthentication.uid);
    });

    //TODO Unhandled Exception
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceManager>(
      builder: (context, model, child) {
        return model.productList.length == 0
            ? const LoadingScreen()
            : SingleChildScrollView(
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.productList.length,
                          itemBuilder: (context, index) {
                            return PopularListView(
                              product: model.productList[index],
                            );
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
                        itemCount: model.productList.length,
                        itemBuilder: (context, index) {
                          return DiscoverListView(
                            product: model.productList[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
