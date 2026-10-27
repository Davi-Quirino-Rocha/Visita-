import 'package:flutter/material.dart';

import 'tela_historico_visitas.dart';

class TelaInformacoesVisita extends StatelessWidget {
  const TelaInformacoesVisita({super.key});

  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const fundo = Color(0xFFF3F7FA);
  static const borda = Color(0xFFD9E2EC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 22, 17, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informações da visita',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Resumo e próximos passos',
                      style: TextStyle(color: azulTexto, fontSize: 11),
                    ),

                    const SizedBox(height: 30),

                    // Última visita
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: const Color(0xFF092D55),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Última visita',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '20/05/2026',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                              SizedBox(width: 7),
                              Icon(
                                Icons.access_time,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(width: 3),
                              Text(
                                '09:30',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Profissional',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Camila Souza',
                                      style: TextStyle(
                                        color: Color(0xFFD9E5F2),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'CS',
                                  style: TextStyle(
                                    color: verde,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          SizedBox(
                            width: double.infinity,
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () =>
                                  _mensagem(context, 'Resumo da última visita'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: azulEscuro,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Ver resumo da visita',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  Icon(Icons.chevron_right, size: 16),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Próxima visita',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Próxima visita
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      child: InkWell(
                        onTap: () =>
                            _mensagem(context, 'Detalhes da próxima visita'),
                        borderRadius: BorderRadius.circular(17),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            border: Border.all(color: borda),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: verde,
                                    size: 14,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    '00/00/2026 às 09:00',
                                    style: TextStyle(
                                      color: azulEscuro,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.chevron_right,
                                    color: azulTexto,
                                    size: 16,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Objetivo',
                                style: TextStyle(
                                  color: azulEscuro,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Acompanhe de saúde e orientação\n'
                                'sobre vacinação.',
                                style: TextStyle(
                                  color: azulEscuro,
                                  fontSize: 9,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 27),

                    const Text(
                      'Histórico de visitas',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Histórico
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TelaHistoricoVisitas(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: borda),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.receipt_long_outlined,
                                color: verde,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Ver todas as visitas',
                                    style: TextStyle(
                                      color: azulEscuro,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: azulTexto,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Barra inferior
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: borda)),
              ),
              padding: const EdgeInsets.fromLTRB(5, 7, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemMenuVisita(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    aoTocar: () =>
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                  ),
                  _ItemMenuVisita(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    aoTocar: () => _mensagem(context, 'Agenda'),
                  ),
                  _ItemMenuVisita(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    selecionado: true,
                    aoTocar: () => Navigator.of(context).pop(),
                  ),
                  _ItemMenuVisita(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _ItemMenuVisita(
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

class _ItemMenuVisita extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _ItemMenuVisita({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado
        ? TelaInformacoesVisita.verde
        : TelaInformacoesVisita.azulTexto;

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
