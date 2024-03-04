


import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {

  // creating instance of FlutterSecureStorage
  final storage =  const FlutterSecureStorage();


  Future<bool> setValue(String keys, String values)async{
    storage.write( key: keys , value:values);
    return true ;
  }

  Future<dynamic> readValue(String keys)async{
    return storage.read( key: keys , ) ;
  }

  Future<bool> clearValue(String key)async{
    storage.delete(key: key);
    return true;
  }

}