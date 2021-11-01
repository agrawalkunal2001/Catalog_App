import 'package:flutter/material.dart';
import 'package:catalog/models/catalog.dart';

class MyItem extends StatelessWidget {
  final Item item;

  const MyItem({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$" + item.price.toString(),
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
