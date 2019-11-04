import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/DataModels/DataModels.dart' show User;

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
}

class EditProfile extends ProfileEvent {
  final User newProfile;
  final BuildContext context;
  const EditProfile(this.newProfile, this.context);

  @override
  List<Object> get props => [newProfile];

  @override
  String toString() => 'EditProfile { profile: $newProfile }';
}

