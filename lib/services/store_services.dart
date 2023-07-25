import 'package:Indi_seller/const/const.dart';

class StoreServices{
  static getProfile(uid){
    return firestore.collection(vendorsCollection).where('id', isEqualTo: uid).get();
  }
  static getMessages(uid){
    return firestore.collection(chatsCollection).where('toId', isEqualTo: uid).snapshots();
  }
}