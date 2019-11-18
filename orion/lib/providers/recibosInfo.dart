import 'package:flutter/material.dart';

class RecibosInfo with ChangeNotifier {
  String nombreRecibo;
  int idRecibo;
  

	 String getNombreRecibo() {
		return this.nombreRecibo;
	}

	  setNombreRecibo(String nombreRecibo) {
		this.nombreRecibo = nombreRecibo;
	}

	 int getIdRecibo() {
		return this.idRecibo;
	}

	  setIdRecibo(int idRecibo) {
		this.idRecibo = idRecibo;
	}




}
