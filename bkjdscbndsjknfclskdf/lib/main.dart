import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import './new_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late XFile image;

  List image_array = []; //make it global
  var img_width = 0,img_height = 0;
  Future PickImage() async
  {
    try{
      final image = await ImagePicker().pickImage(source:ImageSource.gallery);


      if(image==null) return;

      final File? imageTemp = File(image.path);
      image_array.add(imageTemp);

      setState(() {
        img_height = 0;
        img_width = 0;
        image_array;

      });
    } on PlatformException catch(e)
    {
      print("image has not been picked");
    }
  }

  Future PickImageC() async
  {
    try{
      final image = await ImagePicker().pickImage(source:ImageSource.camera);


      if(image==null) return;

      final File? imageTemp = File(image.path);
      image_array.add(imageTemp);

      setState(() {
        img_width = 0;
        img_width = 0;
        image_array;
      });
    } on PlatformException catch(e)
    {
      print("image has not been picked");
    }

  }






  @override
  // TODO: implement context
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: AppBar( title: Text('Image picker example'),), //appbar
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
                child:Text('Pick image from the gallery',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                onPressed: PickImage),

            MaterialButton(
                color: Colors.blue,
                child:Text('Pick image from the camera',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                onPressed: PickImageC),

           Container(

             height: MediaQuery.of(context).size.height*0.767,
             decoration: BoxDecoration(border: Border.all(width: 2)),
             child: image_array.isEmpty? Center(child: Text('No image')):  //display no image or display grid view
             GridView.count(crossAxisCount: 3,

               //padding: EdgeInsets.all(2.0),
               childAspectRatio: 8.0 / 9.0,
               children: List.generate(image_array.length, (index){
               var img = image_array[index];
               print(img);
               return GestureDetector(

                   onTap:()
                     {
                       Navigator.of(context).push(MaterialPageRoute(builder:(context)=>(new_screen(img))));
                     },

                 child: Container( //this is the container child inside the grid
                       height: 100,
                       width:100,
                       padding: const EdgeInsets.all(8),
                       decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(25)),
                       image: DecorationImage(
                       image: FileImage(img),
                       fit: BoxFit.cover,
                       ),
                       ),
                       )
                 );







               }),

             )
           ),

            // SizedBox(height: 20,),
            // image !=null ? Image.file(image!): Text("no image picked")

          ],),
      )

    ); //scaffold
  }
}

// class MyApp extends StatefulWidget {
//
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }
// }
//
// class _MyAppState extends State<MyApp> {
//
//
//   static const questions = [
//
//     {
//       'questionText': 'What is your favourite color?',
//       'answers': ['Black','Red','Green','White']
//     },
//
//     {
//       'questionText': 'What is your favourite animal?',
//       'answers': ['Bear','Rabbit','Goat','Wolf']
//     },
//
//     {
//       'questionText': 'Who is your favourite Instructor?',
//       'answers': ['Max','Max','Max','Max']
//     }
//
//   ];
//   var _questionIndex = 0;
//   void _answerQuestion()
//   {
//     setState(()
//     {
//       _questionIndex = _questionIndex + 1;
//     });
//
//     print(_questionIndex);
//   }
//   //@override
//   Widget build(BuildContext context)
//   {
//
//
//
//     return MaterialApp(home : Scaffold(
//       appBar: AppBar(title:Text('my fist_app')),
//       body: _questionIndex < questions.length ? Column(children: [
//         Question(questions[_questionIndex]['questionText'] as String),
//       ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
//
//           return Answer(_answerQuestion,answer);
//
//
//         }).toList(),
//
//
//
//
//       ],) : Center(child : Text('you did it !')) ,
//     ));
//   }
// }
//
//



