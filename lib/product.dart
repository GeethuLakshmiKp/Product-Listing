import 'package:flutter/material.dart';
import 'package:productlisting/api.dart';
import 'package:productlisting/cart.dart';
import 'package:productlisting/details.dart';
import 'package:provider/provider.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiConnection>(context, listen: false);
    api.fetchProducts();
    MediaQuery.of(context).size.width / double.infinity;
    MediaQuery.of(context).size.height / double.infinity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const cart()));
            },
          )
        ],
      ),
      //***********************************_____________________cOm______________________________************************** */
      body: Consumer<ApiConnection>(builder: (context, person, _) {
        person.fetchProducts();
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 100 / 125),
          itemCount: api.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Provider.of<ApiConnection>(context, listen: false)
                    .currentIndex = index;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const details()));
              },
              //_______________________________END____________________________________
              child: GridTile(
                child: Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromARGB(255, 252, 250, 250),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Image.network(
                      api.products[index]['image'],
                      height: 120,
                      width: 140,
                    ),
                    Text(api.products[index]["title"]),
                    Text(
                      'Price:\$${api.products[index]['price']}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
