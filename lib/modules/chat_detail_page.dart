import 'package:chat_flutter/componets/chart_detail_page_appbar.dart';
import 'package:chat_flutter/componets/chat_bubble.dart';
import 'package:chat_flutter/models/chat_message.dart';
import 'package:chat_flutter/models/send_menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MessageType{
  Sender,
  Receiver,
}

class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi Linet", type: MessageType.Receiver),
    ChatMessage(message: "Hi too", type: MessageType.Sender),
    ChatMessage(message: "Long time no see", type: MessageType.Receiver),
    ChatMessage(message: "how are you", type: MessageType.Receiver),
    ChatMessage(message: "I am fine well Thank you", type: MessageType.Sender),
    ChatMessage(message: "How about you", type: MessageType.Sender),
    ChatMessage(message: "I am fine", type: MessageType.Receiver),
    ChatMessage(message: "Just missing you :)", type: MessageType.Receiver),
    ChatMessage(message: "How is home", type: MessageType.Receiver),
    ChatMessage(message: "Home is fine", type: MessageType.Sender),
    ChatMessage(message: "I think we should meet and link up", type: MessageType.Sender),
    ChatMessage(message: "That is a great idea", type: MessageType.Receiver),
    ChatMessage(message: "lets say monday at kibandaski", type: MessageType.Sender),
    ChatMessage(message: "That is fine with me . see you then..", type: MessageType.Receiver),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  void showModal(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: MediaQuery.of(context).size.height/2,
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),

              ),

              child: Column(
                children: <Widget>[
                  SizedBox(height: 0,),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    )
                  ),
                  SizedBox(height: 0,),
                  ListView.builder(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index){
                        return Container(
                          padding: EdgeInsets.only(top: 0,bottom: 0),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: menuItems[index].color.shade50,
                              ),
                              height: 50,
                              width: 50,
                              child: Icon(menuItems[index].icons,
                              size: 20,
                                color: menuItems[index].color.shade400,
                              ),
                            ),
                            title: Text(menuItems[index].text),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: ChatDetailPageAppbar(),
    body: Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: chatMessage.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
            return ChatBubble(
              chatMessage: chatMessage[index],
            );
            },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 16,bottom: 1),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    showModal();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.add, color: Colors.white,size: 21,),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.only(right: 30,bottom: 30),
            child: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.send,color: Colors.white,),
              backgroundColor: Colors.pink,
              elevation: 0,
            ),
          ),
        )
      ],
    ),
  );
  }
}