import 'package:equatable/equatable.dart';
import 'package:intimate/core/resources/data_state.dart';

abstract class UseCase<Type, Params> {
  Future<DataState<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
