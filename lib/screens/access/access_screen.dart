import 'package:flutter/material.dart';
import 'package:my_tasks/screens/access/component/login_card.dart';
import 'package:my_tasks/screens/access/component/signup_card.dart';

class AccessScreen extends StatefulWidget {
  AccessScreen({Key? key}) : super(key: key);

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  bool newUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acesso'),
        actions: <Widget>[

          FractionallySizedBox(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    newUser = !newUser;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(!newUser ? 'CRIAR CONTA' : 'ENTRAR'),
                ),
              ),
            ),
          ),

        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: newUser ? SignupCard() : LoginCard(),
        ),
      ),
    );
  }
}
