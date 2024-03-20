import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:start/common/widgets/custom_buttom.dart';
import 'package:start/common/widgets/custom_textfield.dart';
import 'package:start/constants/utils.dart';
import 'package:start/features/admin/services/admin_services.dart';

class AddProduct extends StatefulWidget {
  static const String routeName='/add-product';
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final TextEditingController fromController=TextEditingController();
  final TextEditingController nameController=TextEditingController();
  final TextEditingController toController=TextEditingController();
  final TextEditingController timeController=TextEditingController();
  final TextEditingController flightNoController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final AdminServices adminServices=AdminServices();

  List<File> images=[]; 
  final _addProductFormKey=GlobalKey<FormState>();


  @override
  void dispose() {
    super.dispose();
    fromController.dispose();
    toController.dispose();
    timeController.dispose();
    flightNoController.dispose();
    priceController.dispose();
    nameController.dispose();

  }

  void sellProduct(){
    if(_addProductFormKey.currentState!.validate() && images.isNotEmpty){
      adminServices.sellProduct(
        context: context, 
        name: nameController.text, 
        from: fromController.text, 
        to: toController.text, 
        price: priceController.text, 
        no: flightNoController.text, 
        time: timeController.text, 
        images: images,
      );
    }
  }

 void selectImages() async {
    var res= await pickImages();
    setState(() {
      images=res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey ,
          child: Padding( padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 100,),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                :GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    strokeCap: StrokeCap.round,
                    radius: Radius.circular(10),
                    dashPattern: [10,4],
                    child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open_outlined,size: 35,),
                        Text("Select airplane logo",
                        style: TextStyle(color: Colors.grey.shade400,fontSize: 15),),
                      ],
                    ),
                  )
                              ),
                ), 

                SizedBox(height: 20,),
              CustomTextField(controller: nameController, hintText: 'Name'),

              SizedBox(height: 10,),
              CustomTextField(controller: fromController, hintText: 'From'),
              SizedBox(height: 10,),
              CustomTextField(controller: toController, hintText: 'To'),
              SizedBox(height: 10,),
              CustomTextField(controller: flightNoController, hintText: 'Flight No'),
              SizedBox(height: 10,),
              CustomTextField(controller: timeController, hintText: 'Total Time'),
              SizedBox(height: 10,),
              CustomTextField(controller: priceController, hintText: 'Price'),
              SizedBox(height: 10,),

              CustomButton(text: 'Submit', 
              onTap: sellProduct
              )

              ],
            ),
          )
        ),
      ),
    );
  }
}