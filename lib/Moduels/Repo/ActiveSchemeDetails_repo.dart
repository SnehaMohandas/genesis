import '../../Network/WebApiProvider.dart';
import '../Model/ActiveSchemeDetailsList.dart';

class ActiveSchemeDetailsListRepository {
  Future activeschemedetailsList(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "user-scheme/$id",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return ActiveSchemeDetailsList.fromJson(response);
  }

}