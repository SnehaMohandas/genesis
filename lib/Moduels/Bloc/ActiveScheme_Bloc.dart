import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/Active scheme.dart';
import '../Repo/ActiveScheme_repo.dart';



class ActiveSchemeListBloc {
  ActiveSchemeListRepository _activeschemeListRepository = ActiveSchemeListRepository();
  final _activeschemeListDataController = StreamController<Response<ActiveSchemeList>>();

  StreamSink<Response<ActiveSchemeList>> get activeschemeListDataSink =>
      _activeschemeListDataController.sink;

  Stream<Response<ActiveSchemeList>>? get activeschemeListDataStream =>
      _activeschemeListDataController.stream;

  ActiveSchemeListBloc() {
    _activeschemeListRepository = ActiveSchemeListRepository();
    getcategoryListBloc();
  }

  getcategoryListBloc() async {
    activeschemeListDataSink.add(Response.loading('Fetching...'));
    try {
      ActiveSchemeList activeList = await _activeschemeListRepository.activeschemeList();
      activeschemeListDataSink.add(Response.success(activeList));
    } catch (e) {
      activeschemeListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _activeschemeListDataController.close();
  }
}