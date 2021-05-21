import 'package:dsi_app/view/word_pair_view.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  // inicializa o firebase
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DSIApp());
}

///Classe principal que representa o App.
class DSIApp extends StatelessWidget {
  ///Constrói o App e suas configurações.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSI App (BSI UFRPE)',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      initialRoute: HomePage.routeName,
      routes: _buildRoutes(context),
    );
  }

  ///Método utilizado para configurar as rotas.
  Map<String, WidgetBuilder> _buildRoutes(BuildContext context) {
    return {
      WordPairUpdatePage.routeName: (context) => WordPairUpdatePage(),
    };
  }
}
