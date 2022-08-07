import 'package:calendar_builder/calendar_builder.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practitioner/app/config/app_colors.dart';
import 'package:practitioner/app/config/app_constants.dart';
import 'package:practitioner/app/shared_widgets/Text.dart';
import 'package:practitioner/app/shared_widgets/Textfeld.dart';
import 'package:practitioner/app/shared_widgets/custom_button.dart';
import 'package:practitioner/app/util/util.dart';
import 'package:practitioner/presentation/home/widgets/side_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.kWhite,
          body: Row(
            children: [
              SideBar(),
              Container(
                height: Get.height,
                width: 410,
                decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    border: Border(
                        right: BorderSide(color: AppColors.dividerColor))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 32, bottom: 18),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SubHeading(
                            "Create Appointment",
                            fontSize: 24,
                            color: AppColors.textBlack,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: AppColors.textBlack,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.remove,
                            size: 22,
                            color: AppColors.textBlack,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.textBlack,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton2(
                            onpress: () {},
                            color: AppColors.textBlack,
                            title: AppConst.GENERAL,
                            horizontalPadding: 8.0,
                            verticalPadding: 4,
                          ),
                          CustomButton2(
                            onpress: () {},
                            color: AppColors.kWhite,
                            title: AppConst.GROUP,
                            horizontalPadding: 8.0,
                            verticalPadding: 4,
                            fontColor: AppColors.textBlack,
                            border: Border.all(color: AppColors.dividerColor),
                          ),
                          CustomButton2(
                            onpress: () {},
                            color: AppColors.kWhite,
                            title: AppConst.BLOCK_SLOT,
                            horizontalPadding: 8.0,
                            verticalPadding: 4,
                            fontColor: AppColors.textBlack,
                            border: Border.all(color: AppColors.dividerColor),
                          ),
                          CustomButton2(
                            onpress: () {},
                            color: AppColors.kWhite,
                            title: AppConst.ADVANCED,
                            horizontalPadding: 8.0,
                            verticalPadding: 4,
                            fontColor: AppColors.textBlack,
                            border: Border.all(color: AppColors.dividerColor),
                          ),
                          CustomButton2(
                            onpress: () {},
                            color: AppColors.kWhite,
                            title: AppConst.WALK_IN,
                            horizontalPadding: 8.0,
                            verticalPadding: 4,
                            fontColor: AppColors.textBlack,
                            border: Border.all(color: AppColors.dividerColor),
                          ),
                        ],
                      ),
                    ),
                    menuTile(AppConst.PRACTITIONER, Icons.add, selected: true),
                    menuTile(AppConst.PROFILE_DATE_TIME, Icons.add),
                    menuTile(AppConst.SERVICES_PAYMENT, Icons.add),
                    menuTile(AppConst.PATIENT, Icons.add),
                    menuTile(AppConst.NOTES, Icons.add),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 32,
                  ),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.kWhite),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeading(
                          AppConst.PRACTITIONER,
                          color: AppColors.textBlack,
                          fontSize: 24,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          child: SearchTextField(
                            false,
                            radius: 10,
                            prefixIcon: Icons.search,
                            prefixIconsize: 20,
                            hint: "Search for practitioners or specialties",
                            hintfontSize: 15,
                          ),
                          width: Get.width,
                          height: 48,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                calendar(),
                                SliderTheme(
                                  data: SliderThemeData(
                                      trackHeight: 1,
                                      activeTrackColor: AppColors.textBlack,
                                      inactiveTrackColor:
                                          AppColors.kGrey,
                                      thumbColor: AppColors.kWhite),
                                  child: RangeSlider(
                                      max: 10.0,
                                      min: 0.0,
                                      values: controller.rangeValues.value,
                                      onChanged: (values) {
                                        controller.rangeValues.value = values;
                                      }),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              width: 1,
                              height: 300,
                              color: AppColors.dividerColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget menuTile(String title, IconData icon, {bool selected = false}) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: selected
            ? BoxDecoration(
                border: Border(
                    right: BorderSide(color: AppColors.textBlack, width: 2)))
            : null,
        child: ListTile(
          onTap: () {},
          trailing: Icon(
            icon,
            size: 18,
            color: AppColors.textBlack,
          ),
          hoverColor: AppColors.dividerColor,
          selectedColor: AppColors.dividerColor,
          focusColor: AppColors.dividerColor,
          selected: selected,
          title: SubHeading(
            title,
            fontSize: 13,
            color: AppColors.textBlack,
          ),
        ),
      ),
    );
  }

  Widget calendar() {
    return CbMonthBuilder(
      height: 300,
      monthCustomizer: MonthCustomizer(
          monthWeekCustomizer: MonthWeekCustomizer(
              textStyle: TextStyle(
                  fontFamily: "Roboto-bold", color: AppColors.textBlack)),
          monthHeaderBuilder: (a, b, c, d) {
            return Container();
          },
          monthButtonCustomizer:
              MonthButtonCustomizer(colorOnSelected: AppColors.textBlack)),
      width: 256,
      cbConfig: CbConfig(
        startDate: DateTime(2020),
        currentDay: DateTime.now(),
        endDate: DateTime(2026),
        selectedDate: DateTime(2021, 3, 4),
        selectedYear: DateTime(2021),
      ),
      yearDropDownCustomizer: YearDropDownCustomizer(yearHeaderBuilder:
          (isYearSelected, selectedDate, selectedYear, year) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 12,
            ),
            SubHeading(
              "MAY 2022",
              color: AppColors.textBlack,
              fontSize: 14,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
            )
          ],
        );
      }),
    );
  }
}
