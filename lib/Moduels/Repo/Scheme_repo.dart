import '../../Network/WebApiProvider.dart';
import '../Model/Active scheme.dart';
import '../Model/SchemeList.dart';


class SchemeListRepository {
  Future schemeList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "scheme/all",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return SchemeList.fromJson(response);
  }

}