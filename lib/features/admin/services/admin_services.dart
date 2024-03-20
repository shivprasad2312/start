import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/constants/error_handling.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/constants/utils.dart';
import 'package:start/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:start/providers/user_provider.dart';

class AdminServices{

  void sellProduct({
    required BuildContext context,
    required String name,
    required String from,
    required String to,
    required String price,
    required String no,
    required String time,
    required List<File> images
  }) async{

    final userProvider=Provider.of<UserProvider>(context,listen: false);
    try {
      final cloudinary =CloudinaryPublic('dybzzlqhv', 'g4tit7x8');
      List<String> imageUrls=[];

      for(int i=0;i<images.length;i++)
      {
        CloudinaryResponse res= await cloudinary.uploadFile(
         CloudinaryFile.fromFile(images[i].path,folder:name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product=Product(
      name: name, 
      from: from, 
      to: to, 
      price: price, 
      no: no, 
      time: time, 
      images: imageUrls, id: '', 
      );

      http.Response res=await http.post(Uri.parse('$uri/admin/add-product'),
      headers:{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },

      body: product.toJson(),
      );


      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: (){
          showSnackBar(context, 'Produuct Added Successfully!');
          Navigator.pop(context);
        }
        );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri/admin/get-products'), headers: {
  'Content-Type': 'application/json; charset=UTF-8',
  'x-auth-token': userProvider.user.token,
});

print('Response status: ${res.statusCode}');
print('Response body: ${res.body}');


      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
  print('Received JSON data: ${res.body}');
  for (int i = 0; i < jsonDecode(res.body).length; i++) {
    productList.add(
      Product.fromJson(
        jsonEncode(
          jsonDecode(res.body)[i],
        ),
      ),
    );
  }
  print('Parsed products: $productList');
},

      );

    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

///////////////delete-product
  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  })async{
    

    final userProvider=Provider.of<UserProvider>(context,listen: false);
    try {
      http.Response res=await http.post(Uri.parse('$uri/admin/delete-product'),
      headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },

      body:jsonEncode( {
        'id':product.id,
      }),
      );


      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: (){
         onSuccess();
        }
        );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}