// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../profile_screen.dart';
//
// class set_profile extends StatelessWidget {
//   //const set_profile({Key? key}) : super(key: key);
//   late PickedFile imageFile;
//   final ImagePicker picker = ImagePicker();
//
//   get _picker => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//         margin: EdgeInsets.only(left: 17.0, right: 17.0),
//     color: Colors.white,
//     child: Column(
//     children: [
//     Padding(
//     padding: const EdgeInsets.fromLTRB(0, 40, 320, 0),
//     child: IconButton(onPressed: () {
//     Navigator.of(context).push(
//     MaterialPageRoute(builder: (context) => profile()));
//     },
//     icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
//     ),
//     Stack(
//     children: [
//     SizedBox(
//     height: 100,
//     width: 100,
//     child: CircleAvatar(
//     radius: 80.0,
//     backgroundImage: AssetImage("assets/boy.png")
//     ),
//     ),
//     Positioned(
//     bottom: 10.0,
//     right: 10.0,
//     child: InkWell(
//     onTap: () {
//     showModalBottomSheet<void>(
//     context: context,
//     builder: (BuildContext context) {
//     return Container(
//     alignment: Alignment.center,
//     height: 120.0,
//     width: MediaQuery
//         .of(context)
//         .size
//         .width,
//     margin: const EdgeInsets.symmetric(
//     horizontal: 20.0,
//     vertical: 20.0,
//     ),
//     child: Column(
//     children: [
//     const Text("Choose Option", style: TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 20),),
//     Row(
//     children: [
//     IconButton(onPressed: () {
//     takephoto(ImageSource.camera);
//     },
//     icon: const Icon(Icons.camera_alt),),
//     const Text("Camera", style: TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 15),),
//     ],
//     ),
//     Row(
//     children: [
//     IconButton(onPressed: () {
//     takephoto(ImageSource.gallery);
//     },
//     icon: const Icon(Icons.photo_album),),
//     const Text("Select Photo From Gallery",
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 15),),
//     ],
//     ),
//     ],
//     ),
//     );
//     }
//     );
//     },
//     child: const Icon(Icons.add_box,
//     color: Colors.deepPurpleAccent,
//     size: 28.0,),
//     )
//     )
//     ]
//     )
//     ])
//     )
//     );
//
//   }
//   void takephoto(ImageSource source) async {
//     final PickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       imageFile = PickedFile;
//     }
//     );
//   }
//   void setState(Null Function() param0) {}
// }
//
