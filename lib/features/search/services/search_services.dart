import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:start/constants/error_handling.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/constants/utils.dart';
import 'package:start/models/product.dart';
import 'package:start/providers/user_provider.dart';

class SearchServices{

  Future<List<Product>> fetchSearchedProduct({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products/search/$searchQuery'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  // Future<Product> fetchDealOfDay({
  //   required BuildContext context,
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   Product product = Product(
  //     name: '',
  //     description: '',
  //     quantity: 0,
  //     images: [],
  //     category: '', 
  //     price: 0,
  //   );

  //   try {
  //     http.Response res =
  //         await http.get(Uri.parse('$uri/api/deal-of-day'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         product = Product.fromJson(res.body);
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return product;
  // }
}