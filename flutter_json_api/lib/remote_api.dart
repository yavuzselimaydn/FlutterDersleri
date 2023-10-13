import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_api/model/user_model.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({super.key});

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {

  late final Future<List<UserModel>> _userList;

  @override
  void initState() {
    super.initState();
    _userList = _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    _getUserList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remote Api with Dio"),
      ),
      body: FutureBuilder(
        future: _userList,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            var userList = snapshot.data!;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context,index) {
                var oankiEleman = userList[index]; 
                return ListTile(
                  title: Text("${oankiEleman.firstname} ${oankiEleman.lastname}"),
                  subtitle: Text(oankiEleman.address.toString()),
                  leading: CircleAvatar(child: Text(oankiEleman.id.toString())),
                );
              }
            );
          } 

          else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } 
          
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<UserModel>> _getUserList() async {
    try {
      var response = await Dio().get("https://jsonplaceholder.org/users"); //veriyi aldum

      List<UserModel> _userList = [];

      if (response.statusCode == 200) {                    // httpde veri geldinin kodu
        _userList = (response.data as List).map(           //localdeki gibi jsondecode yapmadum oylr geliyo cunku gerek yok
            (e) => UserModel.fromJson(e)
          ).toList();
      }

      return _userList;
    } on DioException catch (e) {
      return Future.error(e.message!);
    }
  }
}
