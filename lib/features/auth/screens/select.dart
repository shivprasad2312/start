// import 'package:flutter/material.dart';
// import 'package:start/models/product.dart';

// // Import your Product and AdminServices classes

// class SelectTicket extends StatefulWidget {
//   const SelectTicket({Key? key}) : super(key: key);

//   @override
//   _SelectTicketState createState() => _SelectTicketState();
// }

// class _SelectTicketState extends State<SelectTicket> {
//   String dropdownValue = 'Price';
//   var items = ['Price', 'Time'];
//   List<Product>? products;

//   @override
//   void initState() {
//     super.initState();
//     fetchAllProducts();
//   }

//   void fetchAllProducts() async {
//     // Replace this with your AdminServices code to fetch products
//     // For example: products = await adminServices.fetchAllProducts(context);
//     // Make sure products is a list of Product objects.
//     // You should fetch products from your data source here.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flights'),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Add your UI components here, such as the Date Picker, Sort, and Filter widgets
//               // ...

//               if (products == null) {
//                 return CircularProgressIndicator(); // Replace this with your Loader widget
//               }

//               // Replace the manually added TicketView widgets with a GridView.builder
//               GridView.builder(
//                 itemCount: products!.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   final productData = products![index];
//                   return TicketView(product: productData);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       // Your remaining code for the app
//       // ...
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: SelectTicket(),
//   ));
// }
