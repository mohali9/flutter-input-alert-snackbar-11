import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Input Text, Alert, Snackbar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String teks = "";

  TextEditingController controllerInputText = TextEditingController();
  TextEditingController controllerAlert = TextEditingController();
  TextEditingController controllerSnackbar = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  void _snackbar(String str) {
    if (str.isEmpty) return;

    _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(
        str,
        style: TextStyle(fontSize: 20.0),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  void _alertdialog(String str) {
    if (str.isEmpty) return;
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        str,
        style: TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        RaisedButton(
          // color: Colors.orange,
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Input Text, Alert, Snackbar"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controllerInputText,
              decoration: InputDecoration(
                hintText: 'Ketik Disini',
              ),
              onSubmitted: (String str) {
                setState(() {
                  teks = str + '\n' + teks;
                  controllerInputText.text = "";
                });
              },
            ),
            Text(
              teks,
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
              controller: controllerAlert,
              decoration: InputDecoration(
                hintText: 'Tulis Untuk Alert...',
              ),
              onSubmitted: (String str) {
                _alertdialog(str);
                controllerAlert.text = "";
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
              controller: controllerSnackbar,
              decoration: InputDecoration(
                hintText: 'Text Snackbar...',
              ),
              onSubmitted: (String str) {
                _snackbar(str);
                controllerSnackbar.text = "";
              },
            ),
          ],
        ),
      ),
    );
  }
}
