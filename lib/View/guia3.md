class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  /*  @override
  void initState() {
    (context).select((Bank b1) => b1.pg());
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  } */

  final String texto = Store.login;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            (context).select((AuthService au) => au.usuario.toString()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                /* Navigator.of(context).pushNamed('/register'); */
                context.read<AuthService>().logout();
              },
              child: const Icon(Icons.logout, color: Colors.black),
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: const Color.fromARGB(68, 180, 50, 152),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Dados",
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_basket),
              backgroundColor: Colors.white.withOpacity(0.1),
              label: "Produtos",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              backgroundColor: Colors.white.withOpacity(0.1),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.feed_sharp),
              backgroundColor: Colors.white.withOpacity(0.1),
              label: "Feed",
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, "/form",
                    arguments: {"nome": texto});
                break;
              case 1:
                Navigator.of(context).pushNamed('/list');
                break;
              case 2:
                Navigator.of(context).pushNamed('/home');
                break;
              case 3:
                Navigator.of(context).pushNamed('/feed');
                break;
            }
          }),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          /* crossAxisAlignment: CrossAxisAlignment.stretch, */
          children: [
            Text('Contador : $counter'),
            Container(
              /*apenas para afastar o Text do Custom*/
              height: 20,
            ),
            const CustomSwitch(),
            Container(
              /*apenas para afastar a coluna da linha(Custom dos quadrados*/
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          }),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Switch(
        value: AppController.instance.isLight,
        onChanged: (value) {
          AppController.instance.changeTheme();
        }));
  }
}
