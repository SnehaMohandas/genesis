import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/Active scheme.dart';

import '../Model/ReferralStatusList.dart';
import '../Repo/ReferralStatus_repo.dart';


class ReferralStatusListBloc {
  ReferralStatusListRepository referralstatusListRepository = ReferralStatusListRepository();
  final _referralstatusListDataController = StreamController<Response<ReferralStatusList>>();

  StreamSink<Response<ReferralStatusList>> get referralstatusListDataSink =>
      _referralstatusListDataController.sink;

  Stream<Response<ReferralStatusList>>? get referralstatusListDataStream =>
      _referralstatusListDataController.stream;

  ReferralStatusListBloc() {
    referralstatusListRepository= ReferralStatusListRepository();
    getreferralListBloc();
  }

  getreferralListBloc() async {
    referralstatusListDataSink.add(Response.loading('Fetching...'));
    try {
      ReferralStatusList activestatusList = await referralstatusListRepository.referralstatusList();
      referralstatusListDataSink.add(Response.success(activestatusList));
    } catch (e) {
      referralstatusListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _referralstatusListDataController.close();
  }
}