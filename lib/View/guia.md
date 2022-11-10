SliverList(
                delegate: SliverChildListDelegate(
                  nike
                      .map(
                        (nikes) => Row(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 35, bottom: 30, top: 10),
                              child: Container(
                                width: 145,
                                height: 162,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 104, 101, 101)
                                        .withOpacity(0.2),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.4)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(children: [
                                  Container(
                                    width: 140,
                                    height: 155,
                                    child: RotationTransition(
                                      turns: AlwaysStoppedAnimation(20 / 360),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        /*  child: Image.network(
                                  'https://sneakerbardetroit.com/wp-content/uploads/2020/06/Nike-Air-Force-1-Low-White-University-Red-CK7663-102-Release-Date.png'), */
                                      ),
                                    ),
                                  ),
                                ]),
                              )),
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Column(
                                    children: [
                                      Text(nikes,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22)),
                                      Text(nikes,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22)),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black),
                                        child: TextButton(
                                          onPressed: () => {},
                                          style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Color.fromARGB(
                                                255, 255, 255, 255),
                                            elevation: 5,
                                            /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), */
                                          ),
                                          child: Row(children: [
                                            const Icon(
                                              Icons.info,
                                              size: 15.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text('More Info',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  )),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ],
                                  )))
                        ]),
                      )
                      .toList(),
                ),
              ),