import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/PaymentList.dart';
import '../Repo/Payment_repo.dart';




class PaymentListBloc{
  PaymentListRepository  _paymentListepository = new PaymentListRepository ();
  final _paymentListDataController= StreamController<Response< PaymentList >>();

  StreamSink<Response< PaymentList >> get paymentListDataSink =>
      _paymentListDataController.sink;

  Stream<Response< PaymentList>>? get paymentListDataStream =>
      _paymentListDataController.stream;

  PaymentListBloc(String id,
      ) {
    _paymentListepository  = PaymentListRepository();
    getLibraryDetailsListBloc(id,);
  }

  getLibraryDetailsListBloc(String id
      ) async {
    paymentListDataSink .add(Response.loading('Fetching...'));
    try {
      PaymentList _paymentList = await _paymentListepository.paymentList(id);
      paymentListDataSink.add(Response.success(_paymentList));
    } catch (e) {
      paymentListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _paymentListDataController.close();
  }
}
