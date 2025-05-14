// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:intl/intl.dart';

// // // Model class for notifications
// // class NotificationModel {
// //   final String id;
// //   final String content;
// //   final String title;
// //   final DateTime sentDate;
// //   final SenderModel sender;

// //   NotificationModel({
// //     required this.id,
// //     required this.content,
// //     required this.title,
// //     required this.sentDate,
// //     required this.sender,
// //   });

// //   factory NotificationModel.fromJson(Map<String, dynamic> json) {
// //     return NotificationModel(
// //       id: json['_id'] ?? '',
// //       content: json['content'] ?? '',
// //       title: json['title'] ?? '',
// //       sentDate: json['sentDate'] != null ? DateTime.parse(json['sentDate']) : DateTime.now(),
// //       sender: SenderModel.fromJson(json['sender_id'] ?? {}),
// //     );
// //   }
// // }

// // // Model class for notification sender
// // class SenderModel {
// //   final String id;
// //   final String firstName;
// //   final String lastName;
// //   final String? photo;

// //   SenderModel({
// //     required this.id,
// //     required this.firstName,
// //     required this.lastName,
// //     this.photo,
// //   });

// //   factory SenderModel.fromJson(Map<String, dynamic> json) {
// //     return SenderModel(
// //       id: json['_id'] ?? '',
// //       firstName: json['firstName'] ?? '',
// //       lastName: json['lastName'] ?? '',
// //       photo: json['photo'],
// //     );
// //   }
// // }

// // class NotificationDropdown extends StatefulWidget {
// //   final String userId;
// //   final String baseUrl; // API base URL

// //   const NotificationDropdown({
// //     Key? key,
// //     required this.userId,
// //     required this.baseUrl,
// //   }) : super(key: key);

// //   @override
// //   _NotificationDropdownState createState() => _NotificationDropdownState();
// // }

// // class _NotificationDropdownState extends State<NotificationDropdown> with SingleTickerProviderStateMixin {
// //   final LayerLink _layerLink = LayerLink();
// //   OverlayEntry? _overlayEntry;
// //   bool _isOpen = false;
// //   bool _hasNotifications = true;
// //   bool _isLoading = true;
// //   String? _error;
// //   List<NotificationModel> _notifications = [];
// //   late AnimationController _animationController;
// //   late Animation<double> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 200),
// //     );
// //     _animation = CurvedAnimation(
// //       parent: _animationController,
// //       curve: Curves.easeInOut,
// //     );
// //     _fetchNotifications();
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     _removeOverlay();
// //     super.dispose();
// //   }

// //   Future<void> _fetchNotifications() async {
// //     if (widget.userId.isEmpty) return;

// //     setState(() {
// //       _isLoading = true;
// //       _error = null;
// //     });

// //     try {
// //       final response = await http.get(
// //         Uri.parse('${widget.baseUrl}/ELACO/notification/getUserNotifications/${widget.userId}'),
// //       );

// //       if (response.statusCode != 200) {
// //         throw Exception('Error fetching notifications: ${response.statusCode}');
// //       }

// //       final Map<String, dynamic> data = json.decode(response.body);
// //       final List<dynamic> notificationsJson = data['notifications'] ?? [];

// //       setState(() {
// //         _notifications = notificationsJson
// //             .map((json) => NotificationModel.fromJson(json))
// //             .toList();
// //         _hasNotifications = _notifications.isNotEmpty;
// //         _isLoading = false;
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _error = e.toString();
// //         _isLoading = false;
// //       });
// //       print('Error fetching notifications: $e');
// //     }
// //   }

// //   void _toggleDropdown() {
// //     if (_isOpen) {
// //       _removeOverlay();
// //     } else {
// //       _showOverlay();
// //     }

// //     setState(() {
// //       _isOpen = !_isOpen;
// //       _hasNotifications = false; // Mark notifications as read when opened

// //       if (_isOpen) {
// //         _animationController.forward();
// //       } else {
// //         _animationController.reverse();
// //       }
// //     });
// //   }

// //   void _removeOverlay() {
// //     _overlayEntry?.remove();
// //     _overlayEntry = null;
// //   }

// //   void _showOverlay() {
// //     _overlayEntry = _createOverlayEntry();
// //     Overlay.of(context).insert(_overlayEntry!);
// //   }

// //   OverlayEntry _createOverlayEntry() {
// //     final RenderBox renderBox = context.findRenderObject() as RenderBox;
// //     final size = renderBox.size;
// //     final offset = renderBox.localToGlobal(Offset.zero);

// //     return OverlayEntry(
// //       builder: (context) => Positioned(
// //         left: offset.dx - 300 + size.width, // Position to the left of the button
// //         top: offset.dy + size.height + 5,
// //         width: 350,
// //         child: CompositedTransformFollower(
// //           link: _layerLink,
// //           showWhenUnlinked: false,
// //           offset: Offset(-300 + size.width, size.height + 5),
// //           child: Material(
// //             elevation: 8,
// //             borderRadius: BorderRadius.circular(12),
// //             color: Colors.transparent,
// //             child: FadeTransition(
// //               opacity: _animation,
// //               child: ScaleTransition(
// //                 scale: Tween<double>(begin: 0.8, end: 1.0).animate(_animation),
// //                 child: _buildDropdownContent(),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDropdownContent() {
// //     return Container(
// //       width: 350,
// //       height: 480,
// //       decoration: BoxDecoration(
// //         color: Theme.of(context).scaffoldBackgroundColor,
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(
// //           color: Colors.grey.withOpacity(0.2),
// //         ),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.1),
// //             blurRadius: 10,
// //             spreadRadius: 2,
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           // Header
// //           Container(
// //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //             decoration: BoxDecoration(
// //               border: Border(
// //                 bottom: BorderSide(
// //                   color: Colors.grey.withOpacity(0.2),
// //                 ),
// //               ),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   'Notifications',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Theme.of(context).textTheme.titleLarge?.color,
// //                   ),
// //                 ),
// //                 IconButton(
// //                   padding: EdgeInsets.zero,
// //                   constraints: BoxConstraints(),
// //                   icon: Icon(Icons.close),
// //                   onPressed: _toggleDropdown,
// //                   color: Colors.grey,
// //                 ),
// //               ],
// //             ),
// //           ),

// //           // Notification List
// //           Expanded(
// //             child: _buildNotificationList(),
// //           ),

// //           // View All Button
// //           Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   _toggleDropdown();
// //                   // Navigate to notifications page
// //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()));
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   foregroundColor: Theme.of(context).primaryColor,
// //                   padding: EdgeInsets.symmetric(vertical: 12),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                     side: BorderSide(
// //                       color: Colors.grey.withOpacity(0.3),
// //                     ),
// //                   ),
// //                 ),
// //                 child: Text(
// //                   'View All Notifications',
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildNotificationList() {
// //     if (_isLoading) {
// //       return Center(child: CircularProgressIndicator());
// //     }

// //     if (_error != null) {
// //       return Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Text(
// //             'Error: $_error',
// //             style: TextStyle(color: Colors.red),
// //           ),
// //         ),
// //       );
// //     }

// //     if (_notifications.isEmpty) {
// //       return Center(
// //         child: Text(
// //           'No new notifications',
// //           style: TextStyle(color: Colors.grey),
// //         ),
// //       );
// //     }

// //     return ListView.builder(
// //       padding: EdgeInsets.zero,
// //       itemCount: _notifications.length,
// //       itemBuilder: (context, index) {
// //         final notification = _notifications[index];
// //         return _buildNotificationItem(notification);
// //       },
// //     );
// //   }

// //   Widget _buildNotificationItem(NotificationModel notification) {
// //     final timeAgo = _getTimeAgo(notification.sentDate);

// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border(
// //           bottom: BorderSide(
// //             color: Colors.grey.withOpacity(0.2),
// //           ),
// //         ),
// //       ),
// //       child: ListTile(
// //         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //         leading: Stack(
// //           children: [
// //             CircleAvatar(
// //               radius: 20,
// //               backgroundImage: notification.sender.photo != null
// //                   ? NetworkImage('${widget.baseUrl}/images/${notification.sender.photo}')
// //                   : AssetImage('assets/default_avatar.png') as ImageProvider,
// //               backgroundColor: Colors.grey.withOpacity(0.2),
// //             ),
// //             Positioned(
// //               right: 0,
// //               bottom: 0,
// //               child: Container(
// //                 width: 10,
// //                 height: 10,
// //                 decoration: BoxDecoration(
// //                   color: Colors.green,
// //                   shape: BoxShape.circle,
// //                   border: Border.all(
// //                     color: Theme.of(context).scaffoldBackgroundColor,
// //                     width: 1.5,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         title: RichText(
// //           text: TextSpan(
// //             style: TextStyle(
// //               fontSize: 14,
// //               color: Colors.grey[600],
// //             ),
// //             children: [
// //               TextSpan(
// //                 text: '${notification.sender.firstName} ${notification.sender.lastName} ',
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Theme.of(context).textTheme.bodyLarge?.color,
// //                 ),
// //               ),
// //               TextSpan(text: notification.content),
// //             ],
// //           ),
// //         ),
// //         subtitle: Padding(
// //           padding: const EdgeInsets.only(top: 4.0),
// //           child: Row(
// //             children: [
// //               Text(
// //                 notification.title,
// //                 style: TextStyle(
// //                   fontSize: 12,
// //                   color: Colors.grey[600],
// //                 ),
// //               ),
// //               SizedBox(width: 5),
// //               Container(
// //                 width: 4,
// //                 height: 4,
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[400],
// //                   shape: BoxShape.circle,
// //                 ),
// //               ),
// //               SizedBox(width: 5),
// //               Text(
// //                 timeAgo,
// //                 style: TextStyle(
// //                   fontSize: 12,
// //                   color: Colors.grey[600],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         onTap: () {
// //           _toggleDropdown();
// //           // Handle notification tap
// //         },
// //       ),
// //     );
// //   }

// //   String _getTimeAgo(DateTime dateTime) {
// //     final difference = DateTime.now().difference(dateTime);

// //     if (difference.inDays > 365) {
// //       return '${(difference.inDays / 365).floor()} ${(difference.inDays / 365).floor() == 1 ? 'year' : 'years'} ago';
// //     } else if (difference.inDays > 30) {
// //       return '${(difference.inDays / 30).floor()} ${(difference.inDays / 30).floor() == 1 ? 'month' : 'months'} ago';
// //     } else if (difference.inDays > 0) {
// //       return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
// //     } else if (difference.inHours > 0) {
// //       return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
// //     } else if (difference.inMinutes > 0) {
// //       return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
// //     } else {
// //       return 'Just now';
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return CompositedTransformTarget(
// //       link: _layerLink,
// //       child: GestureDetector(
// //         onTap: _toggleDropdown,
// //         child: Container(
// //           width: 48,
// //           height: 48,
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             shape: BoxShape.circle,
// //             border: Border.all(
// //               color: Colors.grey.withOpacity(0.2),
// //             ),
// //           ),
// //           child: Stack(
// //             alignment: Alignment.center,
// //             children: [
// //               Icon(
// //                 Icons.notifications_outlined,
// //                 color: Theme.of(context).primaryColor,
// //                 size: 24,
// //               ),
// //               if (_hasNotifications)
// //                 Positioned(
// //                   top: 10,
// //                   right: 12,
// //                   child: Container(
// //                     width: 8,
// //                     height: 8,
// //                     decoration: BoxDecoration(
// //                       color: Colors.orange,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Center(
// //                       child: Container(
// //                         width: 8,
// //                         height: 8,
// //                         decoration: BoxDecoration(
// //                           color: Colors.orange,
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: AnimatedBuilder(
// //                           animation: _animationController,
// //                           builder: (context, child) {
// //                             return Container(
// //                               width: 8,
// //                               height: 8,
// //                               decoration: BoxDecoration(
// //                                 color: Colors.orange.withOpacity(0.75),
// //                                 shape: BoxShape.circle,
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // Usage example for the NotificationDropdown widget
// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:intl/intl.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // // Model class for notifications
// // class NotificationModel {
// //   final String id;
// //   final String content;
// //   final String title;
// //   final DateTime sentDate;
// //   final SenderModel sender;

// //   NotificationModel({
// //     required this.id,
// //     required this.content,
// //     required this.title,
// //     required this.sentDate,
// //     required this.sender,
// //   });

// //   factory NotificationModel.fromJson(Map<String, dynamic> json) {
// //     return NotificationModel(
// //       id: json['_id'] ?? '',
// //       content: json['content'] ?? '',
// //       title: json['title'] ?? '',
// //       sentDate: json['sentDate'] != null
// //           ? DateTime.parse(json['sentDate'])
// //           : DateTime.now(),
// //       sender: SenderModel.fromJson(json['sender_id'] ?? {}),
// //     );
// //   }
// // }

// // // Model class for sender
// // class SenderModel {
// //   final String id;
// //   final String firstName;
// //   final String lastName;
// //   final String? photo;

// //   SenderModel({
// //     required this.id,
// //     required this.firstName,
// //     required this.lastName,
// //     this.photo,
// //   });

// //   factory SenderModel.fromJson(Map<String, dynamic> json) {
// //     return SenderModel(
// //       id: json['_id'] ?? '',
// //       firstName: json['firstName'] ?? '',
// //       lastName: json['lastName'] ?? '',
// //       photo: json['photo'],
// //     );
// //   }
// // }

// // // Notification Dropdown Widget
// // class NotificationDropdown extends StatefulWidget {
// //   final String baseUrl;

// //   const NotificationDropdown({
// //     Key? key,
// //     required this.baseUrl,
// //   }) : super(key: key);

// //   @override
// //   _NotificationDropdownState createState() => _NotificationDropdownState();
// // }

// // class _NotificationDropdownState extends State<NotificationDropdown>
// //     with SingleTickerProviderStateMixin {
// //   final LayerLink _layerLink = LayerLink();
// //   OverlayEntry? _overlayEntry;
// //   bool _isOpen = false;
// //   bool _hasNotifications = true;
// //   bool _isLoading = true;
// //   String? _error;
// //   List<NotificationModel> _notifications = [];
// //   late AnimationController _animationController;
// //   late Animation<double> _animation;
// //   String? _userId;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 200),
// //     );
// //     _animation = CurvedAnimation(
// //       parent: _animationController,
// //       curve: Curves.easeInOut,
// //     );
// //     _loadUser();
// //   }

// //   Future<void> _loadUser() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final userString = prefs.getString('user');
// //     if (userString != null) {
// //       final userMap = jsonDecode(userString);
// //       setState(() {
// //         _userId = userMap['_id'];
// //         print(_userId);
// //       });
// //       await _fetchNotifications();
// //     }
// //   }

// //   Future<void> _fetchNotifications() async {
// //     if (_userId == null) return;

// //     setState(() {
// //       _isLoading = true;
// //       _error = null;
// //     });

// //     try {
// //       final response = await http.get(
// //         Uri.parse(
// //             'http://localhost:8000/ELACO/notification/getUserNotifications/$_userId'),
// //       );
// //       print(response);

// //       if (response.statusCode != 200) {
// //         throw Exception('Error fetching notifications: ${response.statusCode}');
// //       }

// //       final Map<String, dynamic> data = json.decode(response.body);
// //       final List<dynamic> notificationsJson = data['notifications'] ?? [];

// //       setState(() {
// //         _notifications = notificationsJson
// //             .map((json) => NotificationModel.fromJson(json))
// //             .toList();
// //         _hasNotifications = _notifications.isNotEmpty;
// //         _isLoading = false;
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _error = e.toString();
// //         _isLoading = false;
// //       });
// //       print('Error fetching notifications: $e');
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     _removeOverlay();
// //     super.dispose();
// //   }

// //   void _toggleDropdown() {
// //     if (_isOpen) {
// //       _removeOverlay();
// //     } else {
// //       _showOverlay();
// //     }

// //     setState(() {
// //       _isOpen = !_isOpen;
// //       _hasNotifications = false;

// //       if (_isOpen) {
// //         _animationController.forward();
// //       } else {
// //         _animationController.reverse();
// //       }
// //     });
// //   }

// //   void _removeOverlay() {
// //     _overlayEntry?.remove();
// //     _overlayEntry = null;
// //   }

// //   void _showOverlay() {
// //     _overlayEntry = _createOverlayEntry();
// //     Overlay.of(context).insert(_overlayEntry!);
// //   }

// //   OverlayEntry _createOverlayEntry() {
// //     final RenderBox renderBox = context.findRenderObject() as RenderBox;
// //     final size = renderBox.size;
// //     final offset = renderBox.localToGlobal(Offset.zero);

// //     return OverlayEntry(
// //       builder: (context) => Positioned(
// //         left: offset.dx - 300 + size.width,
// //         top: offset.dy + size.height + 5,
// //         width: 350,
// //         child: CompositedTransformFollower(
// //           link: _layerLink,
// //           showWhenUnlinked: false,
// //           offset: Offset(-300 + size.width, size.height + 5),
// //           child: Material(
// //             elevation: 8,
// //             borderRadius: BorderRadius.circular(12),
// //             color: Colors.transparent,
// //             child: FadeTransition(
// //               opacity: _animation,
// //               child: ScaleTransition(
// //                 scale: Tween<double>(begin: 0.8, end: 1.0).animate(_animation),
// //                 child: _buildDropdownContent(),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDropdownContent() {
// //     return Container(
// //       width: 350,
// //       height: 480,
// //       decoration: BoxDecoration(
// //         color: Theme.of(context).scaffoldBackgroundColor,
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(color: Colors.grey.withOpacity(0.2)),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.1),
// //             blurRadius: 10,
// //             spreadRadius: 2,
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           _buildHeader(),
// //           Expanded(child: _buildNotificationList()),
// //           _buildFooterButton(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildHeader() {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: BoxDecoration(
// //         border: Border(
// //           bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
// //         ),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             'Notifications',
// //             style: TextStyle(
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold,
// //               color: Theme.of(context).textTheme.titleLarge?.color,
// //             ),
// //           ),
// //           IconButton(
// //             padding: EdgeInsets.zero,
// //             constraints: BoxConstraints(),
// //             icon: Icon(Icons.close),
// //             onPressed: _toggleDropdown,
// //             color: Colors.grey,
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildNotificationList() {
// //     if (_isLoading) {
// //       return Center(child: CircularProgressIndicator());
// //     }

// //     if (_error != null) {
// //       return Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Text('Error: $_error', style: TextStyle(color: Colors.red)),
// //         ),
// //       );
// //     }

// //     if (_notifications.isEmpty) {
// //       return Center(
// //         child:
// //             Text('No new notifications', style: TextStyle(color: Colors.grey)),
// //       );
// //     }

// //     return ListView.builder(
// //       padding: EdgeInsets.zero,
// //       itemCount: _notifications.length,
// //       itemBuilder: (context, index) {
// //         final notification = _notifications[index];
// //         return _buildNotificationItem(notification);
// //       },
// //     );
// //   }

// //   Widget _buildNotificationItem(NotificationModel notification) {
// //     final timeAgo = _getTimeAgo(notification.sentDate);

// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border(
// //           bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
// //         ),
// //       ),
// //       child: ListTile(
// //         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //         leading: CircleAvatar(
// //           radius: 20,
// //           backgroundImage: notification.sender.photo != null
// //               ? NetworkImage(
// //                   '${widget.baseUrl}/images/${notification.sender.photo}')
// //               : AssetImage('assets/default_avatar.png') as ImageProvider,
// //           backgroundColor: Colors.grey.withOpacity(0.2),
// //         ),
// //         title: RichText(
// //           text: TextSpan(
// //             style: TextStyle(fontSize: 14, color: Colors.grey[600]),
// //             children: [
// //               TextSpan(
// //                 text:
// //                     '${notification.sender.firstName} ${notification.sender.lastName} ',
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   color: Theme.of(context).textTheme.bodyLarge?.color,
// //                 ),
// //               ),
// //               TextSpan(text: notification.content),
// //             ],
// //           ),
// //         ),
// //         subtitle: Padding(
// //           padding: const EdgeInsets.only(top: 4.0),
// //           child: Row(
// //             children: [
// //               Text(notification.title,
// //                   style: TextStyle(fontSize: 12, color: Colors.grey[600])),
// //               SizedBox(width: 5),
// //               Container(
// //                   width: 4,
// //                   height: 4,
// //                   decoration: BoxDecoration(
// //                       color: Colors.grey[400], shape: BoxShape.circle)),
// //               SizedBox(width: 5),
// //               Text(timeAgo, style: TextStyle(fontSize: 12, color: Colors.grey)),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildFooterButton() {
// //     return Padding(
// //       padding: const EdgeInsets.all(12.0),
// //       child: SizedBox(
// //         width: double.infinity,
// //         child: ElevatedButton(
// //           onPressed: () {
// //             _toggleDropdown();
// //             // Navigate to notifications page if needed
// //           },
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: Colors.white,
// //             foregroundColor: Theme.of(context).primaryColor,
// //             padding: EdgeInsets.symmetric(vertical: 12),
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(8),
// //               side: BorderSide(color: Colors.grey.withOpacity(0.3)),
// //             ),
// //           ),
// //           child: Text(
// //             'View All Notifications',
// //             style: TextStyle(fontWeight: FontWeight.w600),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   String _getTimeAgo(DateTime dateTime) {
// //     final now = DateTime.now();
// //     final diff = now.difference(dateTime);

// //     if (diff.inMinutes < 1) return 'just now';
// //     if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
// //     if (diff.inHours < 24) return '${diff.inHours}h ago';
// //     return DateFormat('MMM d, yyyy').format(dateTime);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return CompositedTransformTarget(
// //       link: _layerLink,
// //       child: GestureDetector(
// //         onTap: _toggleDropdown,
// //         child: Stack(
// //           children: [
// //             Icon(Icons.notifications, size: 30),
// //             if (_hasNotifications)
// //               Positioned(
// //                 right: 0,
// //                 top: 0,
// //                 child: Container(
// //                   width: 10,
// //                   height: 10,
// //                   decoration: BoxDecoration(
// //                     color: Colors.red,
// //                     shape: BoxShape.circle,
// //                   ),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class NotificationsScreen extends StatefulWidget {
//   final List<NotificationModel> initialNotifications;
//   final String baseUrl;

//   const NotificationsScreen({
//     Key? key,
//     required this.initialNotifications,
//     required this.baseUrl,
//   }) : super(key: key);

//   @override
//   _NotificationsScreenState createState() => _NotificationsScreenState();
// }

// class _NotificationsScreenState extends State<NotificationsScreen> {
//   late List<NotificationModel> _notifications;
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;
//   bool _hasMore = true;
//   bool _hasUnread = true;

//   @override
//   void initState() {
//     super.initState();
//     _notifications = widget.initialNotifications;
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels ==
//             _scrollController.position.maxScrollExtent &&
//         !_isLoading &&
//         _hasMore) {
//       _loadMoreNotifications();
//     }
//   }

//   Future<void> _loadMoreNotifications() async {
//     setState(() => _isLoading = true);

//     // Simulate network delay
//     await Future.delayed(const Duration(seconds: 2));

//     // In a real app, fetch from API
//     final newNotifications = [
//       NotificationModel(
//         id: 'new-${DateTime.now().millisecondsSinceEpoch}',
//         title: 'New Update Available',
//         content: 'Version 2.0 of our app is now available',
//         sentDate: DateTime.now().subtract(const Duration(days: 2)),
//         sender: SenderModel(
//           id: 'system',
//           firstName: 'System',
//           lastName: 'Notification',
//           photo: null,
//         ),
//       ),
//       NotificationModel(
//         id: 'new-${DateTime.now().millisecondsSinceEpoch + 1}',
//         title: 'Weekly Summary',
//         content: 'Here\'s what you missed this week',
//         sentDate: DateTime.now().subtract(const Duration(days: 3)),
//         sender: SenderModel(
//           id: 'system',
//           firstName: 'System',
//           lastName: 'Notification',
//           photo: null,
//         ),
//       ),
//     ];

//     setState(() {
//       _notifications.addAll(newNotifications);
//       _isLoading = false;
//       _hasMore = newNotifications.isNotEmpty; // Set to false when no more data
//     });
//   }

//   void _markAllAsRead() {
//     setState(() => _hasUnread = false);
//     // In a real app, update on server too
//   }

//   void _deleteNotification(String id) {
//     setState(() {
//       _notifications.removeWhere((n) => n.id == id);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Notification deleted')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
//       body: NestedScrollView(
//         controller: _scrollController,
//         headerSliverBuilder: (context, innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               expandedHeight: 120.0,
//               floating: true,
//               pinned: true,
//               snap: false,
//               backgroundColor: Theme.of(context).colorScheme.surface,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text(
//                   'Notifications',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onSurface,
//                     fontSize: 20,
//                   ),
//                 ),
//                 centerTitle: true,
//                 titlePadding: const EdgeInsets.only(bottom: 16.0),
//                 background: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Theme.of(context).colorScheme.primary.withOpacity(0.1),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.check_all),
//                   onPressed: _markAllAsRead,
//                   tooltip: 'Mark all as read',
//                 ),
//               ],
//             ),
//           ];
//         },
//         body: _buildNotificationList(),
//       ),
//     );
//   }

//   Widget _buildNotificationList() {
//     if (_notifications.isEmpty && !_isLoading) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.notifications_off, size: 64, color: Colors.grey),
//             const SizedBox(height: 16),
//             Text(
//               'No notifications yet',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async {
//         // Implement refresh logic
//         await Future.delayed(const Duration(seconds: 1));
//       },
//       child: ListView.builder(
//         padding: const EdgeInsets.only(top: 8.0),
//         itemCount: _notifications.length + (_hasMore ? 1 : 0),
//         itemBuilder: (context, index) {
//           if (index >= _notifications.length) {
//             return _buildLoadingIndicator();
//           }
//           return _buildNotificationItem(_notifications[index]);
//         },
//       ),
//     );
//   }

//   Widget _buildLoadingIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }

//   Widget _buildNotificationItem(NotificationModel notification) {
//     final isUnread = _hasUnread && _notifications.indexOf(notification) < 3;
//     final timeAgo = _getTimeAgo(notification.sentDate);

//     return Dismissible(
//       key: Key(notification.id),
//       direction: DismissDirection.endToStart,
//       background: Container(
//         color: Colors.red,
//         alignment: Alignment.centerRight,
//         padding: const EdgeInsets.only(right: 20),
//         child: const Icon(Icons.delete, color: Colors.white),
//       ),
//       onDismissed: (direction) => _deleteNotification(notification.id),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         decoration: BoxDecoration(
//           color: isUnread
//               ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
//               : Theme.of(context).colorScheme.surface,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12),
//           onTap: () {
//             // Handle notification tap
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Hero(
//                       tag: 'avatar-${notification.id}',
//                       child: CircleAvatar(
//                         radius: 20,
//                         backgroundImage: notification.sender.photo != null
//                             ? NetworkImage(
//                                 '${widget.baseUrl}/images/${notification.sender.photo}')
//                             : const AssetImage('assets/default_avatar.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             notification.title,
//                             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: isUnread
//                                       ? Theme.of(context).colorScheme.primary
//                                       : null,
//                                 ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             notification.content,
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (isUnread)
//                       Container(
//                         width: 8,
//                         height: 8,
//                         margin: const EdgeInsets.only(left: 8, top: 4),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.primary,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       size: 14,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       timeAgo,
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             color: Colors.grey,
//                           ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String _getTimeAgo(DateTime dateTime) {
//     final now = DateTime.now();
//     final diff = now.difference(dateTime);

//     if (diff.inMinutes < 1) return 'Just now';
//     if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
//     if (diff.inHours < 24) return '${diff.inHours}h ago';
//     if (diff.inDays < 7) return '${diff.inDays}d ago';
//     return DateFormat('MMM d, yyyy').format(dateTime);
//   }
// }

// // Your existing models
// class NotificationModel {
//   final String id;
//   final String content;
//   final String title;
//   final DateTime sentDate;
//   final SenderModel sender;

//   NotificationModel({
//     required this.id,
//     required this.content,
//     required this.title,
//     required this.sentDate,
//     required this.sender,
//   });
// }

// class SenderModel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String? photo;

//   SenderModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     this.photo,
//   });
// }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class NotificationsScreen extends StatefulWidget {
//   final List<NotificationModel> initialNotifications;
//   final String baseUrl;

//   const NotificationsScreen({
//     Key? key,
//     required this.initialNotifications,
//     required this.baseUrl,
//   }) : super(key: key);

//   @override
//   _NotificationsScreenState createState() => _NotificationsScreenState();
// }

// class _NotificationsScreenState extends State<NotificationsScreen> {
//   late List<NotificationModel> _notifications;
//   final ScrollController _scrollController = ScrollController();
//   bool _isLoading = false;
//   bool _hasMore = true;
//   bool _hasUnread = true;

//   @override
//   void initState() {
//     super.initState();
//     _notifications = widget.initialNotifications;
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _scrollListener() {
//     if (_scrollController.position.pixels ==
//             _scrollController.position.maxScrollExtent &&
//         !_isLoading &&
//         _hasMore) {
//       _loadMoreNotifications();
//     }
//   }

//   Future<void> _loadMoreNotifications() async {
//     setState(() => _isLoading = true);

//     // Simulate network delay
//     await Future.delayed(const Duration(seconds: 2));

//     // In a real app, fetch from API
//     final newNotifications = [
//       NotificationModel(
//         id: 'new-${DateTime.now().millisecondsSinceEpoch}',
//         title: 'New Update Available',
//         content: 'Version 2.0 of our app is now available',
//         sentDate: DateTime.now().subtract(const Duration(days: 2)),
//         sender: SenderModel(
//           id: 'system',
//           firstName: 'System',
//           lastName: 'Notification',
//           photo: null,
//         ),
//       ),
//       NotificationModel(
//         id: 'new-${DateTime.now().millisecondsSinceEpoch + 1}',
//         title: 'Weekly Summary',
//         content: 'Here\'s what you missed this week',
//         sentDate: DateTime.now().subtract(const Duration(days: 3)),
//         sender: SenderModel(
//           id: 'system',
//           firstName: 'System',
//           lastName: 'Notification',
//           photo: null,
//         ),
//       ),
//     ];

//     setState(() {
//       _notifications.addAll(newNotifications);
//       _isLoading = false;
//       _hasMore = newNotifications.isNotEmpty; // Set to false when no more data
//     });
//   }

//   void _markAllAsRead() {
//     setState(() => _hasUnread = false);
//     // In a real app, update on server too
//   }

//   void _deleteNotification(String id) {
//     setState(() {
//       _notifications.removeWhere((n) => n.id == id);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Notification deleted')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
//       body: NestedScrollView(
//         controller: _scrollController,
//         headerSliverBuilder: (context, innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               expandedHeight: 120.0,
//               floating: true,
//               pinned: true,
//               snap: false,
//               backgroundColor: Theme.of(context).colorScheme.surface,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text(
//                   'Notifications',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onSurface,
//                     fontSize: 20,
//                   ),
//                 ),
//                 centerTitle: true,
//                 titlePadding: const EdgeInsets.only(bottom: 16.0),
//                 background: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Theme.of(context).colorScheme.primary.withOpacity(0.1),
//                         Colors.transparent,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.done_all), // Changed from check_all
//                   onPressed: _markAllAsRead,
//                   tooltip: 'Mark all as read',
//                 ),
//               ],
//             ),
//           ];
//         },
//         body: _buildNotificationList(),
//       ),
//     );
//   }

//   Widget _buildNotificationList() {
//     if (_notifications.isEmpty && !_isLoading) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.notifications_off, size: 64, color: Colors.grey),
//             const SizedBox(height: 16),
//             Text(
//               'No notifications yet',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async {
//         // Implement refresh logic
//         await Future.delayed(const Duration(seconds: 1));
//       },
//       child: ListView.builder(
//         padding: const EdgeInsets.only(top: 8.0),
//         itemCount: _notifications.length + (_hasMore ? 1 : 0),
//         itemBuilder: (context, index) {
//           if (index >= _notifications.length) {
//             return _buildLoadingIndicator();
//           }
//           return _buildNotificationItem(_notifications[index]);
//         },
//       ),
//     );
//   }

//   Widget _buildLoadingIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }

//   Widget _buildNotificationItem(NotificationModel notification) {
//     final isUnread = _hasUnread && _notifications.indexOf(notification) < 3;
//     final timeAgo = _getTimeAgo(notification.sentDate);

//     return Dismissible(
//       key: Key(notification.id),
//       direction: DismissDirection.endToStart,
//       background: Container(
//         color: Colors.red,
//         alignment: Alignment.centerRight,
//         padding: const EdgeInsets.only(right: 20),
//         child: const Icon(Icons.delete, color: Colors.white),
//       ),
//       onDismissed: (direction) => _deleteNotification(notification.id),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         decoration: BoxDecoration(
//           color: isUnread
//               ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
//               : Theme.of(context).colorScheme.surface,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12),
//           onTap: () {
//             // Handle notification tap
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Hero(
//                       tag: 'avatar-${notification.id}',
//                       child: CircleAvatar(
//                         radius: 20,
//                         backgroundImage: notification.sender.photo != null
//                             ? NetworkImage(
//                                 '${widget.baseUrl}/images/${notification.sender.photo}')
//                             : const AssetImage('assets/default_avatar.png')
//                                 as ImageProvider,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             notification.title,
//                             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: isUnread
//                                       ? Theme.of(context).colorScheme.primary
//                                       : null,
//                                 ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             notification.content,
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (isUnread)
//                       Container(
//                         width: 8,
//                         height: 8,
//                         margin: const EdgeInsets.only(left: 8, top: 4),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.primary,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.access_time,
//                       size: 14,
//                       color: Colors.grey,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       timeAgo,
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             color: Colors.grey,
//                           ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String _getTimeAgo(DateTime dateTime) {
//     final now = DateTime.now();
//     final diff = now.difference(dateTime);

//     if (diff.inMinutes < 1) return 'Just now';
//     if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
//     if (diff.inHours < 24) return '${diff.inHours}h ago';
//     if (diff.inDays < 7) return '${diff.inDays}d ago';
//     return DateFormat('MMM d, yyyy').format(dateTime);
//   }
// }

// class NotificationModel {
//   final String id;
//   final String content;
//   final String title;
//   final DateTime sentDate;
//   final SenderModel sender;

//   NotificationModel({
//     required this.id,
//     required this.content,
//     required this.title,
//     required this.sentDate,
//     required this.sender,
//   });
// }

// class SenderModel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String? photo;

//   SenderModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     this.photo,
//   });
// }
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

// class NotificationsScreen extends StatefulWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);

//   @override
//   State<NotificationsScreen> createState() => _NotificationsScreenState();
// }

// class _NotificationsScreenState extends State<NotificationsScreen>
//     with SingleTickerProviderStateMixin {
//   List<NotificationModel> _notifications = [];
//   bool _isLoading = true;
//   String? _error;
//   String? _userId;
//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 400),
//       vsync: this,
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: Offset(1.0, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _loadUser();
//     _controller.forward();
//   }

//   Future<void> _loadUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString('user');
//     if (userString != null) {
//       final userMap = jsonDecode(userString);
//       _userId = userMap['_id'];
//       await _fetchNotifications();
//     }
//   }

//   Future<void> _fetchNotifications() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://localhost:8000/ELACO/notification/getUserNotifications/$_userId'));

//       if (response.statusCode != 200) {
//         throw Exception('Failed to load notifications');
//       }

//       final data = jsonDecode(response.body);
//       final List<dynamic> list = data['notifications'];
//       setState(() {
//         _notifications = list
//             .map((json) => NotificationModel.fromJson(json))
//             .toList();
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _error = e.toString();
//         _isLoading = false;
//       });
//     }
//   }

//   String _getTimeAgo(DateTime time) {
//     final now = DateTime.now();
//     final difference = now.difference(time);
//     if (difference.inMinutes < 1) return 'Just now';
//     if (difference.inHours < 1) return '${difference.inMinutes} min ago';
//     if (difference.inDays < 1) return '${difference.inHours} hrs ago';
//     return DateFormat('dd/MM/yyyy').format(time);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Widget _buildNotificationTile(NotificationModel notification) {
//     final timeAgo = _getTimeAgo(notification.sentDate);
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: notification.sender.photo != null
//               ? NetworkImage(
//                   'http://localhost:8000/images/${notification.sender.photo}')
//               : AssetImage('assets/default_avatar.png') as ImageProvider,
//         ),
//         title: Text(
//           '${notification.sender.firstName} ${notification.sender.lastName}',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(notification.content),
//             SizedBox(height: 4),
//             Text(
//               '${notification.title} • $timeAgo',
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//           ],
//         ),
//         isThreeLine: true,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _slideAnimation,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Notifications'),
//           elevation: 0,
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//         ),
//         body: AnimatedSwitcher(
//           duration: Duration(milliseconds: 300),
//           child: _isLoading
//               ? Center(child: CircularProgressIndicator())
//               : _error != null
//                   ? Center(child: Text('Error: $_error'))
//                   : _notifications.isEmpty
//                       ? Center(child: Text('No new notifications'))
//                       : ListView.builder(
//                           itemCount: _notifications.length,
//                           itemBuilder: (context, index) {
//                             return _buildNotificationTile(
//                                 _notifications[index]);
//                           },
//                         ),
//         ),
//         backgroundColor: Colors.grey[100],
//       ),
//     );
//   }
// }

// // You can keep these model classes in a separate file
// class NotificationModel {
//   final String id;
//   final String content;
//   final String title;
//   final DateTime sentDate;
//   final SenderModel sender;

//   NotificationModel({
//     required this.id,
//     required this.content,
//     required this.title,
//     required this.sentDate,
//     required this.sender,
//   });

//   factory NotificationModel.fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       id: json['_id'] ?? '',
//       content: json['content'] ?? '',
//       title: json['title'] ?? '',
//       sentDate: DateTime.parse(json['sentDate'] ?? DateTime.now().toString()),
//       sender: SenderModel.fromJson(json['sender_id'] ?? {}),
//     );
//   }
// }

// class SenderModel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String? photo;

//   SenderModel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     this.photo,
//   });

//   factory SenderModel.fromJson(Map<String, dynamic> json) {
//     return SenderModel(
//       id: json['_id'] ?? '',
//       firstName: json['firstName'] ?? '',
//       lastName: json['lastName'] ?? '',
//       photo: json['photo'],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  List<NotificationModel> _notifications = [];
  bool _isLoading = true;
  String? _error;
  String? _userId;
  
  // Animations
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Setup slide animation for screen entry
    _slideController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutQuint,
    ));
    
    // Setup fade animation
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));
    
    // Start animations
    _slideController.forward();
    _fadeController.forward();
    
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      final userMap = jsonDecode(userString);
      _userId = userMap['_id'];
      await _fetchNotifications();
    }
  }

  Future<void> _fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse(
          'http://localhost:8000/ELACO/notification/getUserNotifications/$_userId'));

      if (response.statusCode != 200) {
        throw Exception('Failed to load notifications');
      }

      final data = jsonDecode(response.body);
      final List<dynamic> list = data['notifications'];
      setState(() {
        _notifications = list
            .map((json) => NotificationModel.fromJson(json))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  String _getTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inHours < 1) return '${difference.inMinutes} min ago';
    if (difference.inDays < 1) return '${difference.inHours} hrs ago';
    return DateFormat('dd/MM/yyyy').format(time);
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Widget _buildNotificationTile(NotificationModel notification, int index) {
    final timeAgo = _getTimeAgo(notification.sentDate);
    
    return Hero(
      tag: 'notification-${notification.id}',
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Show notification details animation
                  _showNotificationDetails(notification);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar with pulse animation
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor.withOpacity(0.2),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          backgroundImage: notification.sender.photo != null
                              ? NetworkImage(
                                  'http://localhost:8000/images/${notification.sender.photo}')
                              : AssetImage('assets/default_avatar.png') as ImageProvider,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${notification.sender.firstName} ${notification.sender.lastName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  timeAgo,
                                  style: TextStyle(
                                    fontSize: 12, 
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              notification.title,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              notification.content,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showNotificationDetails(NotificationModel notification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionAnimationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.75,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundImage: notification.sender.photo != null
                            ? NetworkImage(
                                'http://localhost:8000/images/${notification.sender.photo}')
                            : AssetImage('assets/default_avatar.png') as ImageProvider,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${notification.sender.firstName} ${notification.sender.lastName}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              _getTimeAgo(notification.sentDate),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        notification.content,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Dismiss'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_off_outlined,
              size: 60,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You\'ll be notified when something happens',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 60,
            color: Colors.red[300],
          ),
          SizedBox(height: 24),
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            _error ?? 'Could not load notifications',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _isLoading = true;
                _error = null;
              });
              _fetchNotifications();
            },
            icon: Icon(Icons.refresh),
            label: Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _fetchNotifications();
            },
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: _isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Loading notifications...',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : _error != null
                    ? _buildErrorState()
                    : _notifications.isEmpty
                        ? _buildEmptyState()
                        : AnimationLimiter(
                            child: RefreshIndicator(
                              onRefresh: _fetchNotifications,
                              color: Theme.of(context).primaryColor,
                              backgroundColor: Colors.white,
                              strokeWidth: 3,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(top: 8, bottom: 24),
                                itemCount: _notifications.length,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: Duration(milliseconds: 500),
                                    child: SlideAnimation(
                                      horizontalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: _buildNotificationTile(
                                          _notifications[index],
                                          index,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
          ),
        ),
      ),
    );
  }
}

// You can keep these model classes in a separate file
class NotificationModel {
  final String id;
  final String content;
  final String title;
  final DateTime sentDate;
  final SenderModel sender;

  NotificationModel({
    required this.id,
    required this.content,
    required this.title,
    required this.sentDate,
    required this.sender,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] ?? '',
      content: json['content'] ?? '',
      title: json['title'] ?? '',
      sentDate: DateTime.parse(json['sentDate'] ?? DateTime.now().toString()),
      sender: SenderModel.fromJson(json['sender_id'] ?? {}),
    );
  }
}

class SenderModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? photo;

  SenderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.photo,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      photo: json['photo'],
    );
  }
}