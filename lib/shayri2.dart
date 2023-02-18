import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class shayari1 extends StatefulWidget {
  List k = [];
  int cur;

  shayari1(this.k, this.cur);

  @override
  State<shayari1> createState() => _shayari1State();
}

PageController? controller;
int curpage = 0;
@override
List mycol = [
  Colors.pink,
  Colors.red,
  Colors.blue,
  Colors.grey,
  Colors.cyan,
  Colors.amber,
  Colors.green,
  Colors.orange,
  Colors.tealAccent,
  Colors.indigo,
  Colors.yellow,
  Colors.grey,
  Colors.blueGrey,
  Colors.greenAccent,
  Colors.purple,
  Colors.purpleAccent,
  Colors.deepOrange,
];
bool tem = false;
bool tem1 = false;
double height = 10;
bool size = false;
int a = 0;
int b = 0;
int c=0;
int d=0;

class _shayari1State extends State<shayari1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curpage = widget.cur;
    controller = PageController(initialPage: curpage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("shayari", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Center(
              child: Container(
                height: 50,
                width: 150,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 50,
                      width: 50,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: GridView.builder(
                                    itemCount: mycol.length - 1,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            tem = true;
                                            a = index;
                                            b = index + 1;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            mycol[index],
                                            mycol[index + 1]
                                          ])),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.fullscreen,
                            color: Colors.amber,
                          )),
                    )),
                    Expanded(
                        child: Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text(
                          "${curpage + 1}/${widget.k.length}",
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      height: 50,
                      width: 50,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              tem = true;
                              a = Random().nextInt(17);
                              b = Random().nextInt(17);
                            });
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.amber,
                          )),
                    ))
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: double.infinity,
                child: PageView.builder(
                  controller: controller,
                  itemCount: widget.k.length,
                  onPageChanged: (val) {
                    setState(() {
                      curpage = val;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            color: (tem1 == false) ? Colors.white10 : mycol[a],
                            gradient: (tem == true)
                                ? LinearGradient(colors: [mycol[a], mycol[b]])
                                : null),
                        child: Center(
                          child: Text(
                            "${widget.k[curpage]}",
                            style: TextStyle(
                                fontSize: height,color: (size==true)?mycol[d]:Colors.white)
                          ),
                        ));
                  },
                ),
              ),
            ),
            Spacer(),
            Slider(
              activeColor: Colors.amber,
              max: 50,
              value: height,
              onChanged: (double value) {
                setState(() {
                  height = value;
                });
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
              color: Colors.black,
              height: 50,
              width: double.infinity,
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 50,
                      child: IconButton(
                          onPressed: () {
                            FlutterClipboard.copy("${widget.k[curpage]}")
                                .then((value) => print('copied'));
                          },
                          icon: Icon(Icons.copy, color: Colors.amber)),
                    )),
                    Expanded(
                        child: Container(
                      height: 50,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              curpage--;
                            });
                            controller!.jumpToPage(curpage);
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.amber)),
                    )),
                    Expanded(
                        child: Container(
                      height: 50,
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemCount: mycol.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        showDialog(context: context, builder: (context) {
                                          return AlertDialog(title: Text("ARE YOU WENT THIS COLOR IN BACKGROUND OR TEXT"),
                                          actions: [
                                            Row(children: [
                                              TextButton(onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {
                                                  size=true;
                                                  d=index;
                                                });
                                              }, child: Text("TEXT-COLOR")),
                                              TextButton(onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {
                                                  tem1=true;
                                                  a=index;
                                                });
                                              }, child: Text("BACKGROUND")),
                                            ],)
                                          ],
                                          );
                                        },);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: mycol[index]),
                                      ),
                                    );;
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit_sharp, color: Colors.amber)),
                    )),
                    Expanded(
                        child: Container(
                      height: 50,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              curpage++;
                            });
                            controller!.jumpToPage(curpage);
                          },
                          icon: Icon(Icons.arrow_forward, color: Colors.amber)),
                    )),
                    Expanded(
                      child: Container(
                          height: 50,
                          child: IconButton(
                              onPressed: () async {
                                await FlutterShare.share(
                                  title: 'Shayari shared',
                                  text: widget.k[curpage],
                                );
                              },
                              icon: Icon(
                                Icons.share,
                                color: Colors.amber,
                              ))),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
