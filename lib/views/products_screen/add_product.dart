import 'package:Indi_seller/const/colors.dart';
import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/controllers/products_controller.dart';
import 'package:Indi_seller/views/products_screen/components/product_dropdown.dart';
import 'package:Indi_seller/views/products_screen/components/product_images.dart';
import 'package:Indi_seller/views/widgets/custom_texfield.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/loading_indicator.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductsController>();

    return Obx(()=> Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
          title: boldText(text: "Add product", size: 16.0),
          actions: [
            controller.isloading.value
                ?  loadingIndicator(circleColor: white)
                :TextButton(
                onPressed: ()async{
                  await controller.uploadImages();
                  await controller.uploadProduct(context);
                  Get.back();
                  },
                child: boldText(text: save, color: white))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(hint: "eg. T-shirt", label: "Product name", controller: controller.pnameController),
                10.heightBox,
                customTextField(hint: "eg. Oversize t-shirt", label: "Description", isDesc: true, controller: controller.pdescController),
                10.heightBox,
                customTextField(hint: "eg. 100", label: "Price", controller: controller.ppriceController),
                10.heightBox,
                customTextField(hint: "eg. 20", label: "Quantity",controller: controller.pquantitycontroller),
                10.heightBox,
                productDropdown("Category", controller.categoryList, controller.categoryvalue, controller),
                10.heightBox,
                productDropdown("Subcategory", controller.subcategoryList, controller.subcategoryvalue, controller),
                10.heightBox,
                const Divider(color: white),
                boldText(text: "Choose product images"),
                10.heightBox,
                Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      6,
                          (index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: controller.pImagesList[index] != null
                            ? Image.file(
                        controller.pImagesList[index],
                        width: 100,
                      ).onTap(() {
                        controller.pickImage(index, context);
                      })
                            : productImages(
                        label: "${index + 1}",
                      ).onTap(() {
                        controller.pickImage(index, context);
                      }),
                          ),
                    ),
                  ),
                )),
                5.heightBox,
                normalText(text: "First image will be your display image", color: lightGrey),
                const Divider(color: white),
                10.heightBox,
                boldText(text: "Choose product colors"),
                10.heightBox,
                Obx(()=>Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                        9,
                            (index) => Stack(
                              alignment: Alignment.center,
                              children: [
                                VxBox(
                                    // child: normalText(text: index, size: 22.0)
                                )
                                    .color(Vx.randomPrimaryColor).roundedFull.size(30, 30).make().onTap(() {
                                      controller.selectedColorIndex.value = index;
                                }),
                                controller.selectedColorIndex.value == index
                                    ? const Icon(Icons.done, color: white)
                                    : const SizedBox(),
                              ],
                            )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
