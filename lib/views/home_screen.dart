import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:design_app/models/products_model.dart';
import 'package:design_app/views/auth/signin_acc_screen.dart';
import 'package:design_app/widgets/product_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> filterList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance
                      .signOut()
                      .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                          (route) => false));
                },
                icon: const Icon(Icons.logout_outlined)),
          ],
        )),
      ),
      appBar: AppBar(
        title: const Text('E-Shop'),
        centerTitle: true,
        actions: [
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filterList = products
                      .where((element) => element.name.contains(value))
                      .toList();
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: ' Search products'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top Selling',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 10 / 15,
            children: List.generate(
                searchController.text.isEmpty || filterList.isEmpty
                    ? products.length
                    : filterList.length,
                (index) => ProductCard(
                      product:
                          searchController.text.isEmpty || filterList.isEmpty
                              ? products[index]
                              : filterList[index],
                    )),
          ))
        ],
      ),
    );
  }
}
