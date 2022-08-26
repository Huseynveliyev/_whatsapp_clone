import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_whatsapp_clone/constants/constants.dart';

class ConservationPage extends StatefulWidget {
  final String? userId;
  final String? conservationId;
  const ConservationPage({Key? key, this.userId, this.conservationId})
      : super(key: key);

  @override
  State<ConservationPage> createState() => _ConservationPageState();
}

class _ConservationPageState extends State<ConservationPage> {
  late CollectionReference _ref;

  @override
  void initState() {
    _ref = FirebaseFirestore.instance
        .collection('conversations/${widget.conservationId}/message');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        backgroundColor: greenColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('http://placekitten.com/g/200/300'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Azer",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.video_camera_front_rounded),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.phone),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(onTap: () {}, child: Icon(Icons.more_vert)),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('http://placekitten.com/g/800/800'))),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: _ref.snapshots(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Align(
                            alignment: index % 2 == 0
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: Text(
                                "Test mesaji",
                                style: TextStyle(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: Colors.white70,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.faceSmile,
                                  color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: " Type a message",
                                  border: InputBorder.none),
                            ),
                          ),
                          InkWell(
                            child: Icon(Icons.attach_file, color: Colors.grey),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              child: FaIcon(FontAwesomeIcons.camera,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 46,
                    height: 46,
                    child: FloatingActionButton(
                      backgroundColor: greenColor,
                      onPressed: () {},
                      child: FaIcon(
                        FontAwesomeIcons.microphone,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
