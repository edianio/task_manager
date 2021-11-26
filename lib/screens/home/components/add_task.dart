import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/controllers/task_controller.dart';
import 'package:my_tasks/models/task_app.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TaskController taskController = context.watch<TaskController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[

                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Título da tarefa',
                      labelText: 'Título',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                    autocorrect: true,
                    validator: (value){
                      if(value == null) {
                        return 'Preencha corretamente!';
                      }else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(height: 10,),

                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Descrição da tarefa(Opcional)',
                      labelText: 'Descrição',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 16),
                    autocorrect: true,
                  ),

                  const SizedBox(height: 10,),

                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){

                          TaskApp task = TaskApp(
                            title: titleController.text,
                            description: descriptionController.text,
                            createDate: Timestamp.now(),
                            isDone: false,
                          );

                          taskController.saveTask(
                            context,
                            task,
                            onSuccess: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registro salvo com sucesso!'),
                                    backgroundColor: Colors.green,
                                  )
                              );
                              Navigator.of(context).pop();
                            },
                            onFail: (error){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Falha ao salvar: $error'),
                                    backgroundColor: Colors.red,
                                  )
                              );
                            },
                          );
                        }
                      },
                      child: taskController.loading
                          ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                          : const Text('Salvar'),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
