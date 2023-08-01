import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/views/messages_screen/components/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/store_services.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/text_style.dart';

import '../../controllers/chats_controller.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
        var controller = Get.put(ChatsController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color:darkGrey),
            onPressed: (){
              Get.back();
      },
        ),
        title: boldText( text: chat, size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: StreamBuilder(
              stream: StoreServices.getMessages(controller.chatDocId.toString()),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                if(!snapshot.hasData){
                  return Center(
                    child: loadingIndicator(),
                  );
                }
                // else if (snapshot.hasError) {
                //   return Center(
                //     child: Text('Error: ${snapshot.error}'),
                //   );
                // }
                // else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                else if(snapshot.data!.docs.isEmpty){
                  return Center(
                    child: "Send a message...".text.color(darkGrey).make(),
                  );
                } else {
                  return ListView(
                    children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                      var data = snapshot.data!.docs[index];

                      return senderBubble(data);
                      // Align(
                      //   alignment: data['uid']==currentUser!.uid ? Alignment.centerRight : Alignment.centerLeft,
                      //   child: senderBubble(data));
                    }).toList(),
                  );
                }

              },
            ),
            ),
            10.heightBox,
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Enter Message",
                          border: OutlineInputBorder(borderSide: BorderSide(color: purpleColor)),
                          focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: purpleColor)),
                        ),

                  )),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: purpleColor,))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}



