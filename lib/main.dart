// Importando as dependências necessárias do Flutter
import 'package:aog/pages/home.page.dart';
import 'package:flutter/material.dart';

// Função principal que é executada ao iniciar o aplicativo
void main() {
  // Executando o aplicativo
  runApp(const MyApp());
}

// Classe principal do aplicativo, que herda de StatelessWidget
class MyApp extends StatelessWidget {
  // Construtor da classe
  const MyApp({super.key});

  // Método responsável por construir a interface do aplicativo
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que é a estrutura básica de um aplicativo Flutter
    return MaterialApp(
      // Título do aplicativo
      title: 'Álcool ou Gasolina',
      // Removendo o banner de debug no canto superior direito
      debugShowCheckedModeBanner: false,
      // Tema do aplicativo
      theme: ThemeData(
        // Cor primária do aplicativo
        primarySwatch: Colors.deepPurple,
      ),
      // Página inicial do aplicativo, neste caso, constante HomePage()
      home: const HomePage(),
    );
  }
}
