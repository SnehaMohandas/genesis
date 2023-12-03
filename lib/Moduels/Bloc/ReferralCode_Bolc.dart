import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/Active scheme.dart';
import '../Model/ReferralCode.dart';
import '../Repo/ActiveScheme_repo.dart';
import '../Repo/ReferralCode_repo.dart';



class ReferralCodeBloc {
  ReferralCodeRepository _referralcodeRepository = ReferralCodeRepository ();
  final _referralcodeDataController = StreamController<Response<ReferralCode>>();

  StreamSink<Response<ReferralCode>> get referralcodeDataSink =>
      _referralcodeDataController .sink;

  Stream<Response<ReferralCode>>? get referralcodeDataStream =>
      _referralcodeDataController .stream;

  ReferralCodeBloc() {
    _referralcodeRepository =ReferralCodeRepository ();
    getReferralCodeBloc();
  }

  getReferralCodeBloc() async {
    referralcodeDataSink.add(Response.loading('Fetching...'));
    try {
      ReferralCode referralcode = await _referralcodeRepository.referralcode();
      referralcodeDataSink.add(Response.success(referralcode));
    } catch (e) {
      referralcodeDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _referralcodeDataController.close();
  }
}