
import '../../LOGIN/Login_page.dart';
import '../../Network/WebApiProvider.dart';
import '../Model/SchemeDetailsList.dart';

class SchemeDetailsRepository {
  Future schemedetailsList(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "scheme/$id",
        isPost: false,
        isDelete: false,
        isPatch: false,
        token: jsontoken,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("respo==${response}");
    return  SchemeDetailsList.fromJson(response);
  }

}