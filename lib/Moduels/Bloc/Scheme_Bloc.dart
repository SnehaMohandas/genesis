import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/SchemeList.dart';
import '../Repo/Scheme_repo.dart';






class SchemeListBloc {
  SchemeListRepository _schemeListRepository =  SchemeListRepository();
  final _schemeListDataController = StreamController<Response<SchemeList>>();

  StreamSink<Response<SchemeList>> get schemeListDataSink =>
      _schemeListDataController.sink;

  Stream<Response<SchemeList>>? get schemeListDataStream =>
      _schemeListDataController.stream;

  SchemeListBloc() {
    _schemeListRepository  =  SchemeListRepository();
    getschemeListBloc();
  }

  getschemeListBloc() async {
    schemeListDataSink .add(Response.loading('Fetching...'));
    try {
      SchemeList schemeList = await _schemeListRepository .schemeList();
      schemeListDataSink  .add(Response.success(schemeList));
    } catch (e) {
      schemeListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _schemeListDataController.close();
  }
}
