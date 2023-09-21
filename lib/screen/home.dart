import 'package:flutter/material.dart';
import 'package:flutter_api/model/user.dart';

import '../services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.phone),
          );
        },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
    ),
    );
  }

  Future<void> fetchUsers() async {
    final response =  await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
