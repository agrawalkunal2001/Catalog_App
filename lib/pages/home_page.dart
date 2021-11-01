import 'package:catalog/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/item.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

@override
void initState() {// This runs before build method
  super.initState();
  loadData();
}

loadData() async {
  var catalogJSON = await rootBundle.loadString("assets/files/catalog.json"); 
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MyItem(item: CatalogModel.items[index]);
          },
          itemCount: CatalogModel.items.length,
        ),
      ), // It is a kind of recycler view where the data which is not visible currently, renders and becomes visible when it is scrolled.
      drawer: MyDrawer(),
    );
  }
}
