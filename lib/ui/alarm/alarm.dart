// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class AlarmScreen extends StatefulWidget {
//   const AlarmScreen({super.key});

//   @override
//   State<AlarmScreen> createState() => _AlarmScreenState();
// }

// class _AlarmScreenState extends State<AlarmScreen> {
//   late FlutterLocalNotificationsPlugin _notificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     _initializeNotifications();
//   }

//   void _initializeNotifications() {
//     _notificationsPlugin = FlutterLocalNotificationsPlugin();

//     const androidInitializationSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//     );

//     _notificationsPlugin.initialize(initializationSettings);

//     tz.initializeTimeZones();
//   }

//   Future<void> _scheduleAlarm() async {
//     final status = await Permission.scheduleExactAlarm.status;
//     print(status.name);
//     if (status.isGranted) {
//       final now = DateTime.now();
//       var alarmTime = DateTime(now.year, now.month, now.day, 9, 25);

//       if (alarmTime.isBefore(now)) {
//         // If 9 AM today has already passed, schedule it at ... 9:30
//         // final tomorrow = now.add(const Duration(days: 1));
//         alarmTime = DateTime(now.year, now.month, now.day, 9, 30);
//       }

//       await _notificationsPlugin.zonedSchedule(
//         0, // Notification ID
//         'Alarm',
//         'It\'s time! 9 AM alarm.',
//         tz.TZDateTime.from(alarmTime, tz.local),
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'alarm_channel',
//             'Alarm Notifications',
//             channelDescription: 'Notifications for alarms',
//             importance: Importance.max,
//             priority: Priority.high,
//           ),
//         ),
//         androidScheduleMode: AndroidScheduleMode.alarmClock,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//       );

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Alarm set for 9 AM!')),
//         );
//       }
//     } else {
//       if (mounted) {
//         showPermissionDialog(context);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Set Alarm')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _scheduleAlarm,
//           child: const Text('Set Alarm for 9 AM'),
//         ),
//       ),
//     );
//   }
// }

// void showPermissionDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       title: const Text('Permission Required'),
//       content: const Text(
//         'Exact alarms require additional permissions. Please enable them in your system settings.',
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             openAppSettings();
//             Navigator.pop(context);
//           },
//           child: const Text('Open Settings'),
//         ),
//       ],
//     ),
//   );
// }
