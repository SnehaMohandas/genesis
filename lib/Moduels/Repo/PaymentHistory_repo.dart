import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';
import '../../main.dart';
import '../Model/PaymentHistoryList.dart';

class PaymentHistoryListRepository {
  Future paymenthistorylist() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "user-scheme/payment-history/${user_id??globalUserId}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return PaymentHistoryList.fromJson(response);
  }

}