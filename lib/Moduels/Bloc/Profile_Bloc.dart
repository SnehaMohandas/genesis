import 'dart:async';

import '../../Network/Respones.dart';
import '../Model/Active scheme.dart';
import '../Model/ProfileList.dart';
import '../Repo/ActiveScheme_repo.dart';
import '../Repo/Profile_repo.dart';



class ProfileListBloc {
  ProfileListRepository _profileListRepository = ProfileListRepository ();
  final _profileListDataController = StreamController<Response<ProfileList>>();

  StreamSink<Response<ProfileList>> get profileListDataSink =>
      _profileListDataController.sink;

  Stream<Response<ProfileList>>? get profileListDataStream =>
      _profileListDataController.stream;

  ProfileListBloc() {
    _profileListRepository = ProfileListRepository ();
    getprofileListBloc();
  }

  getprofileListBloc() async {
    profileListDataSink.add(Response.loading('Fetching...'));
    try {
      ProfileList profileList = await _profileListRepository.profileList();
      profileListDataSink.add(Response.success(profileList));
    } catch (e) {
      profileListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _profileListDataController.close();
  }
}