import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();

  String _resultado = ""; // Variável para armazenar o resultado da comparação

  // Função para calcular a melhor opção
  void calcularMelhorOpcao() {
    // Tenta converter os valores para double
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    // Verifica se os valores são válidos (não nulos e maiores que zero)
    if (precoAlcool == null || precoGasolina == null || precoAlcool <= 0 || precoGasolina <= 0) {
      setState(() {
        _resultado = "Número inválido. Digite um número maior que zero e com ponto (.)";
      });
      return; // Sai da função para evitar erros de cálculo
    }

    // Calcula a relação e determina a melhor opção
    double resultado = precoAlcool / precoGasolina;
    String melhorOpcao = resultado <= 0.7 ? "Álcool é mais vantajoso" : "Gasolina é mais vantajosa";

    setState(() {
      _resultado = melhorOpcao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 32)),
              Center(
                child: Image.asset("assets/carfuel.png"),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Saiba a melhor opção para abastecer seu carro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço álcool, ex: 3.45",
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço gasolina, ex: 4.99",
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(padding: EdgeInsets.only(top: 80)),
              ElevatedButton(
                onPressed: () {
                  calcularMelhorOpcao(); // Chama a função para calcular a melhor opção
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Calcular",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    _resultado, // Exibe o resultado ou a mensagem de erro
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _resultado.contains("inválido") ? Colors.red : Colors.black, // Condição para cor do texto
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
