import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../services/service.dart';
class DataController extends GetxController{
  List<dynamic> _myData=[];
  List<dynamic> get myData=>_myData;
  DataService service = DataService();
  bool _isLoading = false;
  bool _isDeleting = false;
  bool get isLoading=>_isLoading;
  bool get isDeleting=>_isDeleting;
  set setDeleting(bool val){
    _isDeleting=val;
    update();
  }
  Future<void> getData()async {
    _isLoading=true;

    Response response = await service.getData() ;
    if(response.statusCode==200){
      _myData=response.body;
      print("code is correct");
    }
    print("The data length is "+_myData.length.toString());
    _isLoading=false;
    update();
  }

  Future<void> postData(String task, String taskDetail)async {
      Response response = await service.postData({"task":task, "task_detail":taskDetail, "data":DateTime.now().toString()});
      if(response.statusCode==200){
        _myData=_myData;
        update();
      }else{
        if (kDebugMode) {
          print("Post request failed");
        }
      }
  }
  Future<void> updateData(int id, String task, String taskDetail)async {
    Response response = await service.updateData(id, {"task":task, "task_detail":taskDetail});
    if(response.statusCode==200){

      //_myData.removeWhere((element) => element["id"]==id.toString());
      print("update succssfull");

      update();
    }else{
      if (kDebugMode) {
        print("not success" +response.body.toString());
      }
    }
  }

  Future<void> deleteData(int id)async {
    Response response = await service.deleteData(id);
    if(response.statusCode==200){

      _myData.removeWhere((element) => element["id"]==id.toString());

    update();
    }else{
      if (kDebugMode) {
        print(response.body.toString());
      }
    }
  }

}