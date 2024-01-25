import 'package:flutter/material.dart';

// Widget reutilizável para um botão que pode exibir um indicador de carregamento
class LoadingButton extends StatelessWidget {
  var busy = false; // Indica se o botão está em um estado ocupado (carregando)
  var invert = false; // Indica se as cores do botão devem ser invertidas
  Function func; // Função a ser chamada quando o botão é pressionado
  var text = ""; // Texto exibido no botão

  // Construtor do widget
  LoadingButton({
    super.key,
    required this.busy,
    required this.func,
    required this.invert,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // Retorna um widget diferente com base no estado do botão (ocupado ou não)
    return busy
        ? Container(
            // Widget exibido quando o botão está ocupado (carregando)
            alignment: Alignment.center,
            height: 50,
            child: const CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            // Widget exibido quando o botão não está ocupado
            margin: const EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              // Estilo do contêiner do botão
              color: invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: TextButton(
              // Botão pressionável
              onPressed: () {
                func(); // Chama a função associada ao botão
              },
              child: Text(
                text,
                style: TextStyle(
                  // Estilo do texto do botão
                  color: invert ? Colors.white : Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
          );
  }
}
