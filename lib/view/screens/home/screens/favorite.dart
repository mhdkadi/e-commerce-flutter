import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../repository/srevice_manager.dart';
import 'discover/discover_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceManager>(
      builder: (context, model, child) {
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: model.productList.length,
            itemBuilder: (context, index) {
              return DiscoverListView(
                product: model.productList[index],
              );
            },
          ),
        );
      },
    );
  }
}
