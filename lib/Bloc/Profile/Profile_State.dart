import 'package:equatable/equatable.dart';
import 'package:to_do_list/DataModels/DataModels.dart' show User;


abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;

  ProfileLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ProfileLoaded { User: $user }';
}

class ProfileNotLoaded extends ProfileState {}
