import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:rcl_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:rcl_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:rcl_app/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:rcl_app/core/storage/secure_storage.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();
  final RegisterUseCase _registerUseCase = GetIt.instance<RegisterUseCase>();
  final LogoutUseCase _logoutUseCase = GetIt.instance<LogoutUseCase>();
  final RefreshTokenUseCase _refreshTokenUseCase = GetIt.instance<RefreshTokenUseCase>();
  final SecureStorage _storage = GetIt.instance<SecureStorage>();

  AuthCubit() : super(const AuthInitial());

  Future<void> login(String username, String password) async {
    emit(const AuthLoading());
    try {
      final result = await _loginUseCase(LoginParams(username, password));
      result.fold(
        (failure) => emit(AuthError(failure)),
        (user) => emit(AuthAuthenticated(user)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(RegisterParams params) async {
    emit(const AuthLoading());
    try {
      final result = await _registerUseCase(params);
      result.fold(
        (failure) => emit(AuthError(failure)),
        (user) => emit(AuthAuthenticated(user)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await _logoutUseCase();
    } catch (_) {}
    emit(const AuthUnauthenticated());
  }

  void checkAuthStatus() async {
    emit(const AuthLoading());
    try {
      final hasToken = await _storage.hasToken();
      if (hasToken) {
        final result = await _refreshTokenUseCase();
        result.fold(
          (failure) => emit(const AuthUnauthenticated()),
          (user) => emit(AuthAuthenticated(user)),
        );
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(const AuthUnauthenticated());
    }
  }
}
