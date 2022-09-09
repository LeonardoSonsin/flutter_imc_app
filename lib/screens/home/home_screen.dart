import 'package:flutter/material.dart';
import 'package:flutter_imc_app/screens/home/controller/imc_calculator.dart';
import 'package:flutter_imc_app/screens/home/models/custom_table_row.dart';
import 'models/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  double imc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Peso (kg)', style: TextStyle(fontSize: 24)),
                    SizedBox(width: 20),
                    Text('Altura (m)', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                        child: CustomTextField(
                      controller: weightController,
                      hintText: 'Ex: 69.2',
                    )),
                    const SizedBox(width: 20),
                    Flexible(
                        child: CustomTextField(
                      controller: heightController,
                      hintText: 'Ex: 1.70',
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _customElevatedButton(),
              const SizedBox(height: 30),
              _resultText(),
              const SizedBox(height: 30),
              CustomTableRow(
                imc: imc,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _customElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(150, 30),
      ),
      onPressed: () {
        setState(() {
          imc = calculateIMC(weightController.text, heightController.text)!;
        });
      },
      child: const Text('CALCULAR'),
    );
  }

  Container _resultText() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey,
      ),
      child: Text(
        'SEU IMC:  ${imc.toStringAsPrecision(4)}',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
      ),
    );
  }
}
