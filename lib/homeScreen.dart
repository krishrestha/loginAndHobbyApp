import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController getData = TextEditingController();
  final hello = <String>['namaste'];

  void addHobby(){
    hello.add(getData.text);
    print('$hello');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome ${widget.username}',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (BuildContext context){
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: getData,
                        decoration: InputDecoration(
                          label: Text('enter text'),
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        addHobby();
                        getData.text = "";
                      }, child: Text('press'))
                    ],
                  ),
                ),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child:
        ListView.builder(
          itemCount: hello.length,
          prototypeItem: ListTile(
            title: Text(hello.first),
          ),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(hello[index]),
                ),
              );
            },
        ),
      ),
    );
  }
}
