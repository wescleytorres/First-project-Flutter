import 'package:flutter/material.dart';

import '../components/switcher_Theme.dart';
import '../controllers/user_controller.dart';
import '../controllers/theme_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bglight = 'assets/img/background-light.jpg';
  String bgDark = 'assets/img/background-dark.png';

  Widget _body() {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Text(
                'Seja bem vindo,',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                  color: ThemeController.instance.isDarkTheme
                      ? Colors.white
                      : Colors.deepOrange,
                ),
              ),
              Text(
                '${UserController.user.name}',
                style: TextStyle(
                  color: ThemeController.instance.isDarkTheme
                      ? Colors.green
                      : Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipOval(
                  child: Image.network('https://github.com/wescleytorres.png'),
                ),
                accountName: Text(UserController.user.name),
                accountEmail: Text('wescleydev@dev.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              subtitle: Text('tela de inicio'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          CustomSwitcher(),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage(
                  ThemeController.instance.isDarkTheme ? bgDark : bglight),
              fit: BoxFit.cover,
            )),
          ),
          _body(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo_outlined),
        onPressed: () {},
      ),
    );
  }
}
