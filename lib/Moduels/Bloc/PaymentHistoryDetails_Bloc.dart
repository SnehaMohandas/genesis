import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/ActiveSchemeDetailsList.dart';
import '../Model/PaymentHistorydetailsList.dart';
import '../Model/SchemeDetailsList.dart';
import '../Repo/ActiveSchemeDetails_repo.dart';
import '../Repo/PaymentHistoryDetails_repo.dart';
import '../Repo/SchemeDetails_repo.dart';




class PaymentHistoryDetailsListBloc{
  PaymentHistoryDetailsListRepository _paymenthistorydetailsListepository = new  PaymentHistoryDetailsListRepository ();
  final _paymenthistorydetailsListDataController= StreamController<Response<  PaymentHistoryDetailsList>>();

  StreamSink<Response< PaymentHistoryDetailsList   >> get paymenthistorydetailsListDataSink =>
      _paymenthistorydetailsListDataController.sink;

  Stream<Response<  PaymentHistoryDetailsList  >>? get paymenthistorydetailsListDataStream =>
      _paymenthistorydetailsListDataController.stream;

  PaymentHistoryDetailsListBloc(String id,
      ) {
    _paymenthistorydetailsListepository  = PaymentHistoryDetailsListRepository();
    getPaymentHistoryDetailsListBloc(id,);
  }

  getPaymentHistoryDetailsListBloc(String id
      ) async {
    paymenthistorydetailsListDataSink  .add(Response.loading('Fetching...'));
    try {
      PaymentHistoryDetailsList  _activeschemedetailsList = await  _paymenthistorydetailsListepository.paymenthistorydetailsList(id);
      paymenthistorydetailsListDataSink  .add(Response.success(_activeschemedetailsList));
    } catch (e) {
      paymenthistorydetailsListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _paymenthistorydetailsListDataController.close();
  }
}
