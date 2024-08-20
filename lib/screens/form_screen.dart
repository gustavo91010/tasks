import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dificultController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  String opa = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Nova tarefa!'),
        ),
      ),
      body: Center(
        child: Container(
          height: 650,
          width: 375,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 3),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome', // o tipo do form fica por traz
                    fillColor: Colors
                        .white54, // a cor do formulario quando o filled for true
                    filled: true, // indica de ele esta preencigo ou não
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: dificultController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Dificuldade', // o tipo do form fica por traz
                    fillColor: Colors
                        .white54, // a cor do formulario quando o filled for true
                    filled: true, // indica de ele esta preencigo ou não
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: imageController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Imagen', // o tipo do form fica por traz
                    fillColor: Colors
                        .white54, // a cor do formulario quando o filled for true
                    filled: true, // indica de ele esta preencigo ou não
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  opa = nameController.text;
                  opa += dificultController.text;
                  opa += imageController.text;

                  if (opa.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Opa: $opa'),
                      duration: const Duration(seconds: 3),
                    ));
                  }
                },
                child: const Text('Adicionar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
