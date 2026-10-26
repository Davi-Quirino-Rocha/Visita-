import 'package:flutter/material.dart';

import 'tela_recuperar_senha.dart';
import 'tela_login.dart';

class TelaRevisarDados extends StatefulWidget {
  const TelaRevisarDados({super.key});

  @override
  State<TelaRevisarDados> createState() => _TelaRevisarDadosState();
}

class _TelaRevisarDadosState extends State<TelaRevisarDados> {
  final TextEditingController _emailController = TextEditingController(
    text: 'nome@instituicao.gov.br',
  );

  final TextEditingController _senhaController = TextEditingController(
    text: 'Senha123',
  );

  bool _mostrarSenha = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const verde = Color(0xFF008577);
    const azulEscuro = Color(0xFF142A40);
    const azulTexto = Color(0xFF647895);
    const borda = Color(0xFFD9E2EC);
    const vermelho = Color(0xFFFF3344);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              const Icon(Icons.mail_outline, color: azulTexto, size: 17),

              const SizedBox(height: 12),

              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 105,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'ACESSO RESTRITO',
                style: TextStyle(
                  color: verde,
                  fontSize: 9,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Revise seus dados',
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Não foi possível confirmar seu acesso. '
                'Corrija os campos indicados abaixo.',
                style: TextStyle(color: azulTexto, fontSize: 12, height: 1.4),
              ),

              const SizedBox(height: 10),

              // Aviso de erro
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFCEBED),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: vermelho,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dados incorretos',
                            style: TextStyle(
                              color: vermelho,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'O e-mail ou a senha informados não conferem.',
                            style: TextStyle(
                              color: vermelho,
                              fontSize: 10,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'E-mail',
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mail_outline,
                    size: 16,
                    color: azulTexto,
                  ),
                  hintText: 'nome@instituicao.gov.br',
                  hintStyle: const TextStyle(color: azulTexto, fontSize: 11),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: borda),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: verde),
                  ),
                ),
                style: const TextStyle(fontSize: 12),
              ),

              const SizedBox(height: 17),

              const Text(
                'Senha',
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              TextField(
                controller: _senhaController,
                obscureText: !_mostrarSenha,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: vermelho,
                    size: 16,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _mostrarSenha = !_mostrarSenha;
                      });
                    },
                    icon: Icon(
                      _mostrarSenha
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 16,
                      color: azulTexto,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: vermelho),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: vermelho, width: 1.3),
                  ),
                ),
                style: const TextStyle(fontSize: 12),
              ),

              const SizedBox(height: 5),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TelaRecuperarSenha(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: verde,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 5,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Esqueci minha senha',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TelaLogin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verde,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 11),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1F8),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      color: Color(0xFF174A78),
                      size: 13,
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        'Acesso exclusivo para profissionais cadastrados '
                        'pelo Coordenador.',
                        style: TextStyle(
                          color: Color(0xFF174A78),
                          fontSize: 10,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Text(
                  'Versão acadêmica · dados fictícios',
                  style: TextStyle(color: Color(0xFF9AA8B8), fontSize: 9),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
