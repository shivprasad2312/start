import 'package:flutter/material.dart';
import 'package:start/features/admin/services/admin_services.dart';
import 'package:start/models/product.dart';

// class Postsscreen extends StatefulWidget {
//   const Postsscreen({Key? key}) : super(key: key);

//   @override
//   State<Postsscreen> createState() => _PostsscreenState();
// }

// class _PostsscreenState extends State<Postsscreen> {
//   final AdminServices adminServices = AdminServices();
//   List<Product>? products;

//   @override
//   void initState() {
//     super.initState();
//     fetchAllProducts();
//   }

//   fetchAllProducts() async {
//     products = await adminServices.fetchAllProducts(context);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(products == null ? 'Product List Loading...' : 'Product List'),
//       ),
//       body: products == null
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : GridView.builder(
//               itemCount: products!.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemBuilder: (context, index) {
//                 if (products != null) {
//                   final productData = products![index];
//                   if (productData.images != null && productData.images.isNotEmpty) {
//                     print('Image URL for product $index: ${productData.images[0]}');
//                   }
//                   return Column(
//                     children: [
//                       SingleProduct(image: productData.images[0]),
//                       Text(
//                         productData.name ?? 'Product Name Missing',
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ],
//                   );
//                 }
//                 return const SizedBox.shrink(); // Placeholder for loading state
//               },
//             ),
//     );
//   }
// }

class SingleProduct extends StatelessWidget {
  final String image;

  const SingleProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 180,
            height: 180,
            errorBuilder: (context, error, stackTrace) {
              // Handle image loading error here (e.g., display a placeholder or an error message).
              return Text('Image not available');
            },
          ),
        ),
      ),
    );
  }
}
