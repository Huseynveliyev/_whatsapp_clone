import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:real_whatsapp_clone/constants/constants.dart';
import 'package:real_whatsapp_clone/screens/Calls_page.dart';
import 'package:real_whatsapp_clone/screens/camera_page.dart';
import 'package:real_whatsapp_clone/screens/chats_page.dart';
import 'package:real_whatsapp_clone/screens/status_page.dart';

class WhatsappMain extends StatefulWidget {
  const WhatsappMain({Key? key}) : super(key: key);

  @override
  State<WhatsappMain> createState() => _WhatsappMainState();
}

class _WhatsappMainState extends State<WhatsappMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showMessage = true;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      _showMessage = _tabController.index != 0;
      print(_showMessage);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Text("WhatSapp",
            style: TextStyle(fontSize: 17, color: Colors.white)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(
                Icons.camera_alt,
              ),
            ),
            Tab(
              child: TabbarText(text: "CHATS"),
            ),
            Tab(
              child: TabbarText(text: "STATUS"),
            ),
            Tab(
              child: TabbarText(text: "CALLS"),
            ),
          ],
        ),
        actions: [
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PopupMenuButton(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                popUpMenuItem(value: 1, text: 'Find Group'),
                popUpMenuItem(value: 2, text: 'Connected devices'),
                popUpMenuItem(value: 3, text: 'Settings'),
              ],
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [CameraPage(), StatusPage(), CallsPage()],
      ),
      floatingActionButton: _showMessage
          ? FloatingActionButton(
              backgroundColor: greenColor,
              onPressed: () {},
              child: Icon(Icons.message),
            )
          : null,
    );
  }

  PopupMenuItem<int> popUpMenuItem({int? value, required String text}) {
    return PopupMenuItem(
      value: value,
      child: Text('$text'),
    );
  }

  Text TabbarText({String? text}) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.w700),
    );
  }
}
