import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
 List<String> tarefas = [
  "Estudar",
  "Lavar o carro",
 ];
 
 String novaTarefa = "";

void addTarefa (){ 
  setState(() {
    if(novaTarefa != ""){
      tarefas.add(novaTarefa);
    };
    
  });
  }

  void removeTarefa(String tarefa){
    setState(() {
      tarefas.remove(tarefa);
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text("Tarefas"),
      ),

body: Padding(
  padding: const EdgeInsets.all(20),
  child: ListView(   
    children: [
      ...tarefas.map((tarefa)=>
       GestureDetector(
        onTap: (){
          removeTarefa(tarefa);
        },
         child: Card
         (child: Container(
          padding: EdgeInsets.all(10),
          child: Text(tarefa,
          style: TextStyle(
            fontSize:15,          
          ),)
          )
          ),
       ))
      
    ],
  ),
),

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.blueAccent,
        child: Padding(
          
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  onChanged: (valor){
                    novaTarefa = valor;
                  },
                  decoration: InputDecoration(
                    label: Text("tarefas"),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                )),


              GestureDetector(
                onTap: () {
                  addTarefa();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: const Color.fromARGB(255, 39, 94, 214),
                  child: Icon(Icons.arrow_right_sharp),
                ),
              )


            ],
          ),
        ),
      ),
      
    );
  }
}