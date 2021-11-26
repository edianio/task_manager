import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/controllers/task_controller.dart';
import 'package:my_tasks/models/task_app.dart';
import 'package:my_tasks/screens/home/components/home_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: (){

          Navigator.of(context).pushNamed('/add_task');

        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Consumer<TaskController>(
        builder: (_,taskController,__){
          List<TaskApp> filteredTasks = taskController.allTasks;

          if(filteredTasks.isEmpty){
            return Container();
          }

          return ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (_, index){

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: Row(
                    children: [

                      Expanded(
                        child: Column(
                          children: <Widget>[

                            AutoSizeText(
                              filteredTasks[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                                decoration: filteredTasks[index].isDone ? TextDecoration.lineThrough : null,
                              ),
                              maxLines: 2,
                              minFontSize: 13,
                              overflow: TextOverflow.ellipsis,
                            ),

                            AutoSizeText(
                              '${filteredTasks[index].description}',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                                decoration: filteredTasks[index].isDone ? TextDecoration.lineThrough : null,
                              ),
                              maxLines: 2,
                              minFontSize: 13,
                              overflow: TextOverflow.ellipsis,
                            ),

                            Text(
                              'Criado em: ${filteredTasks[index].createDate.toDate().day}/${filteredTasks[index].createDate.toDate().month}/${filteredTasks[index].createDate.toDate().year}',
                              style: const TextStyle(
                                fontSize: 11,
                              ),
                            ),

                            if(filteredTasks[index].isDone)
                              Text(
                                'Concluído em: ${filteredTasks[index].doneDate!.toDate().day}/${filteredTasks[index].doneDate!.toDate().month}/${filteredTasks[index].doneDate!.toDate().year}',
                                style: const TextStyle(
                                  fontSize: 11,
                                ),
                              ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[

                            Checkbox(
                                value: filteredTasks[index].isDone,
                                onChanged: (value){
                                  setState(() {
                                    filteredTasks[index].isDone = value!;
                                    filteredTasks[index].doneDate = Timestamp.now();
                                  });
                                  taskController.changeTaskDone(context, filteredTasks[index]);
                                }
                            ),

                            const SizedBox(height: 4,),

                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 32,
                              ),
                              onPressed: (){

                                showDialog(
                                    context: context,
                                    builder: (_){
                                      return AlertDialog(
                                        title: const Text('Excluir registro?'),
                                        content: const Text('Tem certeza que você quer EXCLUIR este registro?'),
                                        actions: <Widget>[

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                            child: IconButton(
                                                onPressed: (){

                                                  taskController.removeTask(
                                                      context,
                                                      filteredTasks[index].id!,
                                                      onSuccess: (){
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                              content: Text('Registro removido com sucesso!'),
                                                              backgroundColor: Colors.green,
                                                            )
                                                        );
                                                        Navigator.of(context).pop();
                                                      },
                                                      onFail: (error){
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              content: Text('Falha ao remover: $error'),
                                                              backgroundColor: Colors.red,
                                                            )
                                                        );
                                                      }
                                                  );

                                                },
                                                icon: const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.green,
                                                  size: 45,
                                                )
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                            child: IconButton(
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                },
                                                icon: const Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.red,
                                                  size: 45,
                                                )
                                            ),
                                          ),

                                        ],

                                      );
                                    }
                                );

                              },
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                );

              }
          );
        },
      ),
    );
  }
}
