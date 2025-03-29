import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatelessWidget {
  const HomePage({ super.key });

  void carregarDados()  assync {
    var response = await http.get(url);
    print(" aaa")
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF2DBD3A));
  }
}