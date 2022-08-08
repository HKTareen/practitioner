import 'package:calendar_builder/calendar_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
              Visibility(
                visible: controller.isDrawerShowing.value,
                child: Container(
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
                            drawerNavigation(
                                () => controller.isDrawerShowing.value = false)
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 24, right: 24, bottom: 18),
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
                      menuTile(AppConst.PRACTITIONER, Icons.add,
                          selected: true),
                      menuTile(AppConst.PROFILE_DATE_TIME, Icons.add),
                      menuTile(AppConst.SERVICES_PAYMENT, Icons.add),
                      menuTile(AppConst.PATIENT, Icons.add),
                      menuTile(AppConst.NOTES, Icons.add),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width:controller.isDrawerShowing.value?Get.width - 467 :Get.width - 60,
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                                visible: !controller.isDrawerShowing.value,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 28),
                                  child: drawerNavigation(() =>
                                      controller.isDrawerShowing.value = true),
                                )),
                            SubHeading(
                              AppConst.PRACTITIONER,
                              color: AppColors.textBlack,
                              fontSize: 24,
                            ),
                          ],
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
                          width: double.infinity,
                          height: 48,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height - 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Get.height - 200,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          calendar(),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SubHeading(
                                                "Soonest availability",
                                                color: AppColors.textBlack,
                                                fontSize: 13,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 130),
                                                child: customSwitch(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 147),
                                                child: SubHeading(
                                                  "Time",
                                                  color: AppColors.textBlack,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              SubHeading(
                                                "from 17:00 to 19:00",
                                                color: AppColors.textBlack,
                                                fontSize: 13,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 320,
                                            child: SliderTheme(
                                              data: SliderThemeData(
                                                  trackHeight: 1,
                                                  activeTrackColor:
                                                      AppColors.textBlack,
                                                  inactiveTrackColor:
                                                      AppColors.kGrey,
                                                  thumbColor: AppColors.kWhite),
                                              child: RangeSlider(
                                                  max: 10.0,
                                                  min: 0.0,
                                                  values: controller
                                                      .rangeValues.value,
                                                  onChanged: (values) {
                                                    controller.rangeValues
                                                        .value = values;
                                                  }),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          specialtySelector(),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          locationSelector(),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          typeSelector(),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          practiceButton()
                                        ],
                                      ),
                                    ),
                                  ),
                                  CustomButton2(
                                    onpress: () {},
                                    color: AppColors.kWhite,
                                    title: "Show all",
                                    horizontalPadding: 8.0,
                                    verticalPadding: 8.0,
                                    fontFamily: "Roboto-bold",
                                    fontColor: AppColors.textBlack,
                                    width: 300,
                                    height: 42,
                                    border: Border.all(
                                        color: AppColors.dividerColor),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: Get.height - 180,
                              color: AppColors.dividerColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SubHeading(
                                          "30 practitioners",
                                          color: AppColors.textBlack,
                                          fontSize: 13,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color:
                                                      AppColors.dividerColor)),
                                          child: Row(
                                            children: [
                                              Card(
                                                elevation: 6,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 6),
                                                  child: SubHeading(
                                                    "Doctors",
                                                    color: AppColors.textBlack,
                                                    fontSize: 13,
                                                    fontFamily: "Roboto-medium",
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                elevation: 0.0,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 6),
                                                  child: SubHeading(
                                                    "Nurses",
                                                    color: AppColors.textBlack,
                                                    fontSize: 13,
                                                    fontFamily: "Roboto-medium",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    SizedBox(
                                        height: Get.height-220,
                                        child: SingleChildScrollView(child: Wrap(children: List.generate(20, (index) => Padding(
                                          padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                                          child: practitionerCard(),
                                        )),)))

                                  ],
                                ),
                              ),
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
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: CbMonthBuilder(
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
      ),
    );
  }

  Widget drawerNavigation(onBack) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onBack,
          child: Icon(
            controller.isDrawerShowing.value
                ? Icons.arrow_back_ios
                : Icons.arrow_forward_ios,
            size: 20,
            color: AppColors.textBlack,
          ),
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
    );
  }

  Widget customSwitch() {
    return Transform.scale(
      scale: 0.5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerColor, width: 4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: CupertinoSwitch(
            trackColor: AppColors.kWhite,
            // width: 30.0,
            // height: 18.0,toggleSize: 11,
            // //toggleSize: 45.0,
            value: controller.soonestAvailability.value,
            // borderRadius: 30.0,
            // padding: 3.0,switchBorder: Border.all(color: AppColors.dividerColor),toggleBorder:Border.all(color: AppColors.dividerColor) ,
            // inactiveColor: AppColors.kWhite,
            // showOnOff: false,toggleColor: AppColors.black,
            activeColor: AppColors.kWhite,
            onChanged: (val) async {
              controller.soonestAvailability.value = val;
            }),
      ),
    );
  }

  Widget specialtySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SubHeading(
          "Specialty",
          fontSize: 13,
          color: AppColors.textBlack,
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 300,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 6,
            runSpacing: 8,
            children: [
              CustomButton2(
                onpress: () {},
                color: AppColors.textBlack,
                title: "All",
                horizontalPadding: 8.0,
                fontSize: 13,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.kWhite,
                width: 34,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "General Practice",
                width: 115,
                horizontalPadding: 8.0,
                fontSize: 13,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "OB-GYN",
                width: 67,
                horizontalPadding: 8.0,
                fontSize: 13,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "ENT",
                width: 43,
                horizontalPadding: 8.0,
                fontSize: 13,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "Physiotherapy",
                width: 105,
                fontSize: 13,
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "+ 3 more",
                width: 70,
                fontSize: 13,
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(color: AppColors.dividerColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget locationSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SubHeading(
          "Location",
          fontSize: 13,
          color: AppColors.textBlack,
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 280,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CustomButton2(
                onpress: () {},
                color: AppColors.textBlack,
                title: "All",
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Utils.getIconPath(
                        "office_location",
                      ),
                      height: 12,
                    ),
                    SubHeading(
                      "Office",
                      fontSize: 13,
                    )
                  ],
                ),
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.kWhite,
                width: 73,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "All",
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Utils.getIconPath(
                        "home_location",
                      ),
                      height: 12,
                    ),
                    SubHeading(
                      "Home",
                      fontSize: 13,
                      color: AppColors.textBlack,
                    )
                  ],
                ),
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                width: 73,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "All",
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.videocam_rounded,
                      size: 16,
                    ),
                    SubHeading(
                      "Virtual",
                      fontSize: 13,
                      color: AppColors.textBlack,
                    )
                  ],
                ),
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                width: 80,
                border: Border.all(color: AppColors.dividerColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget typeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SubHeading(
          "Type",
          fontSize: 13,
          color: AppColors.textBlack,
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 280,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CustomButton2(
                onpress: () {},
                color: AppColors.textBlack,
                title: "All",
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Utils.getIconPath(
                        "FirstTime",
                      ),
                      height: 12,
                    ),
                    SubHeading(
                      "First time",
                      fontSize: 13,
                    )
                  ],
                ),
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.kWhite,
                width: 90,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "All",
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Utils.getIconPath(
                        "FollowUp",
                      ),
                      height: 12,
                    ),
                    SubHeading(
                      "Follow Up",
                      fontSize: 13,
                      color: AppColors.textBlack,
                    )
                  ],
                ),
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                width: 95,
                border: Border.all(color: AppColors.dividerColor),
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "All",
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Utils.getIconPath(
                        "walk",
                      ),
                      height: 12,
                    ),
                    SubHeading(
                      "Walk In",
                      fontSize: 13,
                      color: AppColors.textBlack,
                    )
                  ],
                ),
                horizontalPadding: 8.0,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                width: 70,
                border: Border.all(color: AppColors.dividerColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget practiceButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
              style: TextStyle(
                  fontFamily: "Roboto-bold",
                  fontSize: 13,
                  color: AppColors.textBlack),
              children: [
                TextSpan(text: "Practice "),
                TextSpan(text: "1", style: TextStyle(color: AppColors.kGrey)),
              ]),
        ),
        SizedBox(
          height: 8,
        ),
        CustomButton2(
          onpress: () {},
          color: AppColors.textBlack,
          title: "All",
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    Utils.getImagePath(
                      "clinic",
                    ),
                    height: 24,
                  )),
              SizedBox(
                width: 8,
              ),
              SubHeading(
                "Primary Clinic Dubai",
                fontSize: 13,
              )
            ],
          ),
          horizontalPadding: 8.0,
          verticalPadding: 8.0,
          fontFamily: "Roboto-bold",
          fontColor: AppColors.kWhite,
          width: 300,
          height: 42,
          border: Border.all(color: AppColors.dividerColor),
        ),
      ],
    );
  }
  Widget practitionerCard(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.dividerColor),
          borderRadius:
          BorderRadius.circular(8)),
      height: 122,
      width: 318,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    Utils.getImagePath(
                        "profile"),
                    height: 32,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      SubHeading(
                        "Mark Black",
                        color:
                        AppColors.textBlack,
                        fontSize: 13,
                      ),
                      SubHeading(
                        "General Practice",
                        color: AppColors.kGrey,
                        fontSize: 11,
                        fontFamily:
                        "Roboto-regular",
                        fontWeight:
                        FontWeight.w400,
                      ),
                    ],
                    mainAxisSize:
                    MainAxisSize.min,
                  )
                ],
                mainAxisSize: MainAxisSize.min,
              ),
              CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "Select",
                width: 60,
                horizontalPadding: 8.0,
                fontSize: 13,
                verticalPadding: 8.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(
                    color:
                    AppColors.dividerColor),
              ),
            ],
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
          ),
          SizedBox(
            height: 8.5,
          ),
          SubHeading(
            "2 shifts:  9:00a - 1:00p  •  5:00a - 7:00p",
            color: AppColors.textBlack,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto-regular",
          ),
          SizedBox(
            height: 6,
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    fontFamily: "Roboto-regular",
                    fontSize: 11,
                    color: AppColors.textBlack),
                children: [
                  TextSpan(text: "20 office slots", style: TextStyle(decoration: TextDecoration.underline)),
                  TextSpan(text: " on May 22"),
                ]),
          ),
          SizedBox(
            height: 6,
          ),
          Row(children: [
            SubHeading(
              "Next:",
              color: AppColors.textBlack,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto-regular",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "9:30a",
                width: 40,borderRadius: 4,
                horizontalPadding: 2.0,
                fontSize: 13,
                verticalPadding: 2.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(
                    color:
                    AppColors.dividerColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "9:30a",
                width: 40,borderRadius: 4,
                horizontalPadding: 2.0,
                fontSize: 13,
                verticalPadding: 2.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(
                    color:
                    AppColors.dividerColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "9:30a",
                width: 40,borderRadius: 4,
                horizontalPadding: 2.0,
                fontSize: 13,
                verticalPadding: 2.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(
                    color:
                    AppColors.dividerColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "9:30a",
                width: 40,borderRadius: 4,
                horizontalPadding: 2.0,
                fontSize: 13,
                verticalPadding: 2.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(
                    color:
                    AppColors.dividerColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: CustomButton2(
                onpress: () {},
                color: AppColors.kWhite,
                title: "9:30a",
                width: 40,borderRadius: 4,
                horizontalPadding: 2.0,
                fontSize: 13,
                verticalPadding: 2.0,
                fontFamily: "Roboto-bold",
                fontColor: AppColors.textBlack,
                border: Border.all(
                    color:
                    AppColors.dividerColor),
              ),
            ),

          ],mainAxisSize: MainAxisSize.min,)
        ],
      ),
    );
  }
}
