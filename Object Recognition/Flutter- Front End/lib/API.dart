import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';






void sendImage(File image) {
 final FirebaseStorage _storage=FirebaseStorage(
   storageBucket: 'gs://objectdtection.appspot.com'
 );
 StorageUploadTask _uploadTask;
 _uploadTask=_storage.ref().child('ddd.jpg').putFile(image);
 print('Uploaded');
 Fluttertoast.showToast(
     msg: "Uploaded!!",
   textColor: Colors.red,
   backgroundColor: Colors.black,
 );

}

Future<String> getData()  async  {
  String ans;
  final databaseReference = FirebaseDatabase.instance.reference();

   await databaseReference.child('Answer').once().then((value) {

    ans=value.value;
    print(ans);


  });
  print(ans);
  return(ans);

}
