import 'package:Indi_seller/const/colors.dart';
import 'package:Indi_seller/views/messages_screen/chat_screen.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/strings.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:darkGrey),
          onPressed: (){
            Get.back();
          },
        ),
        title: boldText( text: messages, size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
                (index)=>ListTile(
                  onTap: (){
                    Get.to(()=>const ChatScreen());
                  },
                  leading: const CircleAvatar(
                    backgroundColor: purpleColor,
                    child: Icon(
                      Icons.person,
                      color: white,
                    ),
                  ),
                  title: boldText(text: "Username", color: fontGrey),
                  subtitle: normalText(text: "Last message...", color: darkGrey),
                  trailing: normalText(text: "10:45 PM", color: darkGrey),
                )
            ),
          ),
        ),
      ),
    );
  }
}
