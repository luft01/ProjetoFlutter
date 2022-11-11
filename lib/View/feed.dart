import 'package:flutter/material.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final titleController = TextEditingController();
  String text = '';
  int i = 0;
  String textbank = '';
  bool status = false;
  List<String> listbank = ['a'];
  List<String> listbank2 = ['b'];
  String list = '';
  int count = 0;
  List<String> cardValues = [];
  List<String> lista = ['b'];

  void _setText() {
    setState(() {
      cardValues.clear();
      listbank = (context).read<Bank>().feedall();

      increment();
    });
  }

  void _getText() {
    text = titleController.text;
    (context).read<Bank>().fr(text);
    _setText();
    titleController.text = '';
  }

  void increment() => setState(() => cardValues.addAll(listbank));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(108, 239, 239, 241),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Feed'),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      /* Navigator.of(context).pushNamed('/login'); */
                      _setText();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.logout, color: Colors.black),
                    ),
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.blue[900],
              border: const Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 7, 7, 7), width: 3.0))),
          child: BottomNavigationBar(
              currentIndex: 0,
              backgroundColor: Colors.blue[900],
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.store, color: Colors.white),
                  label: "Home",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.local_mall, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Produtos",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Cart",
                ),
              ],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, "/home");
                    break;
                  case 1:
                    Navigator.of(context).pushNamed('/shoes');
                    break;
                  case 2:
                    Navigator.of(context).pushNamed('/cart');
                    break;
                }
              })),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              cardValues
                  .map((e) => Card(
                      color: Colors.blue[700],
                      child: SizedBox(height: 60, child: Text(' $e'))))
                  .toList(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Align(
              /* alignment: Alignment.bottomCenter, */
              child: Container(
                  margin: const EdgeInsets.all(10),
                  constraints:
                      const BoxConstraints.expand(height: 160, width: 250),
                  child: Column(children: [
                    status == true
                        ? TextField(
                            decoration: const InputDecoration(
                                labelText: 'Comment',
                                labelStyle: TextStyle(color: Colors.black)),
                            controller: titleController,
                          )
                        : const Text('Deseja Criar um Comentario?'),
                    Row(children: [
                      status == false
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue[900], // Background color
                              ),
                              onPressed: () => {
                                setState(() {
                                  status = !status;
                                })
                              },
                              child: const Text('Comentar'),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue[900], // Background color
                              ),
                              onPressed: () => {
                                _getText(),
                                setState(() {
                                  status = !status;
                                })
                              },
                              child: const Text('Add'),
                            ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900], // Background color
                        ),
                        onPressed: () => _setText(),
                        child: const Text('Atualizar'),
                      )
                    ])
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
