import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_tasks/controllers/task_controller.dart';
import 'package:my_tasks/models/task_app.dart';
import 'package:provider/provider.dart';

class HomeTile extends StatefulWidget {
  HomeTile(this.task, {Key? key}) : super(key: key);

  late TaskApp task;

  @override
  State<HomeTile> createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        children: <Widget>[

          Expanded(
            child: Column(
              children: <Widget>[

                AutoSizeText(
                  widget.task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    decoration: widget.task.isDone ? TextDecoration.lineThrough : null,
                  ),
                  maxLines: 2,
                  minFontSize: 13,
                  overflow: TextOverflow.ellipsis,
                ),

                AutoSizeText(
                  '${widget.task.description}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    decoration: widget.task.isDone ? TextDecoration.lineThrough : null,
                  ),
                  maxLines: 2,
                  minFontSize: 13,
                  overflow: TextOverflow.ellipsis,
                ),

                Text(
                  'Criado em: ${widget.task.createDate.toDate().day}/${widget.task.createDate.toDate().month}/${widget.task.createDate.toDate().year}',
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),

                if(widget.task.isDone)
                  Text(
                    'Concluído em: ${widget.task.doneDate!.toDate().day}/${widget.task.doneDate!.toDate().month}/${widget.task.doneDate!.toDate().year}',
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
                  value: widget.task.isDone,
                  onChanged: (value){
                    setState(() {
                      widget.task.isDone = value!;
                      widget.task.doneDate = Timestamp.now();
                    });
                    context.read<TaskController>().changeTaskDone(context, widget.task);
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

                                      context.read<TaskController>().removeTask(
                                          context,
                                          widget.task.id!,
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
      )
    );
  }
}
