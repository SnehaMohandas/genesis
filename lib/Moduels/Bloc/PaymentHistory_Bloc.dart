import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/PaymentHistoryList.dart';
import '../Model/SchemeList.dart';
import '../Repo/PaymentHistory_repo.dart';
import '../Repo/Scheme_repo.dart';






class PaymentHistoryListBloc {
  PaymentHistoryListRepository  _PaymenthistoryListRepository =  PaymentHistoryListRepository ();
  final _paymenthistoryListDataController = StreamController<Response<PaymentHistoryList>>();

  StreamSink<Response<PaymentHistoryList>> get paymenthistoryListDataSink =>
      _paymenthistoryListDataController.sink;

  Stream<Response<PaymentHistoryList>>? get paymenthistoryListDataStream =>
      _paymenthistoryListDataController.stream;

  PaymentHistoryListBloc() {
    _PaymenthistoryListRepository  =  PaymentHistoryListRepository ();
    getPaymentHistoryListBloc();
  }

  getPaymentHistoryListBloc() async {
    paymenthistoryListDataSink.add(Response.loading('Fetching...'));
    try {
      PaymentHistoryList paymenthistoryList = await _PaymenthistoryListRepository.paymenthistorylist();
      paymenthistoryListDataSink  .add(Response.success(paymenthistoryList));
    } catch (e) {
      paymenthistoryListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _paymenthistoryListDataController.close();
  }
}
