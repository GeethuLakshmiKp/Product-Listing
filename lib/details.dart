import 'package:flutter/material.dart';
import 'package:productlisting/api.dart';
import 'package:provider/provider.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => detailsState();
}

class detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<ApiConnection>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Details',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
          ],
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.network(api.products[api.currentIndex]['image']),
            ),
            Text(
              api.products[api.currentIndex]['title'],
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(
              child: Text('Price:\$${api.products[api.currentIndex]['price']}'),
            ),
            Text(api.products[api.currentIndex]['category']),
            Text('${api.products[api.currentIndex]['rating']['rate']}'),
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width /
                        2, // Set width based on screen width
                    50, // Set a fixed height
                  ),

                  // Set a minimum size for the button

                  backgroundColor: (Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_shopping_cart),
                    SizedBox(width: 5),
                    Text('Add to Cart'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width /
                        2, // Set width based on screen width
                    50, // Set a fixed height
                  ),
                  backgroundColor: (Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.double_arrow_outlined),
                    SizedBox(width: 5),
                    Text('Buy Now'),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
