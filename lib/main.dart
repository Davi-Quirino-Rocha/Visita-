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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const TelaHomeCoordenador(),
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
                              builder: (context) => const TelaEmailEnviado(),
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
                              builder: (context) => const TelaSenhaAlterada(),
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
                    Navigator.of(context).pushReplacement(
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

class TelaSenhaAlterada extends StatelessWidget {
  const TelaSenhaAlterada({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                'Senha alterada',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Sua nova senha foi salva com segurança.\n'
                'Agora você já pode acessar o aplicativo.',
                textAlign: TextAlign.center,
                style: TextStyle(color: azulTexto, fontSize: 11, height: 1.45),
              ),

              const SizedBox(height: 17),

              // Próximo passo
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
                            'Não compartilhe sua senha e evite reutilizá-la '
                            'em outros serviços.',
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

              // Ir para o login
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const TelaRevisarDados(),
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
                    'Ir para o login',
                    style: TextStyle(fontSize: 11),
                  ),
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

class TelaHomeCoordenador extends StatelessWidget {
  const TelaHomeCoordenador({super.key});

  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const borda = Color(0xFFD9E2EC);
  static const fundo = Color(0xFFF4F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 16, 17, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho do coordenador
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Olá, Renato',
                                style: TextStyle(
                                  color: azulEscuro,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Coordenador da unidade',
                                style: TextStyle(
                                  color: azulTexto,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Nenhuma notificação nova.'),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.notifications_none,
                            color: azulEscuro,
                            size: 21,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: borda),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFF092D55),
                          child: Text(
                            'RS',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 19),

                    // Indicadores
                    Row(
                      children: [
                        Expanded(
                          child: _IndicadorHome(
                            icone: Icons.calendar_month_outlined,
                            numero: '08',
                            titulo: 'Visitas hoje',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _IndicadorHome(
                            icone: Icons.calendar_month_outlined,
                            numero: '05',
                            titulo: 'Concluídas',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _IndicadorHome(
                            icone: Icons.calendar_month_outlined,
                            numero: '02',
                            titulo: 'Retornos',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 21),

                    const Text(
                      'Ações rápidas',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 9),

                    Row(
                      children: [
                        Expanded(
                          child: _AcaoRapidaHome(
                            icone: Icons.calendar_month_outlined,
                            titulo: 'Agendar visita',
                            descricao: 'Definir família, data e técnico',
                            aoTocar: () {
                              _mensagem(context, 'Agendar visita');
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _AcaoRapidaHome(
                            icone: Icons.people_outline,
                            titulo: 'Novo profissional',
                            descricao: 'Cadastrar acesso da equipe',
                            aoTocar: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TelaNovoProfissional(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 21),

                    // Título da agenda
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Agenda da equipe',
                          style: TextStyle(
                            color: azulEscuro,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _mensagem(context, 'Agenda completa');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(40, 28),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Ver tudo',
                            style: TextStyle(color: verde, fontSize: 10),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    const _CardVisitaHome(
                      horario: '09:30',
                      familia: 'Família Oliveira',
                      local: 'Jardim Céu Azul · Camila Souza',
                      tipo: 'Confirmada',
                      detalhe: 'Confirmada',
                    ),

                    const SizedBox(height: 10),

                    const _CardVisitaHome(
                      horario: '13:30',
                      familia: 'Família Santos',
                      local: 'Etapa A · Marcos Lima',
                      tipo: 'Confirmada',
                      detalhe: 'Acompanhamento',
                    ),
                  ],
                ),
              ),
            ),

            // Navegação inferior
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: borda)),
              ),
              padding: const EdgeInsets.fromLTRB(5, 7, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemMenuHome(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    selecionado: true,
                    aoTocar: () {},
                  ),
                  _ItemMenuHome(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    aoTocar: () => _mensagem(context, 'Agenda'),
                  ),
                  _ItemMenuHome(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    aoTocar: () => _mensagem(context, 'Famílias'),
                  ),
                  _ItemMenuHome(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _ItemMenuHome(
                    icone: Icons.more_horiz,
                    titulo: 'Mais',
                    aoTocar: () => _mensagem(context, 'Mais opções'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _mensagem(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$texto: tela ainda em desenvolvimento.')),
    );
  }
}

class _IndicadorHome extends StatelessWidget {
  final IconData icone;
  final String numero;
  final String titulo;

  const _IndicadorHome({
    required this.icone,
    required this.numero,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TelaHomeCoordenador.borda),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: TelaHomeCoordenador.verde, size: 15),
          const SizedBox(height: 3),
          Text(
            numero,
            style: const TextStyle(
              color: TelaHomeCoordenador.azulEscuro,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 1),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              titulo,
              style: const TextStyle(
                color: TelaHomeCoordenador.azulTexto,
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AcaoRapidaHome extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final VoidCallback aoTocar;

  const _AcaoRapidaHome({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: aoTocar,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: const BoxConstraints(minHeight: 82),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: TelaHomeCoordenador.borda),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icone, color: TelaHomeCoordenador.verde, size: 18),
              const SizedBox(height: 7),
              Text(
                titulo,
                style: const TextStyle(
                  color: TelaHomeCoordenador.azulEscuro,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                descricao,
                style: const TextStyle(
                  color: TelaHomeCoordenador.azulTexto,
                  fontSize: 9,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardVisitaHome extends StatelessWidget {
  final String horario;
  final String familia;
  final String local;
  final String tipo;
  final String detalhe;

  const _CardVisitaHome({
    required this.horario,
    required this.familia,
    required this.local,
    required this.tipo,
    required this.detalhe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TelaHomeCoordenador.borda),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                horario,
                style: const TextStyle(
                  color: TelaHomeCoordenador.azulEscuro,
                  fontSize: 10,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F6F0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tipo,
                  style: const TextStyle(color: Color(0xFF168363), fontSize: 8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            familia,
            style: const TextStyle(
              color: TelaHomeCoordenador.azulEscuro,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: TelaHomeCoordenador.azulTexto,
                size: 13,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  local,
                  style: const TextStyle(
                    color: TelaHomeCoordenador.azulTexto,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  detalhe,
                  style: const TextStyle(
                    color: TelaHomeCoordenador.azulTexto,
                    fontSize: 9,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Detalhes de $familia em desenvolvimento.'),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Text(
                      'Ver detalhes',
                      style: TextStyle(
                        color: TelaHomeCoordenador.verde,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.chevron_right,
                      color: TelaHomeCoordenador.verde,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemMenuHome extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _ItemMenuHome({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado
        ? TelaHomeCoordenador.verde
        : TelaHomeCoordenador.azulTexto;

    return InkWell(
      onTap: aoTocar,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, color: cor, size: 17),
            const SizedBox(height: 3),
            Text(
              titulo,
              style: TextStyle(
                color: cor,
                fontSize: 8,
                fontWeight: selecionado ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaNovoProfissional extends StatefulWidget {
  const TelaNovoProfissional({super.key});

  @override
  State<TelaNovoProfissional> createState() => _TelaNovoProfissionalState();
}

class _TelaNovoProfissionalState extends State<TelaNovoProfissional> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();

  String _perfil = 'Técnico de referência';

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const fundo = Color(0xFFF3F7FA);
  static const borda = Color(0xFFD9E2EC);
  static const azulPainel = Color(0xFFEAF1F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 19,
                      color: azulEscuro,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: borda),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: const Size(40, 40),
                    ),
                  ),
                  const SizedBox(width: 9),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Novo profissional',
                          style: TextStyle(
                            color: azulEscuro,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Cadastro feito pelo Coordenador',
                          style: TextStyle(color: azulTexto, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Formulário rolável
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 13, 17, 14),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dados de acesso',
                        style: TextStyle(
                          color: azulEscuro,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Use apenas informações institucionais. A senha provisória será enviada por e-mail.',
                        style: TextStyle(
                          color: azulTexto,
                          fontSize: 10,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 10),

                      _campo(
                        titulo: 'Nome completo',
                        dica: 'Digite o nome do profissional',
                        icone: Icons.person_outline,
                        controller: _nomeController,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o nome completo';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _campo(
                        titulo: 'E-mail institucional',
                        dica: 'nome@instituicao.gov.br',
                        icone: Icons.mail_outline,
                        controller: _emailController,
                        teclado: TextInputType.emailAddress,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o e-mail institucional';
                          }
                          if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(valor.trim())) {
                            return 'Digite um e-mail válido';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _campo(
                        titulo: 'CPF',
                        dica: '000.000.000-00',
                        icone: Icons.person_outline,
                        controller: _cpfController,
                        teclado: TextInputType.number,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o CPF';
                          }
                          if (valor.replaceAll(RegExp(r'\D'), '').length !=
                              11) {
                            return 'O CPF deve ter 11 números';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _campo(
                        titulo: 'Telefone',
                        dica: '(61) 99999-0000',
                        icone: Icons.person_outline,
                        controller: _telefoneController,
                        teclado: TextInputType.phone,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o telefone';
                          }
                          if (valor.replaceAll(RegExp(r'\D'), '').length < 10) {
                            return 'Digite um telefone válido';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Perfil de acesso',
                        style: TextStyle(
                          color: azulEscuro,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),

                      Container(
                        height: 41,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: verde),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _perfil,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.chevron_right,
                              color: azulTexto,
                              size: 19,
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Técnico de referência',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.card_travel_outlined,
                                      color: verde,
                                      size: 15,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      'Técnico de referência',
                                      style: TextStyle(
                                        color: azulTexto,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Coordenador',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.admin_panel_settings_outlined,
                                      color: verde,
                                      size: 15,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      'Coordenador',
                                      style: TextStyle(
                                        color: azulTexto,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            onChanged: (valor) {
                              if (valor != null) {
                                setState(() => _perfil = valor);
                              }
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Permissões do perfil
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: azulPainel,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.verified_user_outlined,
                                  color: Color(0xFF174A78),
                                  size: 14,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Permissões do perfil',
                                  style: TextStyle(
                                    color: Color(0xFF174A78),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ..._permissoes.map(
                              (permissao) => Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      color: verde,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(
                                        permissao,
                                        style: const TextStyle(
                                          color: Color(0xFF174A78),
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 17),

                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: _cadastrar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: verde,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cadastrar profissional',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),

                      const SizedBox(height: 3),

                      SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: verde, fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const _permissoes = [
    'Consultar visitas atribuídas',
    'Registrar atendimento e encaminhamento',
    'Solicitar retorno ao Coordenador',
  ];

  Widget _campo({
    required String titulo,
    required String dica,
    required IconData icone,
    required TextEditingController controller,
    required String? Function(String?) validador,
    TextInputType teclado = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: azulEscuro,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 41,
          child: TextFormField(
            controller: controller,
            keyboardType: teclado,
            validator: validador,
            style: const TextStyle(color: azulEscuro, fontSize: 11),
            decoration: InputDecoration(
              hintText: dica,
              hintStyle: const TextStyle(color: azulTexto, fontSize: 11),
              prefixIcon: Icon(icone, color: azulTexto, size: 15),
              prefixIconConstraints: const BoxConstraints(minWidth: 30),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: borda),
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
          ),
        ),
      ],
    );
  }

  void _cadastrar() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const TelaProfissionalCadastrado(),
      ),
    );
  }
}

class TelaProfissionalCadastrado extends StatelessWidget {
  const TelaProfissionalCadastrado({super.key});

  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const azulPainel = Color(0xFFEAF1F8);
  static const azulIcone = Color(0xFF174A78);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const Spacer(flex: 4),

              // Ícone de sucesso
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F6F0),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Color(0xFF168363),
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Profissional cadastrado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'O acesso foi criado e as orientações de\n'
                'primeiro acesso foram enviadas ao e-mail\n'
                'institucional.',
                textAlign: TextAlign.center,
                style: TextStyle(color: azulTexto, fontSize: 11, height: 1.45),
              ),

              const SizedBox(height: 20),

              // Próximo passo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: azulPainel,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: azulIcone, size: 15),
                    SizedBox(width: 8),
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
                          SizedBox(height: 4),
                          Text(
                            'O profissional deverá trocar a senha '
                            'provisória no primeiro acesso.',
                            style: TextStyle(
                              color: azulIcone,
                              fontSize: 10,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Voltar para a equipe
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const TelaHomeCoordenador(),
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
                    'Voltar para a equipe',
                    style: TextStyle(fontSize: 11),
                  ),
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
