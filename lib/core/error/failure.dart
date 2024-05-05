import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String errorMessage;
  const Failure({ this.errorMessage="something wrong"});

  @override
  List<Object?> get props =>[errorMessage];

}