 import 'package:eazy_techno_application/package/authentication/models/user.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserStore extends HydratedCubit<User> {
  UserStore() : super(User.empty);

  void setUser(User user)=> emit(user);

  @override
  User? fromJson(Map<String, dynamic> json) => state.formJson(json);

  @override
  Map<String, dynamic>? toJson(User state) => state.toMap();
}
