import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/ActiveSchemeDetailsList.dart';
import '../Model/SchemeDetailsList.dart';
import '../Repo/ActiveSchemeDetails_repo.dart';
import '../Repo/SchemeDetails_repo.dart';




class ActiveSchemeDetailsListBloc{
  ActiveSchemeDetailsListRepository  _activeschemedetailsListepository = new  ActiveSchemeDetailsListRepository ();
  final _activeschmedetailsListDataController= StreamController<Response< ActiveSchemeDetailsList >>();

  StreamSink<Response<ActiveSchemeDetailsList   >> get activeschemedetailsListDataSink =>
      _activeschmedetailsListDataController.sink;

  Stream<Response< ActiveSchemeDetailsList  >>? get activeschemedetailsListDataStream =>
      _activeschmedetailsListDataController.stream;

  ActiveSchemeDetailsListBloc(String id,
      ) {
    _activeschemedetailsListepository  = ActiveSchemeDetailsListRepository();
    getSchemeDetailsListBloc(id,);
  }

  getSchemeDetailsListBloc(String id
      ) async {
    activeschemedetailsListDataSink .add(Response.loading('Fetching...'));
    try {
      ActiveSchemeDetailsList  _activeschemedetailsList = await  _activeschemedetailsListepository.activeschemedetailsList(id);
      activeschemedetailsListDataSink .add(Response.success(_activeschemedetailsList));
    } catch (e) {
      activeschemedetailsListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _activeschmedetailsListDataController.close();
  }
}
