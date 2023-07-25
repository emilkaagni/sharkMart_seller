import 'dart:io';

import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/controllers/profile_controller.dart';
import 'package:Indi_seller/views/widgets/custom_texfield.dart';
import 'package:Indi_seller/views/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text_style.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Obx(()=>
        Scaffold(
          resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar : AppBar(
          title: boldText(text: editProfile, size: 16.0),
          actions: [
            controller.isloading.value? loadingIndicator(circleColor: white):
            TextButton(onPressed: ()async{

              controller.isloading(true);
              //    if image is not selected
                 if(controller.profileImgPath.value.isNotEmpty){
                   await controller.uploadProfileImage();

                 }else{
                   controller.profileImageLink = controller.snapshotData['imageUrl'];
                 }
              //if old password matches database
              if(controller.snapshotData['password']==controller.oldpassController.text){
                await controller.changeAuthPassword(
                    email: controller.snapshotData['email'],
                    password: controller.oldpassController.text,
                    newpassword: controller.newpassController.text
                );


                await controller.updateProfile(
                    imgUrl: controller.profileImageLink,
                    name: controller.nameController.text,
                    password: controller.newpassController.text);
                VxToast.show(context, msg: "Updated");
              }else if(controller.oldpassController.text.isEmptyOrNull && controller.newpassController.text.isEmptyOrNull){
                await controller.updateProfile(
                    imgUrl: controller.profileImageLink,
                    name: controller.nameController.text,
                    password: controller.snapshotData['password']);
                VxToast.show(context, msg: "Updated");
              }else{
                VxToast.show(context, msg: "error occured");
                controller.isloading(false);
              }


            }, child: normalText(text:save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                //if data image url and controller path is empty
                controller.snapshotData['imageUrl']=='' && controller.profileImgPath.isEmpty
                    ? Image.asset(imgProduct, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                //if data is not empty but controller path is empty
                    : controller.snapshotData['imageUrl']!=''&& controller.profileImgPath.isEmpty
                    ? Image.network(controller.snapshotData['imageUrl'], width: 100,
                  fit:BoxFit.cover,)
                //else if controller path is not empty but data image url is
                    :Image.file(
                  File(controller.profileImgPath.value),
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),


                // Image.asset(imgProduct, width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: white),
                    onPressed: (){
                      controller.changeImage(context);
                    },
                    child: normalText(text: changeImage, color: fontGrey),
                ),
                10.heightBox,
                const Divider(color: white),
                5.heightBox,
                customTextField(label: name, hint:"eg. shark", controller: controller.nameController),
                30.heightBox,
                Align(alignment: Alignment.centerLeft, child: boldText(text: "Change your password"),),
                10.heightBox,
                customTextField(label: password,hint: passwordHint, controller: controller.oldpassController),
                10.heightBox,
                customTextField(label: confirmPass, hint: passwordHint, controller: controller.newpassController),

              ],
            ),
        ),

      ),
    );
  }
}
