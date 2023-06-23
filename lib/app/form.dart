import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final emailField = TextFieldBloc();
  final passwordField = TextFieldBloc();

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [emailField, passwordField]);
  }

  @override
  void onSubmitting() async {
    // Validar los campos del formulario y realizar la lógica de inicio de sesión
    final email = emailField.value;
    final password = passwordField.value;

    // Simulación de una llamada asincrónica
    await Future.delayed(Duration(seconds: 2));

    if (email == 'usuario@example.com' && password == 'contraseña') {
      emitSuccess(canSubmitAgain: true);
    } else {
      emitFailure();
    }
  }
}

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<LoginFormBloc>();

          return Scaffold(
            appBar: AppBar(
              title: Text('Formulario de Inicio de Sesión'),
            ),
            body: FormBlocListener<LoginFormBloc, String, String>(
              onSuccess: (context, state) {
                // Lógica a realizar cuando el formulario se envía correctamente
              },
              onFailure: (context, state) {
                // Lógica a realizar cuando el formulario tiene errores
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.emailField,
                      decoration: InputDecoration(labelText: 'Correo Electrónico'),
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.passwordField,
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      suffixButton: SuffixButton.obscureText,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: formBloc.submit,
                      child: Text('Iniciar Sesión'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
