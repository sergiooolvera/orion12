import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class PdfView extends StatefulWidget {
  PdfView({Key key}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  bool isLoading = true;
  List<String> _locations = [
    'DE NOMINA',
    'DE GASTOS',
  ]; // Option 2
  List<String> _anio = [
    '2018',
    '2019',
  ]; //
  List<String> _mes = [
    'ENERO     ',
    'FEBRERO   ',
    'MARZO     ',
    'ABRIL     ',
    'MAYO      ',
    'JUNIO     ',
    'JULIO     ',
    'AGOSTO    ',
    'SEPTIEMBRE',
    'OCTUBRE   ',
    'NOVIEMBRE ',
    'DICIEMBRE ',

  ]; 
  String _selectedLocation; // Option 2
   String _selectedAnio; // Option 2
    String _selectedMes; // Option 2
  PDFDocument document;
  _loadPDF() async {
    print(_selectedLocation);
    if (_selectedLocation == "DE NOMINA")
      document = await PDFDocument.fromURL(
          'http://www.sergiooolvera.somee.com/soome/pdf/uno.pdf');
    else
      document = await PDFDocument.fromURL(
          'http://www.sergiooolvera.somee.com/soome/pdf/dos.pdf');

    setState(() {
      isLoading = false;
    });
  }
  
  _quitar()  {
    document = null;  

    setState(() {
      isLoading = true;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
       
      ),
      body: Center(
          child: isLoading
              ? Center(
                  child: Column(
                    children: <Widget>[
                        Divider(
                        color: Colors.transparent,
                      ),
                      DropdownButton(
                        elevation: 10,
                        icon: Icon(Icons.filter_list),
                       
                        hint: Text(
                            'Escoja Año'), // Not necessary for Option 1
                        value: _selectedAnio,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedAnio = newValue;
                          });
                        },
                        items: _anio.map((_anio) {
                          return DropdownMenuItem(
                            child: new Text(_anio, textAlign: TextAlign.left),
                            value: _anio,
                          );
                        }).toList(),
                      ),
                      Divider(),
                       DropdownButton(  
                      isDense: true,
                        elevation: 10,
                        icon: Icon(Icons.filter_list),
                       
                        hint: Text(
                            'Escoja Mes'), // Not necessary for Option 1
                        value: _selectedMes,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedMes = newValue;
                          });
                        },
                        items: _mes.map((_mes) {
                          return DropdownMenuItem(
                            child: new Text(_mes, textAlign: TextAlign.left),
                            
                            value: _mes,
                          );
                        }).toList(),
                      ),
                        Divider(
                        color: Colors.transparent,
                      ),
                        Divider(
                        color: Colors.transparent,
                      ),
                      DropdownButton(
                        elevation: 10,
                        icon: Icon(Icons.filter_list),
                       
                        hint: Text(
                            'Escoja Recibo a Consultar'), // Not necessary for Option 1
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location, textAlign: TextAlign.right),
                            value: location,
                          );
                        }).toList(),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                        Divider(
                        color: Colors.transparent,
                      ),
                      RaisedButton(
                      onPressed: _loadPDF,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    elevation: 10.0,
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                     
                      child: const Text(
                        'Consultar Recibo',
                        style: TextStyle(fontSize: 20)
                      ),
                    ),

                    ],
                  ),
                )
              : PDFViewer(
                  document: document,

                  showPicker: false,
                )),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
          child: Icon(Icons.arrow_back_ios),
          onPressed: _quitar,
          tooltip: 'Regresar . . .'),
    );
  }
}
