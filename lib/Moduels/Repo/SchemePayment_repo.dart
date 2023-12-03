
import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';

import '../Model/SchemePaymentList.dart';

class SchemePaymentRepository {
  Future schemepaymentList(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "user-scheme/payment-history-scheme-single/$id",
        isPost: false,
        isDelete: false,
        isPatch: false,
        token: jsontoken,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("respo==${response}");
    return  SchemePaymentList.fromJson(response);
  }

}