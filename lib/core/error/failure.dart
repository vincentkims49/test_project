import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<Object> properties;

  const Failure([this.properties = const <Object>[]]);

  @override
  List<Object> get props => properties;
}

class DatabaseFailure extends Failure {}

class CacheFailure extends Failure {}
