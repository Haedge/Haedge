import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Logger App Demo 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sleep Logger Demo 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _inprogress = "START";
  DateTime _clock_start;
  DateTime _clock_ended;
  Duration _difference;
  int _starthour = 0;
  int _startmin = 0;
  int _endhour = 0;
  int _endmin = 0;
  int _diffmins = 0;
  int _diffsecs = 0;


  void _timeTracker() {
    setState(() {
      _clock_start = DateTime.now();
      _clock_ended = DateTime.now();
      if(_inprogress == "START"){
        _starthour = _clock_start.hour;
        _startmin = _clock_start.minute;
        _endmin = 0;
        _endhour = 0;
        _inprogress = "STOP";
      } else if(_inprogress == "STOP"){
        _endhour = _clock_ended.hour;
        _endmin = _clock_ended.minute;

        //Was not able to get this working in this Demo
        _difference = _clock_ended.difference(_clock_start);
        _diffmins = _difference.inMinutes;
        _diffsecs = _difference.inSeconds - _diffmins*60;
        _inprogress = "START";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Starting Time:',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '$_starthour' + ' : ' + '$_startmin',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Ending Time:',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '$_endhour' + ' : ' + '$_endmin',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Duration of Sleep:',
                style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Was not able to get this to work in this Demo',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _timeTracker,
        tooltip: 'Increment',
        child: Text(
          '$_inprogress',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
