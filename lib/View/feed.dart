import 'package:flutter/material.dart';
import 'package:projeto_flutter/Controller/bank.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  void initState() {
    super.initState();
    /* list_bank = (context).read<Bank>().feedall(); */
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setText();
  }

  final titleController = TextEditingController();
  String text = '';
  int i = 0;
  String textbank = '';
  bool status = false;
  List<String> list_bank = ['a'];
  List<String> list_bank2 = ['b'];
  final List<String> _user = ['Anonimo'];
  String list = '';
  int count = 0;
  List<String> cardValues = [];
  List<String> lista = ['b'];

  void _setText() {
    setState(() {
      /* status = !status; */
      /* list_bank.clear(); */
      /* list_bank = (context).read<Bank>().feedall(); */
      cardValues.clear();
      list_bank = (context).read<Bank>().feedall();
      /* (context).read<Bank>().feedall();
      list_bank = (context).read<Bank>().feedall(); */
      increment();

      /* for (int i = 0; i < list_bank.length; i++) {
        if (list_bank2[i] == lista[i]) {
          print('iguais');
        } else {
          print('aqui ou');
          setState(() {
            list_bank.clear();
            list_bank = (context).read<Bank>().feedall();
            list_bank.add((context).read<Bank>().feedall().toString());
            lista = list_bank;
            increment();
          });
        }
        
      } */
      /* print(list_bank2); */
    });
  }

  void _getText() {
    text = titleController.text;
    (context).read<Bank>().fr(text);
    _setText();
    /* increment(); */
    titleController.text = '';
  }

  void increment() => setState(() => cardValues.addAll(list_bank));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(108, 239, 239, 241),
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
                  icon: Icon(Icons.person, color: Colors.white),
                  label: "Dados",
                  backgroundColor: Color.fromARGB(0, 255, 255, 255),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_basket, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Produtos",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home, color: Colors.white),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  label: "Home",
                ),
              ],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, "/product");
                    break;
                  case 1:
                    Navigator.of(context).pushNamed('/shoes');
                    break;
                  case 2:
                    Navigator.of(context).pushNamed('/home');
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
                      child: SizedBox(height: 60, child: Text(' ${e}'))))
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
