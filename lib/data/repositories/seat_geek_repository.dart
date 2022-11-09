
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../providers/network/api_endpoint.dart';
import '../providers/network/api_provider.dart';

class SeatGeekRepository {

  static final SeatGeekRepository _singleton = SeatGeekRepository._internal();

  factory SeatGeekRepository() {
    return _singleton;
  }

  SeatGeekRepository._internal();

  APIProvider apiClient = APIProvider();

  Future getSeatGeekEvents({String? search, String? id}) async {

    Map<String, dynamic> data = await apiClient.baseGetAPI(
        "${APIEndpoint.getSeatGeekEvents}?client_id=${APIEndpoint.clientToken}${search!=null?"&q=$search":""}${id!=null?"&id=$id":""}",
        false,
        Get.context);
    return data;
  }

}