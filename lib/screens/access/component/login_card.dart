import 'package:flutter/material.dart';
import 'package:my_tasks/controllers/user_controller.dart';
import 'package:my_tasks/helpers/validators.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatefulWidget {
  LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<UserController>(
            builder: (_, userController, __){
              return Column(
                children: <Widget>[

                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'seunome@email.com',
                      labelText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Campo Obrigatório';
                      }else if(!emailValid(value)){
                        return 'E-mail inválido';
                      }else{
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 10,),

                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                    obscureText: true,
                    autocorrect: false,
                    validator: (value){
                      if(value == null || value.length < 6) {
                        return 'Preencha corretamente!';
                      }else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 10,),

                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          userController.signIn(
                              name: emailController.text,
                              password: passwordController.text,
                              onFail: (error){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Falha ao entrar: $error'),
                                      backgroundColor: Colors.red,
                                    )
                                );
                              },
                              onSuccess: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Login feito com sucessor!'),
                                      backgroundColor: Colors.green,
                                    )
                                );
                              }
                          );
                        }
                      },
                      child: userController.loading
                          ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                          : const Text('Entrar'),
                    ),
                  ),

                  //const SizedBox(height: 10,),

                  // FractionallySizedBox(
                  //   widthFactor: 1,
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //       // if(formKey.currentState!.validate()){
                  //       //   userController.signInWithGoogle();
                  //       // }
                  //       userController.signInGoogle(
                  //         onSuccess: (){
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //               const SnackBar(
                  //                 content: Text('Login feito com sucessor!'),
                  //                 backgroundColor: Colors.green,
                  //               )
                  //           );
                  //         },
                  //         onFail: (error){
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text('Falha ao entrar: $error'),
                  //                 backgroundColor: Colors.red,
                  //               )
                  //           );
                  //         },
                  //       );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       onPrimary: Colors.deepPurple,
                  //       primary: Colors.white70,
                  //     ),
                  //     child: userController.loading
                  //         ? const CircularProgressIndicator(
                  //       valueColor: AlwaysStoppedAnimation(Colors.white),
                  //     )
                  //         : Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         const Text('Entrar pelo '),
                  //         Image.asset(
                  //           'assets/images/logo_google.png',
                  //           height: 30,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 10,),

                  GestureDetector(
                    onTap: userController.loading ? (){} : (){
                      if(emailController.text.isNotEmpty){
                        userController.resetPasswordByEmail(emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enviamos um email para recuperação de acesso!\nPor favor, verifique seu email e siga as instruções para ter acesso novamente.'),
                            duration: Duration(seconds: 10),
                            backgroundColor: Colors.deepPurple,
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Informe o seu email!'),
                            backgroundColor: Colors.deepPurple,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
