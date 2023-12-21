import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:productlisting/view/product.dart';
import 'package:productlisting/viewModel/api.dart';

import 'package:provider/provider.dart';

import 'account.dart';
import 'order.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late List<Widget> widgetOptions;

  @override
  void initState() {
    super.initState();
    widgetOptions = [product(), const order(), account()];
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ApiConnection>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 34, 32, 32),
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 15, 15, 15)),
                accountName: Text(
                  'Shoping Cart',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                accountEmail: Text(
                  'Enjoy With Your Favorites',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ))
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0),
        child: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Color.fromARGB(255, 252, 253, 253),
        unSelectedColor: Color.fromARGB(136, 253, 241, 241),
        backgroundColor: Color.fromARGB(255, 8, 8, 8),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(label: 'Products', icon: Icons.widgets),
          CustomBottomBarItems(label: 'Orders', icon: Icons.work_outline),
          CustomBottomBarItems(label: 'Account', icon: Icons.person),
        ],
      ),
    );
  }
}
