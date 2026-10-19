import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const VisitaMaisApp());
}

class VisitaMaisApp extends StatelessWidget {
  const VisitaMaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visita+',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TelaAbertura(),
    );
  }
}

class TelaAbertura extends StatefulWidget {
  const TelaAbertura({super.key});

  @override
  State<TelaAbertura> createState() => _TelaAberturaState();
}

class _TelaAberturaState extends State<TelaAbertura>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // A logo aparece gradualmente.
    _controller.forward();

    // Depois de 3 segundos, começa a saída.
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;

      await _controller.reverse();

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TelaLogin(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fade,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 4),

                Image.asset(
                  'assets/images/logo.png',
                  width: 260,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 28),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Apoio que aproxima cuidado e comunidade',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF718096), fontSize: 13),
                  ),
                ),

                const SizedBox(height: 28),

                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Color(0xFF008577),
                  ),
                ),

                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IndicadorPagina extends StatelessWidget {
  final bool ativo;

  const IndicadorPagina({super.key, required this.ativo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ativo ? 9 : 6,
      height: ativo ? 9 : 6,
      decoration: BoxDecoration(
        color: ativo ? const Color(0xFF008577) : const Color(0xFFB2DFDB),
        shape: BoxShape.circle,
      ),
    );
  }
}

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

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
    const cinza = Color(0xFF647895);
    const borda = Color(0xFFD9E2EC);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // Logo do Visita+
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 175,
                        height: 145,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'ACESSO RESTRITO',
                      style: TextStyle(
                        color: verde,
                        fontSize: 10,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Bem-vindo de volta',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Entre com seu e-mail institucional '
                      'para acessar sua agenda de visitas.',
                      style: TextStyle(color: cinza, fontSize: 14, height: 1.4),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'E-mail',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'nome@instituicao.gov.br',
                        hintStyle: const TextStyle(color: cinza, fontSize: 13),
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          size: 20,
                          color: cinza,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 17,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: verde,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Senha',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      controller: _senhaController,
                      obscureText: !_mostrarSenha,
                      decoration: InputDecoration(
                        hintText: 'Digite sua senha',
                        hintStyle: const TextStyle(color: cinza, fontSize: 13),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 20,
                          color: cinza,
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
                            size: 20,
                            color: cinza,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 17,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: verde,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

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
                        child: const Text(
                          'Esqueci minha senha',
                          style: TextStyle(color: verde, fontSize: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'A validação do login será implementada depois.',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF1F8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            color: Color(0xFF174A78),
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Acesso exclusivo para profissionais '
                              'cadastrados pelo Coordenador.',
                              style: TextStyle(
                                color: Color(0xFF174A78),
                                fontSize: 11,
                                height: 1.4,
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
                        style: TextStyle(
                          color: Color(0xFF8A9BB0),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TelaRecuperarSenha extends StatelessWidget {
  const TelaRecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    const verde = Color(0xFF008577);
    const azulEscuro = Color(0xFF142A40);
    const cinza = Color(0xFF647895);
    const borda = Color(0xFFD9E2EC);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Voltar para o login
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: verde,
                      ),
                      label: const Text(
                        'Voltar para o login',
                        style: TextStyle(color: verde, fontSize: 13),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    // Logo
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 26),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                          height: 125,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Título e explicação
                    const Text(
                      'SEGURANÇA',
                      style: TextStyle(
                        color: verde,
                        fontSize: 10,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Recupere sua senha',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Informe o e-mail usado no cadastro. '
                      'Enviaremos as orientações para criar '
                      'uma nova senha.',
                      style: TextStyle(color: cinza, fontSize: 14, height: 1.4),
                    ),

                    const SizedBox(height: 18),

                    // Campo de e-mail
                    const Text(
                      'E-mail',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'nome@instituicao.gov.br',
                        hintStyle: const TextStyle(color: cinza, fontSize: 13),
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          size: 20,
                          color: verde,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 17,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: verde,
                            width: 1.2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: verde,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Botão de envio
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TelaNovaSenha(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text(
                          'Enviar orientações',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Aviso de segurança
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF1F8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            color: Color(0xFF174A78),
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'O link de recuperação será válido '
                              'por tempo limitado e poderá ser '
                              'usado uma única vez.',
                              style: TextStyle(
                                color: Color(0xFF174A78),
                                fontSize: 11,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TelaNovaSenha extends StatefulWidget {
  const TelaNovaSenha({super.key});

  @override
  State<TelaNovaSenha> createState() => _TelaNovaSenhaState();
}

class _TelaNovaSenhaState extends State<TelaNovaSenha> {
  final TextEditingController _senhaController = TextEditingController();

  final TextEditingController _confirmarController = TextEditingController();

  bool _mostrarSenha = false;
  bool _mostrarConfirmacao = false;

  bool get _senhaValida {
    final senha = _senhaController.text;

    return senha.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(senha) &&
        RegExp(r'[0-9]').hasMatch(senha);
  }

  bool get _senhasCoincidem {
    return _senhaController.text.isNotEmpty &&
        _senhaController.text == _confirmarController.text;
  }

  @override
  void dispose() {
    _senhaController.dispose();
    _confirmarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const verde = Color(0xFF008577);
    const azulEscuro = Color(0xFF142A40);
    const cinza = Color(0xFF647895);
    const borda = Color(0xFFD9E2EC);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: verde,
                      ),
                      label: const Text(
                        'Cancelar',
                        style: TextStyle(color: verde, fontSize: 13),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'PRIMEIRO ACESSO',
                      style: TextStyle(
                        color: verde,
                        fontSize: 10,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Crie uma nova senha',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Para proteger sua conta, escolha uma senha '
                      'diferente da provisória enviada pelo '
                      'Coordenador.',
                      style: TextStyle(color: cinza, fontSize: 14, height: 1.4),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Nova senha',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      controller: _senhaController,
                      obscureText: !_mostrarSenha,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: verde,
                          size: 20,
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
                            color: cinza,
                            size: 20,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: _senhaController.text.isEmpty
                                ? borda
                                : verde,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: verde,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    const Text(
                      'Confirmar senha',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 6),

                    TextField(
                      controller: _confirmarController,
                      obscureText: !_mostrarConfirmacao,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: cinza,
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _mostrarConfirmacao = !_mostrarConfirmacao;
                            });
                          },
                          icon: Icon(
                            _mostrarConfirmacao
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: cinza,
                            size: 20,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borda),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:
                                _confirmarController.text.isNotEmpty &&
                                    !_senhasCoincidem
                                ? Colors.red
                                : borda,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: verde,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: borda),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sua senha deve ter:',
                            style: TextStyle(
                              color: azulEscuro,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Icon(
                                _senhaController.text.length >= 8
                                    ? Icons.check
                                    : Icons.check,
                                color: verde,
                                size: 15,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '8 caracteres ou mais',
                                style: TextStyle(
                                  color: cinza,
                                  fontSize: 11,
                                  fontWeight: _senhaController.text.length >= 8
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: [
                              const Icon(Icons.check, color: verde, size: 15),
                              const SizedBox(width: 6),
                              Text(
                                'Uma letra maiúscula e um número',
                                style: TextStyle(
                                  color: cinza,
                                  fontSize: 11,
                                  fontWeight: _senhaValida
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_senhaValida) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Use pelo menos 8 caracteres, '
                                  'uma letra maiúscula e um número.',
                                ),
                              ),
                            );
                            return;
                          }

                          if (!_senhasCoincidem) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('As senhas não coincidem.'),
                              ),
                            );
                            return;
                          }

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const TelaRevisarDados(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text(
                          'Salvar nova senha',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
                      MaterialPageRoute(
                        builder: (context) => const TelaLogin(),
                      ),
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

class TelaEmailEnviado extends StatelessWidget {
  const TelaEmailEnviado({super.key});

  @override
  Widget build(BuildContext context) {
    const verde = Color(0xFF008577);
    const azulEscuro = Color(0xFF142A40);
    const azulTexto = Color(0xFF647895);
    const azulPainel = Color(0xFFEAF1F8);
    const azulIcone = Color(0xFF174A78);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(flex: 4),

              // Ícone de sucesso
              Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F6F0),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: Color(0xFF168363),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 17),

              const Text(
                'Confira seu e-mail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Enviamos as orientações para\n'
                'm•••••••@instituicao.gov.br. Verifique\n'
                'também a pasta de spam.',
                textAlign: TextAlign.center,
                style: TextStyle(color: azulTexto, fontSize: 11, height: 1.45),
              ),

              const SizedBox(height: 17),

              // Painel de próximo passo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: azulPainel,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: azulIcone, size: 14),
                    SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Próximo passo',
                            style: TextStyle(
                              color: azulIcone,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'O link poderá ser usado uma única vez e '
                            'ficará disponível por tempo limitado.',
                            style: TextStyle(
                              color: azulIcone,
                              fontSize: 9,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 17),

              // Voltar ao login
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const TelaLogin(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verde,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Voltar ao login',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ),

              const SizedBox(height: 7),

              // Reenviar e-mail
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'O envio de e-mail será implementado depois.',
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: verde),
                child: const Text(
                  'Reenviar e-mail',
                  style: TextStyle(fontSize: 10),
                ),
              ),

              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
