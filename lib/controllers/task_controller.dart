import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_tasks/controllers/user_controller.dart';
import 'package:my_tasks/models/task_app.dart';
import 'package:provider/provider.dart';

class TaskController extends ChangeNotifier{
  List<TaskApp> allTasks = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  TaskController.withContext(BuildContext context){
    _loadAllTasks(context);
  }

  void _organizeRegisters(){
    if(allTasks.length > 1){
      allTasks.sort((a,b) => a.createDate.compareTo(b.createDate));

      allTasks.sort((a,b) {
        if(a.isDone){
          return 1;
        }else{
          return -1;
        }
      });
    }
  }

  Future<void> _loadAllTasks(BuildContext context) async {
    loading = true;

    final String? userId = context.read<UserController>().userApp?.id;

    final QuerySnapshot<Map<String, dynamic>> snap = await firestore.collection('users')
        .doc(userId)
        .collection('tasks')
        .get();

    if(allTasks.isNotEmpty){
      allTasks.removeRange(0, allTasks.length);
    }

    allTasks = snap.docs.map((e) => TaskApp.fromDocument(e)).toList();

    _organizeRegisters();

    notifyListeners();
    loading = false;
  }

  Future<void> saveTask(BuildContext context, TaskApp task, {required Function onSuccess, required Function onFail}) async {
    loading = true;

    if(task.description!.isEmpty){
      task.description = null;
    }
    if(task.isDone){
      task.doneDate = null;
    }

    try{
      final String? userId = context.read<UserController>().userApp?.id;

      final CollectionReference collectionPath = firestore.collection('users')
          .doc(userId)
          .collection('tasks');

      if(task.id == null){
        task.id = collectionPath.doc().id;
        await collectionPath.doc(task.id).set(task.toMap());
      }else{
        await collectionPath.doc(task.id).update(task.toMap());
      }

      allTasks.removeWhere((e) => e.id == task.id);

      allTasks.insert(0, task);

      _organizeRegisters();

      onSuccess();
    }catch(e){
      onFail(e);
    }

    notifyListeners();
    loading = false;
  }

  Future<void> removeTask(BuildContext context, String id, {required Function onSuccess, required Function onFail}) async {
    loading = true;

    try{
      final String? userId = context.read<UserController>().userApp?.id;

      final CollectionReference collectionPath = firestore.collection('users')
          .doc(userId)
          .collection('tasks');

      await collectionPath.doc(id).delete();

      allTasks.removeWhere((e) => e.id == id);

      onSuccess();
    }catch(e){
      onFail(e);
    }

    notifyListeners();
    loading = false;
  }

  Future<void> changeTaskDone(BuildContext context, TaskApp task) async {
    loading = true;

    try{
      final String? userId = context.read<UserController>().userApp?.id;

      final CollectionReference collectionPath = firestore.collection('users')
          .doc(userId)
          .collection('tasks');

      await collectionPath.doc(task.id).update({
        'isDone': task.isDone,
        'doneDate': task.isDone ? Timestamp.now() : null
      });

    }catch(e){
      debugPrint('deu erro $e');
    }

    _organizeRegisters();

    notifyListeners();
    loading = false;
  }

}