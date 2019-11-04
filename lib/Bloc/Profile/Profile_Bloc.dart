import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:to_do_list/DataModels/DataModels.dart' show User;

import 'Profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc();

  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadProfileToState();
    } else if (event is EditProfile) {
      yield* _mapEditProfileToState(event);
    }
  }

  Stream<ProfileState> _mapLoadProfileToState() async* {
    try {

      final user = await User.u.fetch();
      User.u=user;
      yield ProfileLoaded(
        user,
      );
    } catch (_) {
      yield ProfileNotLoaded();
    }
  }

  Stream<ProfileState> _mapEditProfileToState(EditProfile event) async* {
    if (state is ProfileLoaded) {
      User.u=event.newProfile;
      yield ProfileLoaded(User.u);
      User.u.patch(event.context);
    }
  }

}
