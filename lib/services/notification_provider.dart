import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/notification_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;
  String _baseUrl = 'http://your-api-base-url';

  List<NotificationModel> get notifications => _notifications;
  bool get isLoading => _isLoading;

  Future<void> loadNotifications() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/notifications'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _notifications = (data['notifications'] as List)
            .map((json) => NotificationModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      debugPrint('Error loading notifications: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markAsRead(String notificationId) async {
    // Implement mark as read logic
    notifyListeners();
  }
}