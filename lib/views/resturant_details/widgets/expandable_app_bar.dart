// import 'package:flutter/material.dart';
// import 'package:foodpanda_clone/models/restaurant_model.dart';
// import 'package:foodpanda_clone/viewmodels/restaurant_provider.dart';
// import 'package:provider/provider.dart';

// class ExpandableAppBar extends StatelessWidget {
//   final RestaurantModel restaurant;

//   const ExpandableAppBar({Key? key, required this.restaurant})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RestaurantProvider>(
//       builder: (context, provider, child) {
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           child: provider.isCollapsed
//               ? _buildCollapsedAppBar(context, provider)
//               : _buildExpandedAppBar(context, provider),
//         );
//       },
//     );
//   }

//   Widget _buildExpandedAppBar(
//     BuildContext context,
//     RestaurantProvider provider,
//   ) {
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         bottom: false,
//         child: Column(
//           children: [
//             // Banner with back button and actions
//             Stack(
//               children: [
//                 // Banner image
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [const Color(0xFFE21B70), Colors.blue.shade600],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                   ),
//                   child: Stack(
//                     children: [
//                       // You can add actual image here
//                       Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 color: Colors.blue.shade700,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Image.network(
//                                 'https://via.placeholder.com/100',
//                                 width: 80,
//                                 height: 80,
//                                 color: Colors.white,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return const Icon(
//                                     Icons.restaurant,
//                                     size: 80,
//                                     color: Colors.white,
//                                   );
//                                 },
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//                             const Text(
//                               'WFP\nUnited Nations\nWorld Food Programme',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Top actions
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   right: 8,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(
//                             Icons.arrow_back,
//                             color: Colors.black,
//                           ),
//                           padding: EdgeInsets.zero,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Colors.white,
//                             child: IconButton(
//                               onPressed: provider.showInfo,
//                               icon: const Icon(
//                                 Icons.info_outline,
//                                 color: Colors.black,
//                               ),
//                               padding: EdgeInsets.zero,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           CircleAvatar(
//                             backgroundColor: Colors.white,
//                             child: IconButton(
//                               onPressed: provider.toggleFavorite,
//                               icon: const Icon(
//                                 Icons.favorite_border,
//                                 color: Colors.black,
//                               ),
//                               padding: EdgeInsets.zero,
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           CircleAvatar(
//                             backgroundColor: Colors.white,
//                             child: IconButton(
//                               onPressed: provider.shareRestaurant,
//                               icon: const Icon(
//                                 Icons.share,
//                                 color: Colors.black,
//                               ),
//                               padding: EdgeInsets.zero,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // Restaurant info
//             Container(
//               padding: const EdgeInsets.all(16),
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     restaurant.name,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.star, color: Colors.orange, size: 20),
//                       const SizedBox(width: 4),
//                       Text(
//                         '${restaurant.rating} (${restaurant.totalRatings}+ ratings)',
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.delivery_dining, size: 28),
//                         const SizedBox(width: 8),
//                         const Icon(Icons.directions_walk, size: 28),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Delivery ${restaurant.deliveryTime}',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               Text(
//                                 restaurant.deliveryType,
//                                 style: TextStyle(
//                                   color: Colors.pink.shade600,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text('Change'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search menu',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey.shade300),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey.shade300),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCollapsedAppBar(
//     BuildContext context,
//     RestaurantProvider provider,
//   ) {
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         bottom: false,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//           child: Row(
//             children: [
//               IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(Icons.arrow_back),
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search ${restaurant.name}...',
//                     prefixIcon: const Icon(Icons.search, size: 20),
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                 ),
//               ),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
