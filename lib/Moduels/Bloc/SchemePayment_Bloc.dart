import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/SchemeDetailsList.dart';
import '../Model/SchemePaymentList.dart';
import '../Repo/SchemeDetails_repo.dart';
import '../Repo/SchemePayment_repo.dart';




class SchemePaymentListBloc{
  SchemePaymentRepository  _schemepaymentListepository = new  SchemePaymentRepository ();
  final _schemepymentListDataController= StreamController<Response< SchemePaymentList >>();

  StreamSink<Response< SchemePaymentList  >> get schemepaymentListDataSink =>
      _schemepymentListDataController.sink;

  Stream<Response< SchemePaymentList >>? get schemepaymentListDataStream =>
      _schemepymentListDataController.stream;

  SchemePaymentListBloc(String id,
      ) {
    _schemepaymentListepository  = SchemePaymentRepository();
    getSchemePaymentListBloc(id,);
  }

  getSchemePaymentListBloc(String id
      ) async {
    schemepaymentListDataSink .add(Response.loading('Fetching...'));
    try {
      SchemePaymentList  _schemedetailsList = await  _schemepaymentListepository.schemepaymentList(id);
      schemepaymentListDataSink .add(Response.success(_schemedetailsList));
    } catch (e) {
      schemepaymentListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _schemepymentListDataController.close();
  }
}
