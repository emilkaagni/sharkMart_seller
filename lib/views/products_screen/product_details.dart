import 'package:Indi_seller/const/colors.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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
        title: boldText(text: "Product title", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 350,
                itemCount: 3,
                aspectRatio: 16/9,
                viewportFraction: 1.0,
                itemBuilder: (context, index){
                  return Image.asset(
                    imgProduct,
                    // data["p_imgs"][index],
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
                boldText(text: "Product title", color: fontGrey, size: 16.0),
                // title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),

                10.heightBox,
                Row(
                  children: [
                    boldText(text: "Category", color: fontGrey, size: 16.0),
                    10.widthBox,
                    normalText(text: "Subcategory", color: fontGrey, size: 16.0),
                  ],
                ),
                10.heightBox,
                //  rating
                VxRating(
                  isSelectable: false,
                  value: 3.0,
                  onRatingUpdate: (value){},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  maxRating: 5,
                  size: 25,
                  // stepInt: true
                ),
                  10.heightBox,
                  boldText(text: "\$300", color: red, size: 18.0),
                  // "${data['p_price']}".numCurrency.text.color(redColor).fontFamily(bold).size(18).make(),
                  //  color section
                  20.heightBox,
                  Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Color", color: fontGrey),
                              // child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                    (index) => VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Vx.randomPrimaryColor)
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
                            normalText(text: "20 items", color:  fontGrey),
                          ],
                        ),
                      ],
                    ).box.white.padding(const EdgeInsets.all(8)).make(),
                  const Divider(),
                  //  description section
                  20.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  20.heightBox,
                  normalText(text: "Description of the item", color:  fontGrey),


                ],
              ),
            )


          ],
        ),
      ),

    );
  }
}
