import '../../Network/WebApiProvider.dart';
import '../Model/ActiveSchemeDetailsList.dart';
import '../Model/PaymentHistorydetailsList.dart';

class PaymentHistoryDetailsListRepository {
  Future paymenthistorydetailsList(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "user-scheme/payment-history-single/$id",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return PaymentHistoryDetailsList.fromJson(response);
  }

}