import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  ProductDetailScreen({required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Product Detail',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding:
            EdgeInsets.only(top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.product.image,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(widget.product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Wrap(
              children: [
                Text(
                  widget.product.description,
                  maxLines: readMore ? 10 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Text(
                      readMore ? "Read less" : "Read more",
                      style: const TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      setState(() {
                        readMore = !readMore;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('\$${widget.product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
