import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Prams> {
  call(Prams prams);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
