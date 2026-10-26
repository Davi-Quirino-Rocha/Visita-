import 'dart:async';

import 'package:flutter/material.dart';

import 'tela_login.dart';

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
          pageBuilder: (context, animation, secondaryAnimation) => TelaLogin(),
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
