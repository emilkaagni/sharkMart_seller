import 'package:Indi_seller/const/colors.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: darkGrey),
        ),
        title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 350,
                itemCount: data['p_imgs'].length,
                aspectRatio: 16/9,
                viewportFraction: 1.0,
                itemBuilder: (context, index){
                  return Image.asset(
                    data["p_imgs"][index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                //  title and details section
                boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),

                10.heightBox,
                Row(
                  children: [
                    boldText(text: "${data['p_category']}", color: fontGrey, size: 16.0),
                    10.widthBox,
                    normalText(text: "${data['p_subcategory']}", color: fontGrey, size: 16.0),
                  ],
                ),
                10.heightBox,
                //  rating
                VxRating(
                  isSelectable: false,
                  value: double.parse(data['p_rating']),
                  onRatingUpdate: (value){},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  maxRating: 5,
                  size: 25,
                  // stepInt: true
                ),
                  10.heightBox,
                  boldText(text: "${data['p_price']}", color: red, size: 18.0),
                  //  color section
                  20.heightBox,
                  Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Color", color: fontGrey),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                    (index) => VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Color(data['p_colors'][index]))
                                          // .color(Color(data['p_colors'][index]).withOpacity(1.0));
                                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                                          .make()
                                          .onTap(() {}),
                              ),
                            ),
                          ],
                        ),

                        //  quantity row
                        10.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Quantity", color: fontGrey),
                            ),
                            normalText(text: "${data['p_quantity']} items", color:  fontGrey),
                          ],
                        ),
                      ],
                    ).box.white.padding(const EdgeInsets.all(8)).make(),
                  const Divider(),
                  //  description section
                  20.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  20.heightBox,
                  normalText(text: "${data['p_desc']}", color:  fontGrey),


                ],
              ),
            )


          ],
        ),
      ),

    );
  }
}
