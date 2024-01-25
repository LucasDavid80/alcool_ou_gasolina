import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// Widget reutilizável para entrada de dados
class Input extends StatelessWidget {
  // Propriedades do widget
  var label = ""; // Rótulo para identificar a entrada
  var ctrl =
      MaskedTextController(mask: '0,00'); // Controlador para a entrada de texto

  // Construtor do widget
  Input({
    super.key,
    required this.label,
    required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    // Retorna uma linha contendo o rótulo e um campo de entrada
    return Row(
      children: <Widget>[
        // Container para o rótulo
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: "Big Shoulders Display",
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        // Expanded para preencher o restante do espaço disponível
        Expanded(
          child: Container(
            // Estilo do campo de entrada
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0x55ffffff),
            ),
            // Campo de entrada de texto
            child: TextFormField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: "Big Shoulders Display",
              ),
              // Removendo a borda padrão do TextFormField
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
