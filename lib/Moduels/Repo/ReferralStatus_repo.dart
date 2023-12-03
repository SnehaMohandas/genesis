import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';
import '../../main.dart';
import '../Model/ReferralStatusList.dart';

class ReferralStatusListRepository {
  Future referralstatusList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "referral/payments-new/${user_id??globalUserId}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return ReferralStatusList.fromJson(response);
  }

}