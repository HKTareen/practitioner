import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:practitioner/data/repositories/seat_geek_repository.dart';

import '../../../data/models/seat_geek.dart';

class DukkantekController extends GetxController {
  RxList<SeatEvent> events = <SeatEvent>[].obs;
  final  SeatGeekRepository _repository = SeatGeekRepository();
  TextEditingController searchController = TextEditingController();
  RxBool loading = false.obs;
RxBool searchToggle = false.obs;

  @override
  void onInit() {
    getSeatGeekEvents();
    super.onInit();
  }
  Future<void> getSeatGeekEvents({bool withSearch =false})async{
    events.clear();
    Get.log('DukkantekController.getSeatGeekEvents called');
   if(withSearch==false) loading.value =true;
    Map<String,dynamic>? data;
    try{
      data = await _repository.getSeatGeekEvents(search: searchController.text);
    }catch (e){
      Get.log('DukkantekController.getSeatGeekEvents caught error');
    }
    loading.value = false;
    if(data!=null){
      events.addAll(data['events'].map<SeatEvent>((e)=>SeatEvent.fromJson(e)));
      Get.log('DukkantekController.getSeatGeekEvents success ${events.length}');
    }else{
      Get.log('DukkantekController.getSeatGeekEvents failed to get data ');
    }


  }

  void markAsFavorite(int index) {
    events[index].isFavorite=!events[index].isFavorite!;
    update();
  }
}
