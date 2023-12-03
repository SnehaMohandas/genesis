import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';
import '../../main.dart';
import '../Model/ReferralStatusCompleted.dart';

class ReferralStatusCompletedListRepository {
  Future referralstatuscompletedList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "referral/list/${user_id??globalUserId}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return ReferralStatusCompleted_List.fromJson(response);
  }

}