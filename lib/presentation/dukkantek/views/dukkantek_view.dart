import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:practitioner/app/config/app_colors.dart';
import 'package:practitioner/app/routes/app_pages.dart';
import 'package:practitioner/app/shared_widgets/Text.dart';
import 'package:practitioner/app/shared_widgets/Textfeld.dart';
import 'package:sizer/sizer.dart';

import '../controllers/dukkantek_controller.dart';

class DukkantekView extends GetView<DukkantekController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DukkantekController>(builder: (c) {
      return Scaffold(
        backgroundColor: AppColors.kWhite,
        body: Obx(
          () => ModalProgressHUD(
            inAsyncCall: controller.loading.value,
            progressIndicator: CircularProgressIndicator(
              strokeWidth: 2,
            ),
            child: Column(
              children: [
                controller.searchToggle.value ? searchWidget() : header(),
                Divider(
                  color: AppColors.dividerColor,
                  thickness: 1,
                ),
                body()
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget header() {
    return Container(
      height: 73,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: AppColors.kWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubHeading(
            "Colleges",
            fontSize: 26,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          IconButton(
              onPressed: () {
                controller.searchToggle.value = !controller.searchToggle.value;
              },
              icon: Icon(
                Icons.search_outlined,
                size: 34,
                color: AppColors.black,
              ))
        ],
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      height: 73,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: AppColors.kWhite),
      child: Center(
        child: SearchTextField(
          false,
          radius: 10,suffix: InkResponse(
            onTap: () {
              controller.searchToggle.value= false;
            },
            child: Icon(Icons.cancel_outlined,color: AppColors.textBlack,)),
          prefixIcon: Icons.search,
          prefixIconsize: 20,
          hint: "Search for events",
          hintfontSize: 15,
          controller: controller.searchController,
          onChange: (val) {
            controller.getSeatGeekEvents(withSearch: true);
          },
        ),
      ),
    );
  }

  Widget body() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: AppColors.kBackgroundColor,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.events.length,
        itemBuilder: (context, index) {
          return Container(
            height: 75,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EVENT_DETAIL);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                              .events[index]
                                              .performers!
                                              .first
                                              .image ??
                                          ""),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              width: Get.width * 0.70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SubHeading(
                                    '${controller.events[index].title}',
                                    color: AppColors.black,
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SubHeading(
                                    "${controller.events[index].shortTitle}",
                                    color: AppColors.textBlack,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.markAsFavorite(index);
                        },
                        child: Icon(
                          controller.events[index].isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 35,
                          color: controller.events[index].isFavorite == true
                              ? AppColors.redColor
                              : AppColors.favouriteColor,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  child: Divider(
                    color: AppColors.dividerColor,
                    thickness: 1,
                  ),
                  width: Get.width * 0.87,
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
