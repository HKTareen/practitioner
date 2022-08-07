import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../config/app_colors.dart';

class Utils {
  static String getImagePath(String name, {String format= 'png'}) {
    return 'assets/images/$name.$format';
  }
  static String getIconPath(String name, {String format= 'png'}) {
    return 'assets/icons/$name.$format';
  }
  static showSnackBar({required String title, required String message,required bool error}) {
    Get.snackbar(
      title,
      message,
      backgroundColor:error?AppColors.redColor :AppColors.kSecondary,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );}

 static bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static Future getImageFromGallery() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles(
        withReadStream: true,
        allowCompression: true,
        type: FileType.custom,
        allowedExtensions: ["jpg", "png", "jpeg", "gif", "bmp"]);
    if (file != null) {
      File? returnFile =
      await refineImage(File(file.files.single.path!));
      Get.log(
          '${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile');
      return returnFile;
    }
  }

  static Future getImageFromCamera() async {
    final pickedFile =
    await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File? returnFile = await refineImage(File(pickedFile.path));
      Get.log(
          '${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile');
      return returnFile;
    }
  }

 static Future<File?> refineImage(File pickedFile) async {
    // final tempDir = await getTemporaryDirectory();

    File toCompress = pickedFile;

    print(toCompress.path);
    //
    // CompressObject compressObject = CompressObject(
    //   imageFile: toCompress,
    //   //image
    //   path: tempDir.path,
    //   // path: "/data/user/0/com.foodleapp/cache/file_picker/", //compress to path
    //   quality: 85,
    //   //first compress quality, default 80
    //   step: 9,
    //   //compress quality step, The bigger the fast, Smaller is more accurate, default 6
    //   mode: CompressMode.LARGE2SMALL, //default AUTO
    // );
    // String? path = await Luban.compressImage(compressObject);
    //
    // print(path);
    //
    // if (path != null) {
    //   toCompress = File(path);
    // }
    //
    // print("FILE SIZE  before: " + toCompress.lengthSync().toString());

    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: toCompress.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings:[ AndroidUiSettings(
          toolbarTitle: 'Refine Image',
          toolbarColor: AppColors.kSecondary,
          toolbarWidgetColor:AppColors.kWhite,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: AppColors.kSecondary,
          backgroundColor: AppColors.kSecondary,
          statusBarColor: AppColors.kSecondary,
          lockAspectRatio: false), IOSUiSettings(
        title: 'Refine Image',

      )],
    );

    if (croppedFile != null) {
      pickedFile = File(croppedFile.path);
        return pickedFile;
    }else{
      return pickedFile;
    }
  }
}
