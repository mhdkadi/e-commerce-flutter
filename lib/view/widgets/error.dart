import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/size_configration.dart';
import '../../view_model/error_model.dart';

class FormError extends StatelessWidget {
  const FormError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ErrorModel>(builder: (context, model, child) {
      return Column(
        children: List.generate(
          model.errors.length,
          (index) =>
              formErrorText(error: model.errors[index], context: context),
        ),
      );
    });
  }

  Row formErrorText({required String error, required BuildContext context}) {
    return Row(
      children: [
        Icon(
          Icons.error,
          color: Colors.red[700],
        ),
        SizedBox(
          width: ScreenSize(context: context).getProportionateScreenWidth(9),
        ),
        SizedBox(
          width: ScreenSize(context: context).getProportionateScreenWidth(170),
          height: ScreenSize(context: context).getProportionateScreenHeight(20),
          child: FittedBox(
            child: Text(
              error,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
