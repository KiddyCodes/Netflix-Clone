import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Future getData() async {
      final firestore = Firestore.instance;
      QuerySnapshot snapshot =
          await firestore.collection('popular').getDocuments();
      return snapshot.documents;
    }

    Future getAnimated() async {
      final firestore = Firestore.instance;
      QuerySnapshot snapshot =
          await firestore.collection('animated').getDocuments();
      return snapshot.documents;
    }

    Future getOriginals() async {
      final firestore = Firestore.instance;
      QuerySnapshot snapshot =
          await firestore.collection('originals').getDocuments();
      return snapshot.documents;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: Image.asset('icons/netflix.png', scale: 20.0),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('TV Shows',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Movies',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('My List',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 250.0,
              child: Image.asset('images/bg.jpg'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: null,
                    child: Column(
                      children: <Widget>[
                        Image.asset('images/add.png',
                            scale: 22.0, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'My List',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          'images/play.png',
                          scale: 22.0,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Play',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        )),
                  ),
                  MaterialButton(
                    onPressed: null,
                    child: Column(
                      children: <Widget>[
                        Image.asset('images/info.png',
                            scale: 22.0, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Info',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 100.0),
                    child: Text('Continue Watching for Abhishvek',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 100.0,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 150.0,
                                  width: 150.0,
                                  child: Image.asset('images/p5.jpg'),
                                ),
                                LinearProgressIndicator(value: 50.0),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: null,
                                        icon: Image.asset(
                                          'images/info.png',
                                          scale: 22.0,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: null,
                                        icon: Image.asset(
                                          'images/menu.png',
                                          scale: 22.0,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 100.0,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 150.0,
                                  width: 150.0,
                                  child: Image.asset('images/p3.jpg'),
                                ),
                                LinearProgressIndicator(value: 50.0),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: null,
                                        icon: Image.asset(
                                          'images/info.png',
                                          scale: 22.0,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: null,
                                        icon: Image.asset(
                                          'images/menu.png',
                                          scale: 22.0,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 240.0),
                    child: Text('Popular on Netflix',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170.0,
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset('animations/loading.json');
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: Image.network(
                                          snapshot.data[index].data['image']),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 300.0),
                    child: Text('Animated',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170.0,
                    child: FutureBuilder(
                      future: getAnimated(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset('animations/loading.json');
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: Image.network(
                                          snapshot.data[index].data['image']),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 240.0),
                    child: Text('Netflix Originals',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170.0,
                    child: FutureBuilder(
                      future: getOriginals(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset('animations/loading.json');
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: Image.network(
                                          snapshot.data[index].data['image']),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 350.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 170.0),
                    child: Text('Available Now : Season 2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                        height: 250.0,
                        width: 400.0,
                        child: Image.asset(
                          'images/bg1.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: FlatButton.icon(
                              onPressed: null,
                              icon: Image.asset(
                                'images/play.png',
                                color: Colors.black,
                                scale: 22.0,
                              ),
                              label: Text('Play',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0))),
                        ),
                        Container(
                          child: FlatButton.icon(
                              onPressed: null,
                              icon: Image.asset(
                                'images/add.png',
                                color: Colors.white,
                                scale: 22.0,
                              ),
                              label: Text('My List',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
