import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isNotVisible = true;
  String name = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Login', border: OutlineInputBorder()),
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: isNotVisible,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isNotVisible = !isNotVisible;
                                });
                              },
                              icon: Icon(isNotVisible
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded),
                            )),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (name == 'wescleytorres' &&
                                password == '123456') {
                              UserController.user.changeUser(name);
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            } else {
                              print('ola2');
                            }
                          },
                          child: Center(
                            child: Container(
                              child: Text('Entrar'),
                            ),
                          )),
                    ],
                  ),
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
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('assets/img/backgroundLogin.jpg'),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          color: Colors.black.withOpacity(0.2),
        ),
        _body(),
      ],
    ));
  }
}
