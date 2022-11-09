import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../config/app_colors.dart';
import '../core/BoxDecoration.dart';
import 'Text.dart';

typedef Validator = String? Function(String? value);
typedef onChanged = String? Function(String? value);
typedef onChangeCountry = CountryCode? Function(CountryCode? value);

class InputTextField extends StatefulWidget {
  final VoidCallback? onSubmit;
  final String textfieldName;
  final String hint;
  final Widget? label;
  final IconData? prefixIcon;
  final Validator? validator;
  final onChanged? onChange;
  final TextInputType? textInputType;
  final bool readOnly;
  final bool obscureText;
  final double hintfontSize;
  final double? width;
  final double? height;
  final double? padding;
  final VoidCallback? ontap;
  final bool? isColored;
  final int maxlines;
  final double fontSizeText;
  final double prefixIconsize;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? showeyeicon;
  final TextInputType? type;
  final Function()? showpin;
  final Color? cursorColor;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintTextColor;
   InputTextField(
    this.obscureText, {
    this.prefixIcon,
         this.textColor,
    this.validator,this.hintTextColor,
    this.hintfontSize = 12.0,
    this.prefixIconsize = 20,
    this.width,
    this.height,
    this.onChange,
    this.textfieldName = "textfieldName",
    this.ontap,
    this.isColored = true,
    this.textInputType,
    this.padding = 5.0,
    this.onSubmit,
    this.maxlines = 1,
    this.readOnly = false,
    this.inputFormatters,
    this.controller,
    this.fontSizeText = 12,
    this.cursorColor = AppColors.black,
    this.type,
    this.showeyeicon,
    this.showpin,this.fillColor,
    this.hint = '',this.label,
        this.borderDecoration
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  text(String code) {
    return Text(code);
  }

  bool isObscure = true;

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      onTap: widget.ontap,
      name: widget.textfieldName,
      readOnly: widget.readOnly,
      maxLines: widget.maxlines,
      onChanged: widget.onChange,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.showeyeicon !=null ? isObscure : false,
      style: widget.isColored!
          ?  TextStyle(color:widget.textColor??  AppColors.black, fontSize:widget.fontSizeText)
          : TextStyle(fontSize: widget.fontSizeText),
      cursorColor: AppColors.kSecondary,
      keyboardType: widget.textInputType,obscuringCharacter: "\u25CF",
      decoration: InputDecoration(isDense: true,label: widget.label,
        suffixIconColor: AppColors.kGrey,
        focusColor: Colors.grey,filled: widget.fillColor!=null?true:false,fillColor: widget.fillColor,
        suffixIcon: widget.showeyeicon != "show"
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  setState(() {
                    if (isObscure == false) {
                      isObscure = true;
                    } else {
                      isObscure = false;
                    }
                  });
                },
                icon: isObscure == false
                    ? const Icon(Icons.visibility,color: AppColors.kSecondary,)
                    : const Icon(Icons.visibility_off,color: AppColors.kSecondary,)),
        enabledBorder:widget.borderDecoration?? const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.dividerColor),
        ),
        focusedBorder: widget.borderDecoration??const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.dividerColor),
        ),
        hintText: widget.hint,errorBorder: widget.borderDecoration,focusedErrorBorder: widget.borderDecoration,
        hintStyle:
            TextStyle(color:widget.hintTextColor?? AppColors.black, fontSize: widget.hintfontSize,fontFamily: "Epilogue-Regular",fontWeight: FontWeight.w400),
      ),
    );
  }
}

class DateInputField extends StatelessWidget {
  final String name;
  final String? hint;

  final String? Function(DateTime?)? validator;

  const DateInputField(
      {Key? key, this.hint, required this.name, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: Get.width / 1.1,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        border: Border.all(color: AppColors.greyWhite, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffEFFAFF),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FormBuilderDateTimePicker(
                name: name,
                lastDate: DateTime.now(),
                style: TextStyle(color: AppColors.textBlack, fontSize: 14),
                cursorColor: Colors.black,
                minLines: 1,
                inputType: InputType.date,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(25, 0, 0, 10),
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle:
                      TextStyle(color: AppColors.appGrey, fontSize: 10),
                  errorStyle: TextStyle(
                      fontSize: 8.0, color: Colors.red.withOpacity(0.5)),
                ),
                validator: validator,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Icon(
                Icons.calendar_today,
                color: AppColors.textBlack,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropTextField extends StatelessWidget {
  final onChanged? onSubmit;
  final String? hint;
  final String name;
  final IconData? prefixIcon;
  final TextInputType? textInputType;
  final Validator? validator;
  final List<String>? items;

  @override
  final Key? key;

  const DropTextField({
    this.prefixIcon,
    this.textInputType,
    this.onSubmit,
    this.key,
    required this.hint,
    this.validator,
    this.items,
    required this.name,
  });

  text(String code) {
    return Text(code);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: Get.width / 1.1,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        border: Border.all(color: AppColors.greyWhite, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffEFFAFF),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: FormBuilderDropdown<String>(
                name: name,
                key: key,
                allowClear: true,
                onChanged: onSubmit,
                style: TextStyle(color: AppColors.textBlack, fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(25, 0, 5, 5),
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle:
                      TextStyle(color: AppColors.appGrey, fontSize: 10),
                  errorStyle: TextStyle(
                      fontSize: 8.0, color: Colors.red.withOpacity(0.5)),
                ),
                initialValue: items![0],
                items: items!.map((String value) {
                  return DropdownMenuItem<String>(
                      value: items!.isEmpty
                          ? value
                          : items!.firstWhere((item) => item == value),
                      child: SubHeading(value, fontWeight: FontWeight.w500));
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatefulWidget {
  final VoidCallback? onSubmit;
  final String textfieldName;
  final String hint;
  final IconData? prefixIcon;
  final Validator? validator;
  final Function(String?)? onChange;
  final TextInputType? textInputType;
  final bool readOnly;
  final bool obscureText;
  final double hintfontSize;
  final double? width;
  final double? height;
  final double? padding;
  final VoidCallback? ontap;
  final bool? isColored;
  final int maxlines;
  final double fontSizeText;
  final double prefixIconsize;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? showeyeicon;
  final TextInputType? type;
  final Function()? showpin;
  final Color? cursorColor;
  final Color? borderColor;
  final double? radius;
  final TextAlign? textAlign;
  final Color? fillColor;
  final Color? hintColor;
  final Widget? prefix;
  final String? prefixPath;
  final Widget? suffix;

   SearchTextField(
      this.obscureText, {
        this.prefixPath,this.suffix,
        this.prefixIcon,
         this.borderColor,
        this.validator,
        this.hintfontSize = 12.0,
        this.prefixIconsize = 20,
        this.width,
        this.height,
        this.onChange,
        this.textfieldName = "textfieldName",
        this.ontap,
        this.isColored = true,
        this.textInputType,
        this.padding = 5.0,
        this.onSubmit,
        this.maxlines = 1,
        this.readOnly = false,
        this.inputFormatters,
        this.controller,
        this.fontSizeText = 12,
        this.cursorColor = AppColors.black,
        this.type,
        this.showeyeicon,
        this.showpin,this.radius,
         this.textAlign = TextAlign.start,
        this.hint = '',this.fillColor,this.prefix,this.hintColor
      });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  text(String code) {
    return Text(code);
  }

  bool isObscure = true;

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      onTap: widget.ontap,textAlign: widget.textAlign!,
      name: widget.textfieldName,
      readOnly: widget.readOnly,
      maxLines: widget.maxlines,
      onChanged: widget.onChange,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.showeyeicon == "show" ? isObscure : false,
      style: widget.isColored!
          ? const TextStyle(color: AppColors.black, fontSize: 14)
          : TextStyle(fontSize: widget.fontSizeText),
      cursorColor: widget.isColored! ? AppColors.black : null,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        suffixIconColor: AppColors.kGrey,filled: true,fillColor: widget.fillColor,
        suffixIcon: widget.suffix,
        focusColor: Colors.grey,
        prefixIcon:widget.prefixIcon!=null? Padding(
          padding:  EdgeInsets.only(left: 17),
          child: Icon(widget.prefixIcon,color: AppColors.kGrey,size: widget.prefixIconsize,),
        ):null,
        // prefixIcon: Icon(Icons.calendar_month_outlined,size: 10.h,),
          // prefix: Image.asset( widget.prefixPath??""),
          /* suffixIcon: widget.showeyeicon == null
            ? const SizedBox()
            : IconButton(
            onPressed: () {
              setState(() {
                if (isObscure == false) {
                  isObscure = true;
                } else {
                  isObscure = false;
                }
              });
            },
            icon: isObscure == false
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),*/
        enabledBorder:  UnderlineInputBorder(borderRadius: BorderRadius.circular(widget.radius??0.0),
          borderSide: BorderSide(color:widget.borderColor??AppColors.dividerColor),
        ),
        focusedBorder:  UnderlineInputBorder(borderRadius:BorderRadius.circular(widget.radius??0.0),
          borderSide: BorderSide(color: widget.borderColor??AppColors.dividerColor),
        ),
        hintText: widget.hint,
        hintStyle:
        TextStyle(color:widget.hintColor?? AppColors.kGrey, fontSize: widget.hintfontSize,fontFamily: "Roboto-regular",height: 1.4),
      ),
    );
  }
}

class DropDownProfile extends StatelessWidget {
  final onChanged? onSubmit;
  final String? hint;

  final List<String>? items;
  final String? value;

  const DropDownProfile({
    this.onSubmit,
    this.value,
    required this.hint,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 7.h,
      width: 90.w,
      decoration:
          MyBoxDecoration.roundCircularDropDownRadiusWithBoxShadowDecoration(
        color: AppColors.kWhite,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: DropdownButton<String>(
          elevation: 0,
          items: items!.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child:
                  SubHeading(value, fontSize: 10, color: AppColors.textBlack),
            );
          }).toList(),
          value: value,
          underline: const SizedBox(),
          hint: SubHeading(hint!, fontSize: 10, color: AppColors.kGrey),
          isExpanded: true,
          onChanged: onSubmit,
        ),
      ),
    );
  }
}

class CountryCodeInputTextField extends StatelessWidget {
  final VoidCallback? onSubmit;
  final String? hint;
  final IconData? prefixIcon;
  final Validator? validator;
  final TextInputType? textInputType;
  final bool readOnly;
  final bool obscureText;
  final double hintfontSize;
  final double? width;
  final double? height;
  final double? padding;
  final bool? isColored;
  final TextEditingController? controller;
  final onChangeCountry? function;
  final VoidCallback? ontap;

  CountryCodeInputTextField(
    this.obscureText, {
    this.prefixIcon,
    this.validator,
    this.function,
    this.hintfontSize = 12.0,
    this.width,
    this.height,
    this.isColored = true,
    this.textInputType,
    this.padding = 5.0,
    this.onSubmit,
    this.readOnly = false,
    this.controller,
    required this.hint,
    this.ontap,
  });

  text(String code) {
    return Text(code);
  }

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding!.w),
      child: FormBuilderTextField(
        // focusNode: myFocusNode,
        onTap: ontap,
        name: 'textfield',
        readOnly: readOnly,
        controller: controller,

        validator: validator,
        obscureText: obscureText,
        style: isColored!
            ? const TextStyle(color: AppColors.black, fontSize: 14)
            : null,
        cursorColor: isColored! ? AppColors.black : null,
        minLines: 1,
        keyboardType: textInputType,

        decoration: InputDecoration(
          suffixIconColor: AppColors.kGrey,
          focusColor: Colors.grey,
          prefixIcon: CountryCodePicker(
            padding: EdgeInsets.zero,
            // onChanged: function,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'PK',
            favorite: const ['+92', 'PK'],

            // optional. Shows only country name and flag
            showCountryOnly: false,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.appGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.appGrey),
          ),
        ),
      ),
    );
  }
}

class WhitelistingTextInputFormatter extends TextInputFormatter {
  static final _reg = RegExp("[0-9]");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    TextEditingValue? def;
    print(_reg.hasMatch(newValue.text));
    print(newValue.text);
    return _reg.hasMatch(newValue.text)
        ? newValue
        : (newValue.text.isEmpty)
            ? def!
            : oldValue;
  }
}

BoxDecoration postBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),color: AppColors.kBoxGrey2,
  border: Border.all(width: 0.5,color: Color(0xff737373)),
);
