import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/Active scheme.dart';
import '../Model/ReferralEraningList.dart';
import '../Repo/ActiveScheme_repo.dart';
import '../Repo/ReferralEarning_repo.dart';



class ReferralEarningListBloc {
  ReferralEarningListRepository _referralListRepository = ReferralEarningListRepository();
  final _referralListDataController = StreamController<Response<ReferralEarningList >>();

  StreamSink<Response<ReferralEarningList >> get referralListDataSink =>
      _referralListDataController.sink;

  Stream<Response<ReferralEarningList >>? get referralListDataStream =>
      _referralListDataController.stream;

  ReferralEarningListBloc () {
    _referralListRepository =ReferralEarningListRepository();
    getreferralListBloc();
  }

  getreferralListBloc() async {
    referralListDataSink .add(Response.loading('Fetching...'));
    try {
      ReferralEarningList  referralearningList = await _referralListRepository.referralList();
      referralListDataSink .add(Response.success(referralearningList ));
    } catch (e) {
      referralListDataSink .add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _referralListDataController.close();
  }
}