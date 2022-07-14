import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fugipie_inventory/repository/authRepository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;
  SignupCubit(this._authRepository) : super(SignupState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SignupStatus.initial,
      ),
    );
  }

  Future<void> Signupformsubmitted() async{
    if(state.status == SignupStatus.submiting) return;
    emit(state.copyWith(status: SignupStatus.submiting));
    try {
      await _authRepository.signup(email: state.email, password: state.password);
      emit(state.copyWith(status: SignupStatus.success));
    } catch (_){}
  }


}
