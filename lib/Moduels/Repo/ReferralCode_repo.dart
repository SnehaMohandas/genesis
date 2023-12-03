import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';
import '../../main.dart';
import '../Model/ReferralCode.dart';

class ReferralCodeRepository {
  Future referralcode() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "referral/${user_id??globalUserId}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return ReferralCode.fromJson(response);
  }

}