import 'package:flutter/material.dart';

class UsuarioInfo with ChangeNotifier {

  String usuario;
  String password;
  String nombreCompleto;
  int idEmpleado;
  String puesto;
  String departamento;
  String grupo;

	 String getUsuario() {
		return this.usuario;
	}

	  setUsuario(String usuario) {
		this.usuario = usuario;
   
	}

	 String getPassword() {
		return this.password;
     
	}

	  setPassword(String password) {
		this.password = password;
	}

	 String getNombreCompleto() {
		return this.nombreCompleto;
	}

	  setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	 int getIdEmpleado() {
		return this.idEmpleado;
	}

	  setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	 String getPuesto() {
		return this.puesto;
	}

	  setPuesto(String puesto) {
		this.puesto = puesto;
	}

	 String getDepartamento() {
		return this.departamento;
	}

	  setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	 String getGrupo() {
		return this.grupo;
	}

	  setGrupo(String grupo) {
		this.grupo = grupo;
	}

   notifyListeners();

}