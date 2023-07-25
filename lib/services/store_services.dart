import 'package:Indi_seller/const/const.dart';

class StoreServices{
  static getProfile(uid){
    return firestore.collection(vendorsCollection).where('id', isEqualTo: uid).get();
  }
}