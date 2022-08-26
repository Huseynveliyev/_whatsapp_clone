import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_whatsapp_clone/constants/constants.dart';
import 'package:real_whatsapp_clone/screens/conversation_page.dart';

class ChatsPage extends StatelessWidget {
  final String userId = 'HrxhxGwcagbmgknHH8i5rC5Viy92';

  @override
  Widget build(BuildContext context) =>
      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("conservations")
            .where('members', arrayContains: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final chats = snapshot.data?.docs;
          print(chats);
          if (chats == null) {
            return Text("Error ${snapshot.error}");
          }
          if (chats.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ConservationPage(
                          userId: userId, conservationId: chat.id)),
                    ),
                  ),
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("http://placekitten.com/g/200/300")),
                  title: Text('Huseyn'),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(chat['displayMessage']),
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        "21:54",
                        style: TextStyle(
                            color: Color.fromARGB(
                              255,
                              53,
                              202,
                              61,
                            ),
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 22, top: 5),
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            "10",
                            style: TextStyle(color: whiteColor, fontSize: 12),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.greenAccent.shade700),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
}
