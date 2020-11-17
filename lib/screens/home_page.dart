import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_message/data.dart';
import 'package:whats_message/design_value.dart';
import 'package:whats_message/wigets/buildUnseenNotifier.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int unseenChats = 3;
  int unseenStatus = 0;
  int unseenCalls = 1;

  String isActive = 'CHATS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        title: Text(
          'WhatsApp',
          style: TextStyle(),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
        ],
      ),

      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.1,
                  color: themeColor,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt,size: 24,color: Colors.white,),
                    onPressed: (){

                    },
                  ),
                ),

                GestureDetector(
                  child: buildCategory(context, 'CHATS', unseenChats),
                  onTap: (){
                    setState(() {
                      isActive = 'CHATS';
                      unseenChats = 0;
                    });
                  },
                ),
                GestureDetector(
                  child: buildCategory(context, 'STATUS', unseenStatus),
                  onTap: (){
                    setState(() {
                      isActive = 'STATUS';
                      unseenStatus = 0;
                    });
                  },
                ),
                GestureDetector(
                  child: buildCategory(context, 'CALLS', unseenCalls),
                  onTap: (){
                    setState(() {
                      isActive = 'CALLS';
                      unseenCalls = 0;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: messageTile.map(buildItem).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategory(BuildContext context, String title, int unseen){
    return Container(
//    height: ,
      color: themeColor,
      width: MediaQuery.of(context).size.width*0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(

                child: Text(title,
                  style: isActive == title? categoryTitleActiveStyle : categoryTitleInactiveStyle,
                ),
              ),
              SizedBox(width: 5.0,),
              unseen>0
                  ? title != 'STATUS'
                    ?Container(
                      child: buildUnseenNotifier(unseen.toString(),isActive, title),
                    )
                    :Container()
              :Container(
                height: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    drawDot(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 3.0,
//          width: 50,
            color: isActive == title?bottomBarColor:themeColor,
          ),

        ],
      ),
    );
  }

  Widget buildItem(Map msgData) {
    return TestProxy(
      key: ValueKey(msgData),
      child: Column(
        children : <Widget>[
          Container(
            child: buildMessageTile(context, msgData),
          ),
          Divider(
            height: 10.0,
            color: Colors.grey[300],
            thickness: 0.4,
            indent: 90.0,
            endIndent: 10.0,
          ),
        ],


      ),
    );
  }

  Widget buildMessageTile(BuildContext context, Map msgData) {
    return ListTile(
      onTap: (){},
      leading: buildLeadingImage(msgData['image']),
      title: buildTitle(msgData['user']),
      subtitle: buildSubtitle(msgData['lastMsg']),
      trailing: Container(
        width: 45.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            buildLastMsgTime(msgData['lastMsgTime'],msgData['unreadMsgCount']),
            _buildUnseenNotifier(msgData['unreadMsgCount']),
          ],
        ),
      ),
    );
  }

  Widget buildLeadingImage(imageURL) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: themeColor,
        image: DecorationImage(
          image: NetworkImage(imageURL),
        ),
      ),
    );
  }

  Widget buildTitle(title) {
    return Container(
//      color: themeColor,
      height: 25.0,
      child: Text(title,
        style: titleStyle,
      ),
    );
  }

  Widget buildLastMsgTime(time,unreadCount) {
    return Container(
      height: 20.0,
//      width: 50.0,
      child: Text(
        time,
        style: TextStyle(
          fontSize: 10.0,
//          letterSpacing: ,
          color: unreadCount == 0 ? Colors.grey : Colors.green,
        ),
      ),
    );
  }

  Widget _buildUnseenNotifier(unreadCount) {
    return unreadCount > 0
      ? Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.green,
      ),
      child: Center(
        child: Text(
          unreadCount.toString(),
          style: TextStyle(
            fontSize: 9,
            color: Colors.white,
          ),
        ),
      ),
    )
    :Container(
      height: 20,
      width: 20,
    );
  }

  Widget buildSubtitle(subtitle) {
    return Container(
      height: 20,
      child: Text(
        subtitle,
        maxLines: 1,
        softWrap: false,

      ),
    );
  }

  Widget drawDot() {
    return Container(
      height: 6.0,
      width: 6.0,
      decoration: BoxDecoration(
        color: categoryTitleInactiveColor,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

class TestProxy extends SingleChildRenderObjectWidget{
  TestProxy({Key key, Widget child}): super(key : key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context){
    print('createRenderObject $key');
    return RenderProxyBox();
  }

  void updateRenderObject(BuildContext context, RenderObject renderObject){
    print('updateRenderObject $key');
  }
}



