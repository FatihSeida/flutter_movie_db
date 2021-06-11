import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/models/models.dart';

part 'credit_state.dart';

class CreditCubit extends Cubit<CreditState> {
  CreditCubit() : super(CreditInitial());

  // Future<void> fetchCredits {

  // }
}
