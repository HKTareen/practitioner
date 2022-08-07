
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../providers/network/api_endpoint.dart';
import '../providers/network/api_provider.dart';

class AuthRepository {
  late APIProvider apiClient;

  AuthRepository() {
    apiClient = APIProvider();
  }

  Future signUp(UserProfile userProfile) async {

    Map<String, dynamic> data = await apiClient.basePostAPI(
        APIEndpoint.signUpUrl,
        userProfile.toJson(),
        false,
        Get.context);
    return data;
  }
  Future login(UserProfile userProfile) async {

    Map<String, dynamic>? data = await apiClient.basePostAPI(
        APIEndpoint.loginUrl,
        userProfile.toJson(),
        false,
        Get.context);
    return data;
  }
}
