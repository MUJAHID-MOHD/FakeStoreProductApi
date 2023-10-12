import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeproductapi/screens/productdetail_screen.dart';

import '../controllers/product_controller.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Infinity Shopping',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (productController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              var product = productController.products[index];
              return Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Get.to(() => ProductDetailScreen(product: product));
                  },
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                  ),
                ),
              ).paddingOnly(left: 4.0, right: 4.0);
            },
          );
        }
      }),
    );
  }
}

// void main() => runApp(GetMaterialApp(home: ProductListScreen()));
