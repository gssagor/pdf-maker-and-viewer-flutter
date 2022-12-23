import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


import 'package:image_upload/pdf_cr.dart';

class ImageCapture extends StatefulWidget {


  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image!=null?Image.file(image!,width: 150,height: 150,):FlutterLogo(size: 150,),
            Padding(
              padding:  EdgeInsets.only(top: 15.0),
              child: Container(
                height: 50,
                width: 300,
                child: MaterialButton(
                  onPressed: (){
                    pickImage(ImageSource.camera);
                  },
                  height: 50,
                  minWidth: 300,
                  color: Colors.blue,
                  child: Text("Camera",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white)),

                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 15.0),
              child: Container(
                height: 50,
                width: 300,
                child: MaterialButton(
                  onPressed: (){
                    pickImage(ImageSource.gallery);
                  },
                  height: 50,
                  minWidth: 300,
                  color: Colors.blue,
                  child: Text("Gallery",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white)),

                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 35.0),
              child: Container(
                height: 50,
                width: 300,
                child: MaterialButton(
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> PdfScreenDemo() ));
                  },
                  height: 50,
                  minWidth: 300,
                  color: Colors.blue,
                  child: Text("Image To PDF",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white)),

                ),
              ),
            ),
          ],
        ),
      )
    );
  }
  Future pickImage(ImageSource source)async{
    final picker=ImagePicker();
    try{
      final image=  await picker.getImage(source: source);
      if(image==null) return;

      final imageTemporary =File(image.path);
      this.image=imageTemporary;
      setState(() {
        this.image=imageTemporary;
      });
    }on PlatformException catch (e){
      print('Failed to pick Image $e');
    }
  }
}
