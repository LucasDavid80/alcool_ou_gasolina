import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'input.widget.dart';
import 'loading-button.widget.dart';

// Widget reutilizável para o formulário de entrada e botão de cálculo
class SubmitForm extends StatelessWidget {
  // Controladores de texto para os campos de gasolina e álcool
  var gasCtrl = MaskedTextController(mask: '0,00');
  var alcCtrl = MaskedTextController(mask: '0,00');
  var busy = false; // Indica se o botão está ocupado (carregando)
  Function submitFunc; // Função a ser chamada quando o botão é pressionado

  // Construtor do widget
  SubmitForm({
    super.key,
    required this.gasCtrl,
    required this.alcCtrl,
    required this.busy,
    required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    // Retorna uma coluna contendo os campos de entrada e o botão de cálculo
    return Column(
      children: <Widget>[
        // Campo de entrada para o preço da gasolina
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            // Utiliza o widget Input para a entrada de gasolina
            child: Input(
              label: "Gasolina",
              ctrl: gasCtrl,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // Campo de entrada para o preço do álcool
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            // Utiliza o widget Input para a entrada de álcool
            child: Input(
              label: "Álcool",
              ctrl: alcCtrl,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        // Botão de cálculo, utilizando o widget LoadingButton
        LoadingButton(
          busy: busy,
          func: submitFunc,
          invert: false,
          text: "CALCULAR",
        ),
      ],
    );
  }
}
