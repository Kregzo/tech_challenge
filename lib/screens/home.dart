import 'package:calc_challenge/appState/cal_data.dart';
import 'package:calc_challenge/appState/calculator_view_modal.dart';
import 'package:calc_challenge/nav/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var calProvider = Provider.of<CalViewModal>(context);

    return Scaffold(
      appBar: CustomNav(),
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            return Container(
              height: size.height,
              color: Colors.grey,
              child: Wrap(
                children: [
                  Container(
                    width: size.width,
                    height: 150,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: calProvider.history
                                  .map((e) => Text(e))
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Text(calProvider.display),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: calData
                        .map(
                          (e) => CircularButton(
                            buttonLabel: e.toString(),
                            callbackFn: (() {
                              calProvider.checkInput('$e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Pressed $e')));
                            }),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: 250,
              height: 250,
              color: Colors.blue,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), primary: Colors.red),
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Text(
                    'I am a button',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                onPressed: () {},
              ),
            );
          }
        },
      ),
    );
  }
}

class CircularButton extends StatefulWidget {
  final String buttonLabel;
  final Function callbackFn;

  const CircularButton({this.buttonLabel, this.callbackFn});

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.green,
      ),
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Text(widget.buttonLabel),
      ),
      onPressed: widget.callbackFn,
    );
  }
}
