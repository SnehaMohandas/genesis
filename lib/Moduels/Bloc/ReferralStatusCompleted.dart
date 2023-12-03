import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/Active scheme.dart';
import '../Model/ReferralStatusCompleted.dart';
import '../Repo/referralStatusCompleted.dart';


class ReferralStatusCompletedListBloc {
  ReferralStatusCompletedListRepository _referralstatuscompletedListRepository = ReferralStatusCompletedListRepository();
  final _referralstatuscompletedListDataController = StreamController<Response<ReferralStatusCompleted_List>>();

  StreamSink<Response<ReferralStatusCompleted_List>> get referralstatuscompletedListDataSink =>
      _referralstatuscompletedListDataController.sink;

  Stream<Response<ReferralStatusCompleted_List>>? get referralstatuscompletedListDataStream =>
      _referralstatuscompletedListDataController.stream;

  ReferralStatusCompletedListBloc() {
    _referralstatuscompletedListRepository = ReferralStatusCompletedListRepository();
    getreferralcompletedListBloc();
  }

  getreferralcompletedListBloc() async {
    referralstatuscompletedListDataSink.add(Response.loading('Fetching...'));
    try {
      ReferralStatusCompleted_List activeList = await _referralstatuscompletedListRepository.referralstatuscompletedList();
      referralstatuscompletedListDataSink.add(Response.success(activeList));
    } catch (e) {
      referralstatuscompletedListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _referralstatuscompletedListDataController.close();
  }
}