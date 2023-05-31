import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_app/models/products_model.dart';
import 'package:design_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.product, required this.docId});
  ProductModel product;
  List<String> docId;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List<String> tempDocId = [];
  filterProduct() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image(
                  fit: BoxFit.cover, image: NetworkImage(widget.product.image)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$ ${widget.product.price}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'share',
                    onPressed: () {},
                    child: const Icon(Icons.share),
                  ),
                  FloatingActionButton.small(
                    heroTag: 'fav',
                    onPressed: () {},
                    child: const Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 17),
                maxLines: 2,
              ),
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.stockStatus),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    '1 review',
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    '|',
                    style: TextStyle(fontSize: 17),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text(
                    widget.product.rate.toString(),
                    style: const TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              //color: Colors.red,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      widget.product.subImage.length,
                      (index) =>
                          buildSubImage(widget.product.subImage[index]))),
            ),
            const Card(
              elevation: 0,
              child: ListTile(
                title: Text('Color & Size', style: TextStyle(fontSize: 17)),
              ),
            ),
            const Card(
              elevation: 0,
              child: ListTile(
                title: Text('Item Description', style: TextStyle(fontSize: 17)),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'You may also like',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 300,
                width: double.infinity,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  childAspectRatio: 20 / 15,
                  children: List.generate(widget.docId.length, (index) {
                    CollectionReference dataProduct =
                        FirebaseFirestore.instance.collection('product');
                    return FutureBuilder<DocumentSnapshot>(
                      future: dataProduct.doc(widget.docId[index]).get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Icon(
                              Icons.info,
                              color: Colors.red,
                              size: 50,
                            ),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          final data = snapshot.data;
                          var pro = ProductModel.fromJson(data!);
                          return ProductCard(
                            product: ProductModel.fromJson(data),
                            docId: widget.docId,
                          );
                        }
                      },
                    );
                  }),
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: const Color.fromRGBO(33, 150, 243, 1),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Image(
                image: NetworkImage(
                    'https://www.iconpacks.net/icons/2/free-store-icon-2017-thumb.png'),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  height: 60,
                  color: const Color.fromARGB(255, 60, 8, 4),
                  child: Center(
                      child: Text(
                    'Add to Cart'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  )),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.red,
                  child: Center(
                      child: Text('buy now'.toUpperCase(),
                          style: const TextStyle(color: Colors.white))),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildSubImage(String image) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 70,
        width: 70,
        child: Image(image: NetworkImage(image)),
      ),
    );
  }
}
