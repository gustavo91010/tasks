//class Task extends StatelessWidget {
import 'package:alura_01/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  final String urlImage;
  final int dificuldade;
  const Task(this.name, this.urlImage, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              height: 140), // container do fundo azul
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                // container branco menor que tem a linha com os 3 elememntos
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //elemento 1: A caixa cinza
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            //elemento 2: O texto
                            width: 200,
                            child: Text(widget.name,
                                style: const TextStyle(fontSize: 24),
                                overflow: TextOverflow.ellipsis)),
                        Difficulty(dificuldade: widget.dificuldade),
                      ],
                    ),
                    Visibility(
                        visible: nivel < (widget.dificuldade * 10),
                        child: SizedBox(
                          // para delimitar o tamanho do botao, tice que por em um container e limitar altura e largura
                          height: 65,
                          width: 65,
      
                          child: ElevatedButton(
                              // elemento 3: botão
      
                              onPressed: () {
                                setState(() {
                                  nivel++;
                                });
                                // ignore: avoid_print
                                print(nivel);
                              },
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_drop_up),
                                  Text(
                                    'UP',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // linha com o nivel
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.red,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        )),
                    Text('Nivel: $nivel',
                        style: const TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
