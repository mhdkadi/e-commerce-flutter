import 'package:e_commerce_app/view_model/products_api_model.dart';
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
    // var d = _productsModel.productsList.where((element) {
    //   if (element.id == widget.id) {
    //     print(element.id);
    //   }
    // });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text('$d'),
                      //var contain = listOfDownloadedFile.where((element) => element.Url == "your URL link");
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
