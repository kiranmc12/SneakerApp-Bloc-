import 'package:bloc_practice_shopping/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  ProductTileWidget({super.key, 
  required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl))
            ),
            
          ),
          Text(productDataModel.name),
          Text(productDataModel.description),
        ],
      ),
    );
  }
}
