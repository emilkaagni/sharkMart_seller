import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/views/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;

import '../widgets/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: (){}, child: const Icon(Icons.add),),
      appBar: appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            // can use listView.builder if using more than 100 items
            children: List.generate(20, (index) => ListTile(
              onTap: (){},
              leading: Image.asset(imgProduct, width: 100, height: 100, fit: BoxFit.cover),
              title: boldText( text: "Product title", color: fontGrey),
              subtitle: normalText(text: "\$40", color: darkGrey),
            ))
          ),
        )),
        );
  }
}
