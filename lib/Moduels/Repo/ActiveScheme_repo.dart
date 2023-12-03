

import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';
import '../../main.dart';
import '../Model/Active scheme.dart';


class ActiveSchemeListRepository {
  Future activeschemeList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "user-scheme/all/${user_id??globalUserId}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return ActiveSchemeList.fromJson(response);
  }

}
// MaterialPageRoute(
//   builder: (context) => PaymentScreen(
//     id: count!.payments![0].schemeId.toString(), date:count!.payments![0].paymentDates.toString(),
//     amount: count!.payments![0].paymentAmount.toString() ,
//   ),
// ),