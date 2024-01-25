import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// Página principal que gerencia o estado do aplicativo
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis de estado
  Color _color = Colors.deepPurple;
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";
  var _gasCtrl = MaskedTextController(mask: '0,00');
  var _alcCtrl = MaskedTextController(mask: '0,00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Configuração do plano de fundo da tela
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        // Animação da mudança de cor de fundo
        duration: const Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            // Exibição do logotipo
            const Logo(),
            // Condicionalmente exibe o formulário de entrada ou a mensagem de sucesso
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcCtrl: _alcCtrl,
                    gasCtrl: _gasCtrl,
                    busy: _busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  // SnackBar a ser exibido quando os campos estão vazios
  final snackBar = const SnackBar(
    content: Text('Os campos não podem estar vazios'),
  );

  // Função assíncrona para realizar o cálculo
  Future calculate() {
    // Verifica se os campos estão vazios e exibe o SnackBar se necessário
    if (_alcCtrl.text.isEmpty || _gasCtrl.text.isEmpty) {
      return Future.delayed(
        const Duration(seconds: 0),
        () => {
          ScaffoldMessenger.of(context).showSnackBar(snackBar),
        },
      );
    } else {
      // Converte os valores dos controladores para números
      double alc =
          double.parse(_alcCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
      double gas =
          double.parse(_gasCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
      double res = alc / gas;

      // Atualiza o estado para refletir o início do cálculo
      setState(() {
        _color = Colors.deepPurpleAccent;
        _completed = false;
        _busy = true;
      });

      // Aguarda um segundo antes de atualizar o estado com o resultado do cálculo
      return Future.delayed(
          const Duration(seconds: 1),
          () => {
                setState(() {
                  if (res >= 0.7) {
                    _resultText = "Compensa utilizar Gasolina!";
                  } else {
                    _resultText = "Compensa utilizar Álcool!";
                  }

                  _busy = false;
                  _completed = true;
                })
              });
    }
  }

  // Função para redefinir o estado e permitir um novo cálculo
  reset() {
    setState(() {
      _color = Colors.deepPurple;
      _alcCtrl = MaskedTextController(mask: '0,00');
      _gasCtrl = MaskedTextController(mask: '0,00');
      _completed = false;
      _busy = false;
    });
  }
}
