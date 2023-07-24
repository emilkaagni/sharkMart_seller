
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;
import '../../const/const.dart';

AppBar appbarWidget(title){
  return AppBar(
    backgroundColor: white,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: fontGrey, size: 16.0),
    actions: [
      Center(child: normalText(text: intl.DateFormat('EEE, MMM d,''y').format(DateTime.now()), color: purpleColor)),
      10.heightBox,
    ],

  );
}