import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  Map<String, dynamic> data;
  bool mine;
  ChatMessage(this.data, this.mine);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          !mine
              ? Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl'])),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                data['imgUrl'] != null
                    ? Image.network(
                        data['imgUrl'],
                        width: 250,
                      )
                    : Text(data['text'],
                        textAlign: mine ? TextAlign.end : TextAlign.end,
                        style: TextStyle(fontSize: 18)),
                Text(data['sender'],
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
              ],
            ),
          ),
          mine
              ? Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl'])),
                )
              : Container(),
        ],
      ),
    );
  }
}
