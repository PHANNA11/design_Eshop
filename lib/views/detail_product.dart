import 'package:design_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart ' as badges;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.product});
  ProductModel product;
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -20, end: -12),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: const Text(
              '2',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.red,
              padding: const EdgeInsets.all(5),
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white, width: 2),
              elevation: 0,
            ),
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
