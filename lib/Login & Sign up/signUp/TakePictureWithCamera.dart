//
// import 'dart:io';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart'
// ;
//
// class TakePictureWithCamera extends StatefulWidget {
//   const TakePictureWithCamera({Key? key}) : super(key: key);
//
//   @override
//   State<TakePictureWithCamera> createState() => _TakePictureWithCameraState();
// }
//
// class _TakePictureWithCameraState extends State<TakePictureWithCamera> {
//
//   File? image;
//
//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//       if(image == null) return;
//
//       final imageTemp = File(image.path);
//
//       setState(() => this.image = imageTemp);
//     } on PlatformException catch(e) {
//       print('Failed to pick image: $e');
//     }
//   }
//
//   Future pickImageC() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.camera);
//
//       if(image == null) return;
//
//       final imageTemp = File(image.path);
//
//       setState(() => this.image = imageTemp);
//     } on PlatformException catch(e) {
//       print('Failed to pick image: $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//     );
//   }
// }
