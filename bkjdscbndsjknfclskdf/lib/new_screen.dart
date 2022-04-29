import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';


class new_screen extends StatefulWidget {

  var img;

  new_screen(this.img);

  @override
  State<StatefulWidget> createState() => new new_screen_state(img);
}

class new_screen_state extends State<new_screen> {

  var img;
  double img_height=0,img_width=0;
  new_screen_state(this.img);

  Future dimmension(curr_img) async
  {
    try{
      var decodedImage = await decodeImageFromList(curr_img.readAsBytesSync());

      setState(() {
        img_width = decodedImage.width.toDouble();
        img_height = decodedImage.height.toDouble();

      });

    } on PlatformException catch(e)
    {
      print("image has not been picked");
    }
  }




  @override
  Widget build(BuildContext context){


    dimmension(img);

    return MaterialApp(home : Scaffold(
//
        resizeToAvoidBottomInset : false,
        appBar: AppBar(

          title: Text('Full Screen Image'),

        ),
        body : Center(
            child: SingleChildScrollView(
              child:

                Column(
              children: [

                if (img_width>=img_height) ...[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin:EdgeInsets.fromLTRB(0, 150, 0, 50),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.file(
                          img),
                    ),
                  ),
                ] else ...[
                  Container(
                    height: MediaQuery.of(context).size.height*0.8,

                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Image.file(
                          img),
                    ),
                  ),

                ],


            Text("height of the image:" + img_height.toString()+" Px"),

            Text("width of the image:" + img_width.toString()+" Px"),

              ],
            )


    )
    )
    )
    );
  }



}

// class new_screen extends StatelessWidget {
//   //const new_screen({Key? key}) : super(key: key);
//
//   var img;
//   var img_height = 0,img_width=0;
//   List image_array = []; //make it global
//   new_screen(this.img,this.img_height,this.img_width);
//
//
//
//   @override
//   Widget build(BuildContext context){
//
//     print(img_height);
//     print(img_width);
//
//
//
//
//     return Scaffold(
//
//         body : Center(
//           child:Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15.0),
//                 child: Image.file(
//                   img,
//                   //width: MediaQuery.of(context).size.width*0.7,
//                   //height:  MediaQuery.of(context).size.height*0.7,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//
//
//             Text(img_height.toString()),
//
//             Text(img_width.toString()),
//
//
//
//
//
//             ],
//           )
//
//
//           // ClipRRect(
//           //   borderRadius: BorderRadius.circular(15.0),
//           //   child: Image.file(
//           //     img,
//           //     //width: MediaQuery.of(context).size.width*0.7,
//           //     //height:  MediaQuery.of(context).size.height*0.7,
//           //     fit: BoxFit.fill,
//           //   ),
//           // )
//
//
//           // Container( //this is the container child inside the grid
//           //   height: 600,
//           //   width:400,
//           //   padding: const EdgeInsets.all(8),
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.all(Radius.circular(25)),
//           //     image: DecorationImage(
//           //       image: FileImage(img),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//         )
//
//
//
//
//     );
//   }
// }
//
//
//
//

