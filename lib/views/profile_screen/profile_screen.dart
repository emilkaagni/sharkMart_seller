import 'package:Indi_seller/const/colors.dart';
import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/const/strings.dart';
import 'package:Indi_seller/const/strings.dart';
import 'package:Indi_seller/views/messages_screen/messages_screen.dart';
import 'package:Indi_seller/views/profile_screen/edit_profilescreen.dart';
import 'package:Indi_seller/views/shop_screen/shop_settings_screen.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(onPressed: (){
            Get.to(()=>const EditProfileScreen());
          }, icon:const Icon(Icons.edit)),
          TextButton(onPressed: (){}, child: normalText(text: logout))

        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
              title: boldText(text: "Vendor name"),
              subtitle: normalText(text: "vendoremail@shark.com"),
            ),
            const Divider(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                  List.generate(
                      profileButtonsIcons.length,
                          (index) => ListTile(
                            onTap: (){
                              switch(index){
                                case 0:
                                  Get.to(()=>const ShopSettings());

                                  break;
                                case 1:
                                  Get.to(()=> const MessagesScreen());
                                  break;
                                default:
                              }
                            },
                            leading: Icon(profileButtonsIcons[index], color: white),
                            title: normalText(text: profileButtonsTitles[index]),
                          ))
                ),

            )
          ],
        ),
      ),
    );
  }
}
