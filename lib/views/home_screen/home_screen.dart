import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/views/widgets/dashboard_button.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: dashboard, color: darkGrey, size: 16.0),
        actions: [
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d,''y').format(DateTime.now()), color: purpleColor)),
          10.heightBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context, title: products, count: "60", icon: icProducts),
                dashboardButton(context, title: orders, count: "10", icon: icOrders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context, title: rating, count: "5", icon: icStar),
                dashboardButton(context, title: totalSales, count: "10", icon: icTotalSales),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
