import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_zen/feature/auth/model/data/repositories/auth_repositiory.dart';
import 'package:task_zen/feature/auth/presentation/view_model/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthInitial());

  Future login(String email, String password) async {
    emit(const AuthLoading());
    try {
      final user = await _authRepository.login(email, password);
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(const AuthError('Login failed: User not found'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signup(String email, String password, String displayName) async {
    emit(const AuthLoading());
    try {
      final user = await _authRepository.signup(email, password, displayName);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _authRepository.sendPasswordResetEmail(email);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future logout() async {
    emit(const AuthLoading());
    try {
      await _authRepository.logout();
      emit(const AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(const AuthInitial());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
