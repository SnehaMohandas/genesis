import '../../Network/WebApiProvider.dart';
import '../Model/Active scheme.dart';
import '../Model/PaymentList.dart';
import '../Model/SchemeList.dart';


class PaymentListRepository {
  Future paymentList(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "scheme/payment/$id",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return PaymentList.fromJson(response);
  }

}