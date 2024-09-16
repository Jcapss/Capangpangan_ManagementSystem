import 'package:riverpod/riverpod.dart';
import 'services/user_service.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});
