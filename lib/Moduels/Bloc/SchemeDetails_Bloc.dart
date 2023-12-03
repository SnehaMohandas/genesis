import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/SchemeDetailsList.dart';
import '../Repo/SchemeDetails_repo.dart';




class SchemeDetailsListBloc{
  SchemeDetailsRepository  _schemedetailsListepository = new  SchemeDetailsRepository ();
  final _schmedetailsListDataController= StreamController<Response< SchemeDetailsList >>();

  StreamSink<Response< SchemeDetailsList  >> get schemedetailsListDataSink =>
      _schmedetailsListDataController.sink;

  Stream<Response< SchemeDetailsList >>? get schemedetailsListDataStream =>
      _schmedetailsListDataController.stream;

  SchemeDetailsListBloc(String id,
      ) {
    _schemedetailsListepository  = SchemeDetailsRepository();
    getSchemeDetailsListBloc(id,);
  }

  getSchemeDetailsListBloc(String id
      ) async {
    schemedetailsListDataSink .add(Response.loading('Fetching...'));
    try {
      SchemeDetailsList  _schemedetailsList = await  _schemedetailsListepository.schemedetailsList(id);
      schemedetailsListDataSink .add(Response.success(_schemedetailsList));
    } catch (e) {
      schemedetailsListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _schmedetailsListDataController.close();
  }
}
