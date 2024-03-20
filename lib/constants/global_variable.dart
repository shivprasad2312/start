import 'package:flutter/material.dart';

String uri = 'http://192.168.186.1:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Bus',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Aeroplane',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Train',
      'image': 'assets/images/appliances.jpeg',
    },
  ];

}


Color primary=const Color(0xFF687daf);

class Styles{
  static Color primaryColor=primary;
  static Color textColor=const Color(0xFF3b3b3b);
  static Color bgColor =const Color(0xFFeeedf2);
  static Color orangeColor = const Color(0xFFF37867);
  static TextStyle textStyle=TextStyle(fontSize: 16,color: textColor,fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1=TextStyle(fontSize: 26,color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2=TextStyle(fontSize: 21,color: textColor,fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3=TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4=TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500);
}


