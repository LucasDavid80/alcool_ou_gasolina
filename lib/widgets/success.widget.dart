import 'package:flutter/material.dart';

import 'loading-button.widget.dart';

// Widget reutilizável para exibir uma mensagem de sucesso
class Success extends StatelessWidget {
  // Resultado a ser exibido
  var result = "";
  // Função a ser chamada ao pressionar o botão "CALCULAR NOVAMENTE"
  Function reset;

  // Construtor do widget
  Success({
    super.key,
    required this.result,
    required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    // Retorna um contêiner contendo a mensagem de sucesso e um botão
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          // Exibe o resultado da operação (compensa utilizar gasolina ou álcool)
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          // Botão para calcular novamente, utilizando o widget LoadingButton
          LoadingButton(
            busy: false,
            func: reset,
            invert: true,
            text: "CALCULAR NOVAMENTE",
          ),
        ],
      ),
    );
  }
}
