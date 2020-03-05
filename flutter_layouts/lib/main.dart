import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainContent(),
    );
  }
}

enum WidgetType { row, column }

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  WidgetType _widgetType = WidgetType.row;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  void updateWidget() {
    setState(() {
      if (_widgetType == WidgetType.row) {
        _widgetType = WidgetType.column;
      } else {
        _widgetType = WidgetType.row;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Layout Notebook"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: <Widget>[getOptions(), getWidget()],
    );
  }

  Widget getOptions() {
    String widgetTypeString =
        (_widgetType == WidgetType.row) ? "Row" : "Column";

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: getOptionType(),
        ),
        Expanded(
          child: getOptionType(),
        ),
      ],
    );
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//        Column(
//          children: <Widget>[
//            Text("$widgetTypeString"),
//            FlatButton(
//              onPressed: updateWidget,
//              child: Icon(Icons.arrow_forward),
//            )
//          ],
//        )
//      ],
//    );
  }

  Widget getOptionType() {
    return Container(
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('option1'),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: updateWidget,
                  padding: EdgeInsets.all(0),
                ),
              ),
              Text('Column'),
              Expanded(
                child: FlatButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: updateWidget,
                  padding: EdgeInsets.all(0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getWidget() {
    if (_widgetType == WidgetType.row) {
      return Row(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        children: <Widget>[
          Icon(Icons.stars, size: 50),
          Icon(Icons.stars, size: 100),
          Icon(Icons.stars, size: 50)
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Icon(Icons.stars, size: 50),
          Icon(Icons.stars, size: 100),
          Icon(Icons.stars, size: 50)
        ],
      );
    }
  }
}
