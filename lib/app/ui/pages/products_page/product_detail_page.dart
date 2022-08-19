import 'package:cocoroco/app/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ProductDetailPage')),
        body: SafeArea(child: Text('ProductDetailController')));
  }
}
