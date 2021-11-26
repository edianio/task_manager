import 'package:flutter/material.dart';
import 'package:my_tasks/controllers/user_controller.dart';
import 'package:my_tasks/helpers/validators.dart';
import 'package:my_tasks/models/user_app.dart';
import 'package:provider/provider.dart';

class SignupCard extends StatefulWidget {
  SignupCard({Key? key}) : super(key: key);

  @override
  State<SignupCard> createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UserApp userApp = UserApp(name: '', email: '');

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

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
          child: Consumer<UserController>(
              builder: (_, userController, __){
                return ListView(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  children: <Widget>[
                    // Center(
                    //   child: Image.asset(
                    //     'assets/imgs/icon_pizza.png',
                    //     width: 90,
                    //   ),
                    // ),
                    // const SizedBox(height: 5,),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        //isDense: true,
                        labelText: 'Nome',
                        hintText: 'Nome',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                      enabled: !userController.loading,
                      validator: (name){
                        if(name == null || name.isEmpty){
                          return 'Campo Obrigatório';
                        }else if(name.trim().split(' ').length <= 1){
                          return 'Preencha seu nome completo!';
                        }else{
                          return null;
                        }
                      },
                      onSaved: (value) => userApp.name = value!,
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        //isDense: true,
                        labelText: 'E-mail',
                        hintText: '@email',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                      enabled: !userController.loading,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(email == null || email.isEmpty){
                          return 'Campo Obrigatório';
                        }else if(!emailValid(email)){
                          return 'E-mail inválido';
                        }else{
                          return null;
                        }
                      },
                      onSaved: (value) => userApp.email = value!,
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        //isDense: true,
                        labelText: 'Senha',
                        hintText: 'senha',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                      enabled: !userController.loading,
                      obscureText: true,
                      validator: (pass){
                        if(pass == null || pass.isEmpty){
                          return 'Campo Obrigatório';
                        }else if(pass.length < 6){
                          return 'Senha muito curta!';
                        }else{
                          return null;
                        }
                      },
                      onSaved: (value) => userApp.password = value!,
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: rePasswordController,
                      decoration: const InputDecoration(
                        //isDense: true,
                        labelText: 'Repita a senha',
                        hintText: 'senha',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                      enabled: !userController.loading,
                      obscureText: true,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Campo Obrigatório';
                        }else if(value.length < 6){
                          return 'Senha muito curta!';
                        }else{
                          return null;
                        }
                      },
                      onSaved: (value) => userApp.confirmPassword = value!,
                    ),

                    const SizedBox(height: 10,),

                    FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        onPressed: userController.loading ? null : (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();

                            if(userApp.password != userApp.confirmPassword){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('As senhas estão diferentes'),
                                    backgroundColor: Colors.red,
                                  )
                              );
                            }else{
                              userController.signUp(
                                  userApp: userApp,
                                  onSuccess: (){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Login feito com sucessor!'),
                                          backgroundColor: Colors.green,
                                        )
                                    );
                                  },
                                  onFail: (e){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Falha ao cadastrar: $e'),
                                          backgroundColor: Colors.red,
                                        )
                                    );
                                  }
                              );
                            }

                          }
                        },
                        child: userController.loading
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                            : const Text('Criar conta'),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    // FractionallySizedBox(
                    //   widthFactor: 1,
                    //   child: ElevatedButton(
                    //     onPressed: (){
                    //       // if(formKey.currentState!.validate()){
                    //       //   userController.signInWithGoogle();
                    //       // }
                    //       userController.signUpGoogle(
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

                  ],
                );
              }
          )
      ),
    );
  }
}
