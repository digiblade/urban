import 'dart:io';

import 'package:flutter/material.dart';
import '../../component/InputField.dart';
import '../../component/Button.dart';
import 'Response.dart';
import 'package:image_picker/image_picker.dart';

class BookingForm extends StatefulWidget {
  final double padding;
  final dynamic subcategory;
  const BookingForm({
    Key key,
    this.padding,
    this.subcategory,
  }) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  File image;
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController notesCtrl = TextEditingController();
  final picker = ImagePicker();
  Future getImage(int type) async {
    dynamic pickedFile;
    if (type == 0) {
      pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.padding),
      child: Scaffold(
        primary: false,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Booking"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16,
                ),
                child: Center(
                  child: image == null
                      ? Text('No image selected.')
                      : Image.file(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {
                    getImage(0);
                  },
                  text: "Take photo",
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {
                    getImage(1);
                  },
                  text: "Import From Gallary",
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: InputField(
                  controller: addressCtrl,
                  borderColor: Colors.black.withOpacity(0.2),
                  borderRadius: 4,
                  maxLine: 4,
                  minLine: 4,
                  hintText: "Address",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: InputField(
                  controller: notesCtrl,
                  borderColor: Colors.black.withOpacity(0.2),
                  borderRadius: 4,
                  maxLine: 4,
                  minLine: 4,
                  hintText: "Notes",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Button1(
                  onPressed: () {
                    successPage(context, widget.padding);
                  },
                  text: "Enter Live Location",
                  color: Color(0xff040077),
                  textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Button1(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xff040077),
                  textColor: Colors.white,
                  text: "Go Back",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  successPage(context, pad) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (BuildContext context) => ResponsePage(
        padding: pad,
        response: false,
      ),
    );
  }
}
