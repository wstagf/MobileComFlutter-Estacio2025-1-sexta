import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController ctrl = TextEditingController();

  List<String> todoList = [];

  void addItem(String item) {
    setState(() {
      print(" clicou em adicionar");

      String textoDIGITADO = ctrl.text;
      if (textoDIGITADO.isNotEmpty) {
        todoList.add(item);
      }

      ctrl.clear();
    });
  }

  void removeItem(int index) {
    print(index);
    setState(() {
      todoList.removeAt(index);
    });
  }

  Future<void> salvarPersistencia() async {
    final prefs = await SharedPreferences.getInstance();
    var deucerto = await prefs.setString("abacate", jsonEncode(todoList));
    print(deucerto);
  }

  Future<void> obterPersistencia() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      String? listaCarregada = prefs.getString("abacate");
      if (listaCarregada != null) {
        List<String> listaConvertida =
            jsonDecode(listaCarregada).cast<String>();
        todoList = listaConvertida;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    obterPersistencia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Lista de tarefas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            TextFormField(
              controller: ctrl,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                addItem(ctrl.text);
              },
              child: const Text("Adicionar"),
            ),
            GestureDetector(
              onTap: () {
                salvarPersistencia();
              },
              child: const Text("Salvar Lista"),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(todoList[index]),
                        IconButton(
                          onPressed: () {
                            print(" Clicou em excluir");
                            removeItem(index);
                          },
                          icon: const Icon(
                            Icons.close,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
