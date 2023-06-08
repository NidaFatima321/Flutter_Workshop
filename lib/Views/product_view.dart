import 'package:flutter/material.dart';
import 'package:flutterworkshop/Model/products_model.dart';
import 'package:flutterworkshop/services/product_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductService productService=ProductService();
  late Products products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(products.products[0].brand),
    );
  }
  void getData() async{
    products=await productService.getProducts();
    setState(() {

    });
  }
}
