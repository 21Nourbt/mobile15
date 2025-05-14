// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const CoworkingApp());
// // // }

// // // class CoworkingApp extends StatelessWidget {
// // //   const CoworkingApp({Key? key}) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         fontFamily: 'SF Pro Display', // Keeping your original font
// // //         scaffoldBackgroundColor: Colors.white,
// // //         colorScheme: ColorScheme.light(
// // //           primary: Color(0xFF5E72E4),
// // //           secondary: Color(0xFF11CDEF),
// // //           surface: Colors.white,
// // //           background: Colors.white,
// // //         ),
// // //       ),
// // //       home: const CoworkingHomePage(),
// // //     );
// // //   }
// // // }

// // // class CoworkingHomePage extends StatefulWidget {
// // //   const CoworkingHomePage({Key? key}) : super(key: key);

// // //   @override
// // //   State<CoworkingHomePage> createState() => _CoworkingHomePageState();
// // // }

// // // class _CoworkingHomePageState extends State<CoworkingHomePage> {
// // //   int _selectedIndex = 0;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SafeArea(
// // //         child: Padding(
// // //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
// // //           child: ListView(
// // //             children: [
// // //               const SizedBox(height: 32),
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Text(
// // //                         'Coworking Space',
// // //                         style: TextStyle(
// // //                           fontSize: 28,
// // //                           fontWeight: FontWeight.bold,
// // //                           color: Color(0xFF2D3748),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 6),
// // //                       Text(
// // //                         'Work remotely with flexibility',
// // //                         style: TextStyle(
// // //                           fontSize: 16,
// // //                           color: Color(0xFF718096),
// // //                           fontWeight: FontWeight.w400,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   CircleAvatar(
// // //                     backgroundColor: Color(0xFFEBF4FF),
// // //                     radius: 24,
// // //                     child: Icon(
// // //                       Icons.notifications_none_rounded,
// // //                       color: Color(0xFF5E72E4),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 32),

// // //               // Search Bar

// // //               // Book a Space section
// // //               Text(
// // //                 'Book a space',
// // //                 style: TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.w700,
// // //                   color: Color(0xFF2D3748),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 16),

// // //               // Space Cards
// // //               Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: SpaceOptionCard(
// // //                       title: 'Open Space',
// // //                       subtitle: 'Reserve an open space',
// // //                       icon: Icons.weekend_outlined,
// // //                       color: Color(0xFFE6FFFA),
// // //                       iconColor: Color(0xFF0BC5EA),
// // //                       onTap: () {},
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 16),
// // //                   Expanded(
// // //                     child: SpaceOptionCard(
// // //                       title: 'Meeting Room',
// // //                       subtitle: 'Reserve a meeting room',
// // //                       icon: Icons.table_bar,
// // //                       color: Color(0xFFEBF8FF),
// // //                       iconColor: Color(0xFF4299E1),
// // //                       onTap: () {},
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 16),
// // //                   Expanded(
// // //                     child: SpaceOptionCard(
// // //                       title: 'Private Office',
// // //                       subtitle: 'Reserve a private office',
// // //                       icon: Icons.desktop_windows_outlined,
// // //                       color: Color(0xFFFEF9E7),
// // //                       iconColor: Color(0xFFECC94B),
// // //                       onTap: () {},
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 32),

// // //               // Subscription Card
// // //               SubscriptionCard(),
// // //               const SizedBox(height: 32),

// // //               // Popular Section
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Text(
// // //                     'Popular',
// // //                     style: TextStyle(
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.w700,
// // //                       color: Color(0xFF2D3748),
// // //                     ),
// // //                   ),
// // //                   TextButton(
// // //                     onPressed: () {},
// // //                     child: Text(
// // //                       'See All',
// // //                       style: TextStyle(
// // //                         fontSize: 16,
// // //                         fontWeight: FontWeight.w500,
// // //                         color: Color(0xFF5E72E4),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 16),

// // //               // Popular Cards
// // //               SizedBox(
// // //                 height: 200,
// // //                 child: ListView(
// // //                   scrollDirection: Axis.horizontal,
// // //                   children: const [
// // //                     PopularSpaceCard(
// // //                       imagePath: 'assets/openspace1.jpg',
// // //                       title: 'Open Space',
// // //                       location: 'Downtown',
// // //                       rating: 4.8,
// // //                     ),
// // //                     SizedBox(width: 16),
// // //                     PopularSpaceCard(
// // //                       imagePath: 'assets/meetingRoom1.jpg',
// // //                       title: 'Meeting Room',
// // //                       location: 'Business Center',
// // //                       rating: 4.6,
// // //                     ),
// // //                     SizedBox(width: 16),
// // //                     PopularSpaceCard(
// // //                       imagePath: 'assets/officeroom2.jpg',
// // //                       title: 'Private Office',
// // //                       location: 'Tech Hub',
// // //                       rating: 4.9,
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 24),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       // bottomNavigationBar: Container(
// // //       //   decoration: BoxDecoration(
// // //       //     color: Colors.white,
// // //       //     boxShadow: [
// // //       //       BoxShadow(
// // //       //         color: Colors.black.withOpacity(0.05),
// // //       //         blurRadius: 10,
// // //       //         offset: Offset(0, -5),
// // //       //       ),
// // //       //     ],
// // //       //   ),
// // //       //   child: ClipRRect(
// // //       //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // //       //     child: BottomNavigationBar(
// // //       //       currentIndex: _selectedIndex,
// // //       //       onTap: (index) {
// // //       //         setState(() {
// // //       //           _selectedIndex = index;
// // //       //         });
// // //       //       },
// // //       //       type: BottomNavigationBarType.fixed,
// // //       //       backgroundColor: Colors.white,
// // //       //       selectedItemColor: Color(0xFF5E72E4),
// // //       //       unselectedItemColor: Color(0xFFA0AEC0),
// // //       //       showUnselectedLabels: true,
// // //       //       selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
// // //       //       unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
// // //       //       elevation: 0,
// // //       //       items: [
// // //       //         BottomNavigationBarItem(
// // //       //           icon: Icon(Icons.home_rounded),
// // //       //           label: 'Home',
// // //       //         ),
// // //       //         BottomNavigationBarItem(
// // //       //           icon: Icon(Icons.calendar_today_rounded),
// // //       //           label: 'Schedule',
// // //       //         ),
// // //       //         BottomNavigationBarItem(
// // //       //           icon: Icon(Icons.grid_view_rounded),
// // //       //           label: 'Dashboard',
// // //       //         ),
// // //       //         BottomNavigationBarItem(
// // //       //           icon: Icon(Icons.person_rounded),
// // //       //           label: 'Profile',
// // //       //         ),
// // //       //       ],
// // //       //     ),
// // //       //   ),
// // //       // ),
// // //     );
// // //   }
// // // }

// // // class SpaceOptionCard extends StatelessWidget {
// // //   final String title;
// // //   final String subtitle;
// // //   final IconData icon;
// // //   final Color color;
// // //   final Color iconColor;
// // //   final VoidCallback onTap;

// // //   const SpaceOptionCard({
// // //     Key? key,
// // //     required this.title,
// // //     required this.subtitle,
// // //     required this.icon,
// // //     required this.color,
// // //     required this.iconColor,
// // //     required this.onTap,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: onTap,
// // //       child: Container(
// // //         padding: const EdgeInsets.all(16),
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(20),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.05),
// // //               blurRadius: 10,
// // //               offset: Offset(0, 4),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Column(
// // //           children: [
// // //             Container(
// // //               padding: EdgeInsets.all(12),
// // //               decoration: BoxDecoration(
// // //                 color: color,
// // //                 borderRadius: BorderRadius.circular(16),
// // //               ),
// // //               child: Icon(icon, size: 28, color: iconColor),
// // //             ),
// // //             const SizedBox(height: 12),
// // //             Text(title,
// // //                 style: TextStyle(
// // //                   fontWeight: FontWeight.w600,
// // //                   fontSize: 14,
// // //                   color: Color(0xFF2D3748),
// // //                 ),
// // //                 textAlign: TextAlign.center),
// // //             const SizedBox(height: 4),
// // //             Text(
// // //               subtitle,
// // //               style: TextStyle(
// // //                 fontSize: 12,
// // //                 color: Color(0xFF718096),
// // //               ),
// // //               textAlign: TextAlign.center,
// // //               maxLines: 2,
// // //               overflow: TextOverflow.ellipsis,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class SubscriptionCard extends StatelessWidget {
// // //   const SubscriptionCard({Key? key}) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       padding: const EdgeInsets.all(20),
// // //       decoration: BoxDecoration(
// // //         gradient: LinearGradient(
// // //           colors: [Color(0xFF5E72E4), Color(0xFF825EE4)],
// // //           begin: Alignment.topLeft,
// // //           end: Alignment.bottomRight,
// // //         ),
// // //         borderRadius: BorderRadius.circular(20),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Color(0xFF5E72E4).withOpacity(0.3),
// // //             blurRadius: 10,
// // //             offset: Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   'Get unlimited access',
// // //                   style: TextStyle(
// // //                     fontSize: 18,
// // //                     fontWeight: FontWeight.w700,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 6),
// // //                 Text(
// // //                   'Purchase a subscription to unlock all premium features',
// // //                   style: TextStyle(
// // //                     fontSize: 14,
// // //                     color: Colors.white.withOpacity(0.8),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           SizedBox(width: 16),
// // //           ElevatedButton(
// // //             onPressed: () {},
// // //             style: ElevatedButton.styleFrom(
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(16),
// // //               ),
// // //               backgroundColor: Colors.white,
// // //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// // //               elevation: 0,
// // //             ),
// // //             child: Text(
// // //               'Subscribe',
// // //               style: TextStyle(
// // //                 color: Color(0xFF5E72E4),
// // //                 fontWeight: FontWeight.w600,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class PopularSpaceCard extends StatelessWidget {
// // //   final String imagePath;
// // //   final String title;
// // //   final String location;
// // //   final double rating;

// // //   const PopularSpaceCard({
// // //     Key? key,
// // //     required this.imagePath,
// // //     required this.title,
// // //     required this.location,
// // //     required this.rating,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       width: 200,
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(20),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black.withOpacity(0.05),
// // //             blurRadius: 10,
// // //             offset: Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       clipBehavior: Clip.antiAlias,
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           SizedBox(
// // //             height: 120,
// // //             width: double.infinity,
// // //             child: Stack(
// // //               fit: StackFit.expand,
// // //               children: [
// // //                 Image.asset(
// // //                   imagePath,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //                 Positioned(
// // //                   top: 10,
// // //                   right: 10,
// // //                   child: Container(
// // //                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white,
// // //                       borderRadius: BorderRadius.circular(12),
// // //                     ),
// // //                     child: Row(
// // //                       children: [
// // //                         Icon(Icons.star, color: Colors.amber, size: 16),
// // //                         SizedBox(width: 4),
// // //                         Text(
// // //                           rating.toString(),
// // //                           style: TextStyle(
// // //                             fontWeight: FontWeight.w600,
// // //                             fontSize: 12,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           Padding(
// // //             padding: const EdgeInsets.all(12.0),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   title,
// // //                   style: TextStyle(
// // //                     fontWeight: FontWeight.w600,
// // //                     fontSize: 16,
// // //                     color: Color(0xFF2D3748),
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 4),
// // //                 Row(
// // //                   children: [
// // //                     Icon(
// // //                       Icons.location_on,
// // //                       size: 14,
// // //                       color: Color(0xFF718096),
// // //                     ),
// // //                     SizedBox(width: 4),
// // //                     Text(
// // //                       location,
// // //                       style: TextStyle(
// // //                         fontSize: 12,
// // //                         color: Color(0xFF718096),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // import 'choose_plan_screen.dart';

// // void main() {
// //   runApp(const CoworkingApp());
// // }

// // class CoworkingApp extends StatelessWidget {
// //   const CoworkingApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         fontFamily: 'SF Pro Display',
// //         scaffoldBackgroundColor: Color(0xFFF9FAFB),
// //         colorScheme: ColorScheme.light(
// //           primary: Color(0xFF3B82F6), // Cool blue highlight
// //           secondary: Color(0xFF60A5FA),
// //           surface: Colors.white,
// //           background: Color(0xFFF9FAFB), // Very light background
// //         ),
// //       ),
// //       home: const CoworkingHomePage(),
// //     );
// //   }
// // }

// // class CoworkingHomePage extends StatefulWidget {
// //   const CoworkingHomePage({Key? key}) : super(key: key);

// //   @override
// //   State<CoworkingHomePage> createState() => _CoworkingHomePageState();
// // }

// // class _CoworkingHomePageState extends State<CoworkingHomePage> {
// //   int _selectedIndex = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //           child: ListView(
// //             children: [
// //               const SizedBox(height: 32),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Coworking Space',
// //                         style: TextStyle(
// //                           fontSize: 28,
// //                           fontWeight: FontWeight.bold,
// //                           color: Color(0xFF1F2937), // Dark gray text
// //                         ),
// //                       ),
// //                       const SizedBox(height: 6),
// //                       Text(
// //                         'Work remotely with flexibility',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           color: Color(0xFF6B7280), // Soft gray
// //                           fontWeight: FontWeight.w400,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   CircleAvatar(
// //                     backgroundColor: Color(0xFFE0F2FE),
// //                     radius: 24,
// //                     child: Icon(
// //                       Icons.notifications_none_rounded,
// //                       color: Color(0xFF3B82F6),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 32),
// //               Text(
// //                 'Book a space',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w700,
// //                   color: Color(0xFF1F2937),
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               Row(
// //                 children: [
// //                   Expanded(
// //                     child: SpaceOptionCard(
// //                       title: 'Open Space',
// //                       subtitle: 'Reserve an open space',
// //                       icon: Icons.weekend_outlined,
// //                       color: Color(0xFFE0F7FA),
// //                       iconColor: Color(0xFF00B0FF),
// //                       onTap: () {},
// //                     ),
// //                   ),
// //                   const SizedBox(width: 16),
// //                   Expanded(
// //                     child: SpaceOptionCard(
// //                       title: 'Meeting Room',
// //                       subtitle: 'Reserve a meeting room',
// //                       icon: Icons.table_bar,
// //                       color: Color(0xFFE3F2FD),
// //                       iconColor: Color(0xFF2196F3),
// //                       onTap: () {},
// //                     ),
// //                   ),
// //                   const SizedBox(width: 16),
// //                   Expanded(
// //                     child: SpaceOptionCard(
// //                       title: 'Private Office',
// //                       subtitle: 'Reserve a private office',
// //                       icon: Icons.desktop_windows_outlined,
// //                       color: Color(0xFFFFF9C4),
// //                       iconColor: Color(0xFFFFC107),
// //                       onTap: () {},
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 32),
// //               SubscriptionCard(),
// //               const SizedBox(height: 32),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     'Popular',
// //                     style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w700,
// //                       color: Color(0xFF1F2937),
// //                     ),
// //                   ),
// //                   TextButton(
// //                     onPressed: () {},
// //                     child: Text(
// //                       'See All',
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500,
// //                         color: Color(0xFF3B82F6),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 16),
// //               SizedBox(
// //                 height: 200,
// //                 child: ListView(
// //                   scrollDirection: Axis.horizontal,
// //                   children: const [
// //                     PopularSpaceCard(
// //                       imagePath: 'assets/openspace1.jpg',
// //                       title: 'Open Space',
// //                       location: 'Downtown',
// //                       rating: 4.8,
// //                     ),
// //                     SizedBox(width: 16),
// //                     PopularSpaceCard(
// //                       imagePath: 'assets/meetingRoom1.jpg',
// //                       title: 'Meeting Room',
// //                       location: 'Business Center',
// //                       rating: 4.6,
// //                     ),
// //                     SizedBox(width: 16),
// //                     PopularSpaceCard(
// //                       imagePath: 'assets/officeroom2.jpg',
// //                       title: 'Private Office',
// //                       location: 'Tech Hub',
// //                       rating: 4.9,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 24),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SpaceOptionCard extends StatelessWidget {
// //   final String title;
// //   final String subtitle;
// //   final IconData icon;
// //   final Color color;
// //   final Color iconColor;
// //   final VoidCallback onTap;

// //   const SpaceOptionCard({
// //     Key? key,
// //     required this.title,
// //     required this.subtitle,
// //     required this.icon,
// //     required this.color,
// //     required this.iconColor,
// //     required this.onTap,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.all(16),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(20),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.05),
// //               blurRadius: 10,
// //               offset: Offset(0, 4),
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           children: [
// //             Container(
// //               padding: EdgeInsets.all(12),
// //               decoration: BoxDecoration(
// //                 color: color,
// //                 borderRadius: BorderRadius.circular(16),
// //               ),
// //               child: Icon(icon, size: 28, color: iconColor),
// //             ),
// //             const SizedBox(height: 12),
// //             Text(title,
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.w600,
// //                   fontSize: 14,
// //                   color: Color(0xFF1F2937),
// //                 ),
// //                 textAlign: TextAlign.center),
// //             const SizedBox(height: 4),
// //             Text(
// //               subtitle,
// //               style: TextStyle(
// //                 fontSize: 12,
// //                 color: Color(0xFF6B7280),
// //               ),
// //               textAlign: TextAlign.center,
// //               maxLines: 2,
// //               overflow: TextOverflow.ellipsis,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SubscriptionCard extends StatelessWidget {
// //   const SubscriptionCard({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(20),
// //       decoration: BoxDecoration(
// //         color: Color(0xFF3B82F6),
// //         borderRadius: BorderRadius.circular(20),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Color(0xFF3B82F6).withOpacity(0.3),
// //             blurRadius: 10,
// //             offset: Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Get unlimited access',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.w700,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 SizedBox(height: 6),
// //                 Text(
// //                   'Purchase a subscription to unlock all premium features',
// //                   style: TextStyle(
// //                     fontSize: 14,
// //                     color: Colors.white.withOpacity(0.8),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           SizedBox(width: 16),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => ChoosePlanScreen(),
// //                 ),
// //               );
// //             },
// //             style: ElevatedButton.styleFrom(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(16),
// //               ),
// //               backgroundColor: Colors.white,
// //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// //               elevation: 0,
// //             ),
// //             child: Text(
// //               'Subscribe',
// //               style: TextStyle(
// //                 color: Color(0xFF3B82F6),
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class PopularSpaceCard extends StatelessWidget {
// //   final String imagePath;
// //   final String title;
// //   final String location;
// //   final double rating;

// //   const PopularSpaceCard({
// //     Key? key,
// //     required this.imagePath,
// //     required this.title,
// //     required this.location,
// //     required this.rating,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 200,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(20),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.05),
// //             blurRadius: 10,
// //             offset: Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       clipBehavior: Clip.antiAlias,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           SizedBox(
// //             height: 120,
// //             width: double.infinity,
// //             child: Stack(
// //               fit: StackFit.expand,
// //               children: [
// //                 Image.asset(
// //                   imagePath,
// //                   fit: BoxFit.cover,
// //                 ),
// //                 Positioned(
// //                   top: 10,
// //                   right: 10,
// //                   child: Container(
// //                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         Icon(Icons.star, color: Colors.amber, size: 16),
// //                         SizedBox(width: 4),
// //                         Text(
// //                           rating.toString(),
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 12,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   title,
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.w600,
// //                     fontSize: 16,
// //                     color: Color(0xFF1F2937),
// //                   ),
// //                 ),
// //                 SizedBox(height: 4),
// //                 Row(
// //                   children: [
// //                     Icon(
// //                       Icons.location_on,
// //                       size: 14,
// //                       color: Color(0xFF6B7280),
// //                     ),
// //                     SizedBox(width: 4),
// //                     Text(
// //                       location,
// //                       style: TextStyle(
// //                         fontSize: 12,
// //                         color: Color(0xFF6B7280),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// // Import the notification_dropdown.dart file
// // Make sure the file is in the correct location
// import 'notification_dropdown.dart';
// import 'choose_plan_screen.dart';

// void main() {
//   runApp(const CoworkingApp());
// }

// class CoworkingApp extends StatelessWidget {
//   const CoworkingApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'SF Pro Display',
//         scaffoldBackgroundColor: Color(0xFFF9FAFB),
//         colorScheme: ColorScheme.light(
//           primary: Color(0xFF3B82F6), // Cool blue highlight
//           secondary: Color(0xFF60A5FA),
//           surface: Colors.white,
//           background: Color(0xFFF9FAFB), // Very light background
//         ),
//       ),
//       home: const CoworkingHomePage(),
//     );
//   }
// }

// class CoworkingHomePage extends StatefulWidget {
//   const CoworkingHomePage({Key? key}) : super(key: key);

//   @override
//   State<CoworkingHomePage> createState() => _CoworkingHomePageState();
// }

// class _CoworkingHomePageState extends State<CoworkingHomePage> {
//   int _selectedIndex = 0;
//   // Mock user ID - replace with actual user ID from your authentication system
//   final String userId = "user123";
//   // Replace with your actual API base URL
//   final String baseUrl = "http://localhost:8000";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: ListView(
//             children: [
//               const SizedBox(height: 32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Coworking Space',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1F2937), // Dark gray text
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         'Work remotely with flexibility',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFF6B7280), // Soft gray
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Replace CircleAvatar with NotificationDropdown
//                   // NotificationDropdown(
//                   //   // userId: userId,
//                   //   baseUrl: baseUrl,
//                   // ),
//                 ],
//               ),
//               const SizedBox(height: 32),
//               Text(
//                 'Book a space',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF1F2937),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: SpaceOptionCard(
//                       title: 'Open Space',
//                       subtitle: 'Reserve an open space',
//                       icon: Icons.weekend_outlined,
//                       color: Color(0xFFE0F7FA),
//                       iconColor: Color(0xFF00B0FF),
//                       onTap: () {},
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: SpaceOptionCard(
//                       title: 'Meeting Room',
//                       subtitle: 'Reserve a meeting room',
//                       icon: Icons.table_bar,
//                       color: Color(0xFFE3F2FD),
//                       iconColor: Color(0xFF2196F3),
//                       onTap: () {},
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: SpaceOptionCard(
//                       title: 'Private Office',
//                       subtitle: 'Reserve a private office',
//                       icon: Icons.desktop_windows_outlined,
//                       color: Color(0xFFFFF9C4),
//                       iconColor: Color(0xFFFFC107),
//                       onTap: () {},
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),
//               SubscriptionCard(),
//               const SizedBox(height: 32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Popular',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFF1F2937),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'See All',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF3B82F6),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 200,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const [
//                     PopularSpaceCard(
//                       imagePath: 'assets/openspace1.jpg',
//                       title: 'Open Space',
//                       location: 'Downtown',
//                       rating: 4.8,
//                     ),
//                     SizedBox(width: 16),
//                     PopularSpaceCard(
//                       imagePath: 'assets/meetingRoom1.jpg',
//                       title: 'Meeting Room',
//                       location: 'Business Center',
//                       rating: 4.6,
//                     ),
//                     SizedBox(width: 16),
//                     PopularSpaceCard(
//                       imagePath: 'assets/officeroom2.jpg',
//                       title: 'Private Office',
//                       location: 'Tech Hub',
//                       rating: 4.9,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SpaceOptionCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Color color;
//   final Color iconColor;
//   final VoidCallback onTap;

//   const SpaceOptionCard({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.color,
//     required this.iconColor,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Icon(icon, size: 28, color: iconColor),
//             ),
//             const SizedBox(height: 12),
//             Text(title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                   color: Color(0xFF1F2937),
//                 ),
//                 textAlign: TextAlign.center),
//             const SizedBox(height: 4),
//             Text(
//               subtitle,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Color(0xFF6B7280),
//               ),
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SubscriptionCard extends StatelessWidget {
//   const SubscriptionCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Color(0xFF3B82F6),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xFF3B82F6).withOpacity(0.3),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Get unlimited access',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 6),
//                 Text(
//                   'Purchase a subscription to unlock all premium features',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white.withOpacity(0.8),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 16),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ChoosePlanScreen(),
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               backgroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               elevation: 0,
//             ),
//             child: Text(
//               'Subscribe',
//               style: TextStyle(
//                 color: Color(0xFF3B82F6),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PopularSpaceCard extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String location;
//   final double rating;

//   const PopularSpaceCard({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     required this.location,
//     required this.rating,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 120,
//             width: double.infinity,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.amber, size: 16),
//                         SizedBox(width: 4),
//                         Text(
//                           rating.toString(),
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                     color: Color(0xFF1F2937),
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       size: 14,
//                       color: Color(0xFF6B7280),
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       location,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Color(0xFF6B7280),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the notification_dropdown.dart file
import 'notification_dropdown.dart';
import 'choose_plan_screen.dart';

void main() {
  runApp(const CoworkingApp());
}

class CoworkingApp extends StatelessWidget {
  const CoworkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
        scaffoldBackgroundColor: Color(0xFFF9FAFB),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF3B82F6), // Cool blue highlight
          secondary: Color(0xFF60A5FA),
          surface: Colors.white,
          background: Color(0xFFF9FAFB), // Very light background
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
      home: const CoworkingHomePage(),
    );
  }
}

class CoworkingHomePage extends StatefulWidget {
  const CoworkingHomePage({Key? key}) : super(key: key);

  @override
  State<CoworkingHomePage> createState() => _CoworkingHomePageState();
}

class _CoworkingHomePageState extends State<CoworkingHomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;
  final String userId = "user123"; // Mock user ID 
  final String baseUrl = "http://localhost:8000"; // Replace with actual API base URL

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.location_on_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Location',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'San Francisco, CA',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.notifications_none_rounded, 
                color: Colors.black87,
                size: 26,
              ),
              onPressed: () {
                // Show notifications
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Your Perfect',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      'Workspace Today',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    // Search bar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[500]),
                          SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for workspaces',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                isCollapsed: true,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workspace Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Workspace categories
            SliverToBoxAdapter(
              child: Container(
                height: 160,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    WorkspaceCategoryCard(
                      title: 'Open Space',
                      subtitle: 'Collaborative',
                      icon: Icons.groups_outlined,
                      color: Color(0xFFE0F7FA),
                      iconColor: Color(0xFF00B0FF),
                      onTap: () {},
                    ),
                    WorkspaceCategoryCard(
                      title: 'Meeting Room',
                      subtitle: 'Professional',
                      icon: Icons.table_chart_outlined,
                      color: Color(0xFFE3F2FD),
                      iconColor: Color(0xFF2196F3),
                      onTap: () {},
                    ),
                    WorkspaceCategoryCard(
                      title: 'Private Office',
                      subtitle: 'Focused',
                      icon: Icons.business_center_outlined,
                      color: Color(0xFFFFF9C4),
                      iconColor: Color(0xFFFFC107),
                      onTap: () {},
                    ),
                    WorkspaceCategoryCard(
                      title: 'Event Space',
                      subtitle: 'Gathering',
                      icon: Icons.event_outlined,
                      color: Color(0xFFE8F5E9),
                      iconColor: Color(0xFF4CAF50),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            
            // Membership banner
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: MembershipBanner(),
              ),
            ),
            
            // Popular workspaces
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Workspaces',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Tab bar for filtering
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey[700],
                    labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Nearby'),
                      Tab(text: 'Top Rated'),
                    ],
                  ),
                ),
              ),
            ),
            
            // Popular workspace cards
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  PopularWorkspaceCard(
                    imagePath: 'assets/openspace1.jpg',
                    title: 'SkyHub Workspace',
                    location: 'Downtown Financial District',
                    rating: 4.8,
                    price: 25,
                    distance: '1.2 km',
                  ),
                  SizedBox(height: 16),
                  PopularWorkspaceCard(
                    imagePath: 'assets/meetingRoom1.jpg',
                    title: 'Creative Corner',
                    location: 'Mission District',
                    rating: 4.6,
                    price: 30,
                    distance: '2.5 km',
                  ),
                  SizedBox(height: 16),
                  PopularWorkspaceCard(
                    imagePath: 'assets/officeroom2.jpg',
                    title: 'The Business Hub',
                    location: 'SOMA Tech Corridor',
                    rating: 4.9,
                    price: 40,
                    distance: '3.7 km',
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_outlined),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class WorkspaceCategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const WorkspaceCategoryCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 130,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 24, color: iconColor),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MembershipBanner extends StatelessWidget {
  const MembershipBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF3B82F6),
            Color(0xFF60A5FA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF3B82F6).withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Premium Membership',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Get Unlimited Access',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Save up to 30% on all workspace bookings',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChoosePlanScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    'View Plans',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/membership_icon.png',
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image is not found
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.workspace_premium,
                  size: 60,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PopularWorkspaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final double rating;
  final int price;
  final String distance;

  const PopularWorkspaceCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image is not found
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey[500],
                        size: 50,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          distance,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$$price',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          TextSpan(
                            text: '/hr',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Color(0xFF6B7280),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_today, size: 18),
                        label: Text('Book Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.grey[700],
                        ),
                        splashRadius: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}