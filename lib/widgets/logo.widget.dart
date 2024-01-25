import 'package:flutter/material.dart';

// Widget reutilizável para exibir o logotipo e o título do aplicativo
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna uma coluna contendo o logotipo e o título
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 60,
        ),
        // Exibição do logotipo usando uma imagem do projeto
        Image.asset(
          "assets/images/aog-white.png",
          height: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        // Exibição do título do aplicativo
        const Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Big Shoulders Display",
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
