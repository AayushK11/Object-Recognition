
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui';


import 'package:image_picker/image_picker.dart';
import 'API.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Object Detection",
            style :TextStyle(
              fontSize: 18.0,
              color: Colors.blueGrey,

              fontStyle: FontStyle.normal,


            ),
          ),
          backgroundColor: Colors.black,

        ),
        body: MyCamera(),
      ),


    );
  }
}



class MyCamera extends StatefulWidget {
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {


  File imageFile;
  String answer="No result";
 // String url="http://a2d1fb00.ngrok.io/ans";



  _openGallery(BuildContext context) async{
    var pic= await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile=pic;
    });
    Navigator.of(context).pop();


  }
  _openCamera(BuildContext context) async{
    var pic= await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile=pic;
    });
    Navigator.of(context).pop();

  }




  @override
  Widget build(BuildContext context) {
    return Align(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          _decideImageView(),
          RaisedButton(
            child: Text('Select Image'),
            onPressed: (){
              _showOptions(context);

            },
          ),
          RaisedButton(
            child: Text('Send',style: TextStyle(fontWeight: FontWeight.bold),),
            splashColor: Colors.grey,
            onPressed: (){
              _sendImage(context);
                },
          ),
          Container(
            child:Text(
            answer,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),

          ),
          ),


        ],
      ),
    );

  }
  Widget _decideImageView(){
    if(imageFile == null){
      return Text("No Image");
    }
    else{
      return Image.file(imageFile,width: 300.0,height: 300.0,alignment: Alignment.center,);
    }
  }

  _showOptions(BuildContext context) {
    return showModalBottomSheet(

        context: context,
        builder: (BuildContext context1)
        {
          return SingleChildScrollView(

            child: ListBody(
              children: <Widget>[

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: ()
                      {
                        _openGallery(context);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text('Gallery'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),


                    ),
                    IconButton(
                      icon: Icon(Icons.camera),
                      onPressed: ()
                      {
                        _openCamera(context);
                      },
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Camera')
                      ],
                    ),


                  ],
                ),
              ],
            ),
          );

        }
    );
  }


  void changeAns(String ans){
    setState(() {
      this.answer=ans;
    });
  }

  void _sendImage(BuildContext context) async {

     sendImage(imageFile);
   String st=await getData();
   await Future.delayed(Duration(seconds: 30));
    changeAns(st);





  }


}

