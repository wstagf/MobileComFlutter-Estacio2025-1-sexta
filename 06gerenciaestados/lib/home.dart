import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idade = 17;

  fazerAniversario() {
    setState(() {
      idade = idade + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Minha idade 'e:"),
          Text(idade.toString()),
          GestureDetector(
            onTap: () {
              print("Minha idade era " + idade.toString());
              print("Fiz niver");
              fazerAniversario();
              print("Minha idade agora e " + idade.toString());
            },
            child: Text("Click Aqui"),
          )
        ],
      ),
    );
  }
}
