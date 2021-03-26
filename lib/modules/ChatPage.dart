import 'package:chat_flutter/componets/chat.dart';
import 'package:chat_flutter/models/chat_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "James Russel",
        secondaryText: "Awesome Setup",
        image: "images/userImage1.jpeg",
        time: "Now"),
    ChatUsers(
        text: "Hilary kibet",
        secondaryText: "That is great",
        image: "images/userImage2.jpeg",
        time: "1 min"),
    ChatUsers(
        text: "Eunice Wanjiku",
        secondaryText: "Hello friend",
        image: "images/userImage3.jpeg",
        time: "20 min"),
    ChatUsers(
        text: "Evans Mwenda",
        secondaryText: "I am the project manager",
        image: "images/userImage4.jpeg",
        time: "21 min"),
    ChatUsers(
        text: "Jason Munge",
        secondaryText: "I am presenting today",
        image: "images/userImage5.jpeg",
        time: "22 min"),
    ChatUsers(
        text: "Philip Kengo",
        secondaryText: "See you soon",
        image: "images/userImage6.jpeg",
        time: "23 min"),
    ChatUsers(
        text: "James Omari",
        secondaryText: "Yaah...",
        image: "images/userImage7.jpeg",
        time: "3 hours"),
    ChatUsers(
        text: "Kelvin Motisya",
        secondaryText: "Yesterday was a night",
        image: "images/userImage8.jpeg",
        time: "Yesterday"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chats",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, bottom: 2, top: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      height: 30,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "New",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUserList(
                  text: chatUsers[index].text,
                  secondaryText: chatUsers[index].secondaryText,
                  image: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 1 || index == 3 )?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
