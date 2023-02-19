import 'package:app_hris/src/domain/entities/user_spf_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeCheckAuthenticationEvent>(_checkAuthentication);
  }

  void _checkAuthentication(event, emit) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString("user_email");
    String? token = pref.getString("user_token");
    if (email != null && token != null) {
      final uuid = pref.getString("user_id") ?? "";
      final email = pref.getString("user_email") ?? "";
      final username = pref.getString("user_username") ?? "";
      final employeeId = pref.getString("user_employee_id") ?? "";
      final phoneNumber = pref.getString("user_hp") ?? "";
      final role = pref.getInt("user_role") ?? 0;
      final companyKey = pref.getString("user_company_key") ?? "";
      final createdAt = pref.getString("user_created") == null
          ? DateTime(1970, 1, 1)
          : DateTime.parse(pref.getString("user_created")!);
      final updatedAt = pref.getString("user_updated") == null
          ? DateTime(1970, 1, 1)
          : DateTime.parse(pref.getString("user_updated")!);

      final user = UserSpfEntity(
        uuid: uuid,
        employeeId: employeeId,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        role: role,
        companySecretKey: companyKey,
        createdAt: createdAt,
        updatedAt: updatedAt,
        token: token,
      );
      await Future.delayed(const Duration(seconds: 3))
          .whenComplete(() => emit(WelcomeAuthenticatedState(user)));
    } else {
      await Future.delayed(const Duration(seconds: 3))
          .whenComplete(() => emit(WelcomeUnAuthenticatedState()));
    }
  }
}
