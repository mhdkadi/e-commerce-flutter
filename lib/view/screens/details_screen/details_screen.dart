import 'package:e_commerce_app/repository/srevice_manager.dart';
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
  List _product = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<UserAuthentication>(
          builder: (context, authModel, child) {
            return Consumer<ServiceManager>(
              builder: (context, serviceModel, child) {
                _product = serviceModel.productList
                    .where((element) => element.productId == widget.id)
                    .toList();
                return Column(
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
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (serviceModel.favoriteList
                                        .contains(widget.id)) {
                                      serviceModel.removeFromFavoites(
                                          productId: widget.id,
                                          uid: authModel.uid);
                                    } else {
                                      serviceModel.addToFavoites(
                                          productId: widget.id,
                                          uid: authModel.uid);
                                    }
                                  },
                                  icon: serviceModel.favoriteList
                                          .contains(widget.id)
                                      ? const Icon(
                                          Icons.favorite,
                                          size: 50,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite_border,
                                          size: 50,
                                        ),
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
                      onPressed: () {
                        serviceModel.addToCart(
                            anount: 5,
                            productId: widget.id,
                            uid: authModel.uid);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 15),
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
