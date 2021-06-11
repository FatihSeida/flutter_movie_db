part of 'credit_cubit.dart';

abstract class CreditState extends Equatable {
  const CreditState();

  @override
  List<Object> get props => [];
}

class CreditInitial extends CreditState {}

class CreditLoading extends CreditState {}

class CreditLoaded extends CreditState {
  final List<MovieCredits> items;

  CreditLoaded(this.items);
}

class CreditError extends CreditState {}
