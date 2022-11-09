import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EventDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
