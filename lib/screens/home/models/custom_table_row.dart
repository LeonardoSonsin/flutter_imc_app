import 'package:flutter/material.dart';

class CustomTableRow extends StatefulWidget {
  final double imc;

  const CustomTableRow({Key? key, required this.imc}) : super(key: key);

  @override
  State<CustomTableRow> createState() => _CustomTableRowState();
}

class _CustomTableRowState extends State<CustomTableRow> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        _customDataColumn('IMC'),
        _customDataColumn('SITUAÇÃO'),
      ],
      rows: [
        DataRow(
          color: MaterialStateColor.resolveWith((states) =>
              widget.imc > 0 && widget.imc < 18.5
                  ? Colors.blueGrey
                  : Colors.white),
          cells: [
            _customDataCell('Menor que 18,5'),
            _customDataCell('Magreza'),
          ],
        ),
        DataRow(
          color: MaterialStateColor.resolveWith((states) =>
              widget.imc >= 18.5 && widget.imc < 25
                  ? Colors.blueGrey
                  : Colors.white),
          cells: [
            _customDataCell('Entre 18,5 e 24,9'),
            _customDataCell('Normal'),
          ],
        ),
        DataRow(
          color: MaterialStateColor.resolveWith((states) =>
              widget.imc >= 25 && widget.imc < 30
                  ? Colors.blueGrey
                  : Colors.white),
          cells: [
            _customDataCell('Entre 25,0 e 29,9'),
            _customDataCell('Sobrepeso'),
          ],
        ),
        DataRow(
          color: MaterialStateColor.resolveWith((states) =>
              widget.imc > 30 && widget.imc < 40
                  ? Colors.blueGrey
                  : Colors.white),
          cells: [
            _customDataCell('Entre 30,0 e 39,9'),
            _customDataCell('Obesidade'),
          ],
        ),
        DataRow(
          color: MaterialStateColor.resolveWith(
              (states) => widget.imc > 40 ? Colors.blueGrey : Colors.white),
          cells: [
            _customDataCell('Maior que 40,0'),
            _customDataCell('Obesidade Grave'),
          ],
        ),
      ],
    );
  }

  DataColumn _customDataColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(
          color: Colors.blue[800],
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  DataCell _customDataCell(String text) {
    return DataCell(
      Text(
        text,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 16,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
