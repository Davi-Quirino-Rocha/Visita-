import 'package:flutter/material.dart';

import 'tela_familias.dart';

class TelaAgendaEquipe extends StatelessWidget {
  const TelaAgendaEquipe({super.key});

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
                      'Agenda da equipe',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Visitas organizadas por horário e profissional.',
                      style: TextStyle(color: azulTexto, fontSize: 11),
                    ),
                    const SizedBox(height: 16),

                    // Indicadores
                    const Row(
                      children: [
                        Expanded(
                          child: _IndicadorAgenda(
                            numero: '08',
                            titulo: 'Visitas hoje',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _IndicadorAgenda(
                            numero: '05',
                            titulo: 'Concluídas',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _IndicadorAgenda(
                            numero: '02',
                            titulo: 'Retornos',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 21),

                    const Text(
                      'Visitas de hoje',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    _CardVisitaAgenda(
                      horario: '09:30',
                      familia: 'Família Oliveira',
                      local: 'Jardim Céu Azul · Camila Souza',
                      detalhe: 'Confirmada',
                    ),
                    const SizedBox(height: 10),

                    _CardVisitaAgenda(
                      horario: '13:30',
                      familia: 'Família Santos',
                      local: 'Etapa A · Marcos Lima',
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
                  _ItemMenuAgenda(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    aoTocar: () => Navigator.of(context).pop(),
                  ),
                  _ItemMenuAgenda(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    selecionado: true,
                    aoTocar: () {},
                  ),
                  _ItemMenuAgenda(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    aoTocar: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TelaFamilias(),
                        ),
                      );
                    },
                  ),
                  _ItemMenuAgenda(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _ItemMenuAgenda(
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

class _IndicadorAgenda extends StatelessWidget {
  final String numero;
  final String titulo;

  const _IndicadorAgenda({required this.numero, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TelaAgendaEquipe.borda),
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
          const Icon(
            Icons.calendar_month_outlined,
            color: TelaAgendaEquipe.verde,
            size: 15,
          ),
          const SizedBox(height: 3),
          Text(
            numero,
            style: const TextStyle(
              color: TelaAgendaEquipe.azulEscuro,
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
                color: TelaAgendaEquipe.azulTexto,
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardVisitaAgenda extends StatelessWidget {
  final String horario;
  final String familia;
  final String local;
  final String detalhe;

  const _CardVisitaAgenda({
    required this.horario,
    required this.familia,
    required this.local,
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
        border: Border.all(color: TelaAgendaEquipe.borda),
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
                  color: TelaAgendaEquipe.azulEscuro,
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
                child: const Text(
                  'Confirmada',
                  style: TextStyle(color: Color(0xFF168363), fontSize: 8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            familia,
            style: const TextStyle(
              color: TelaAgendaEquipe.azulEscuro,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: TelaAgendaEquipe.azulTexto,
                size: 13,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  local,
                  style: const TextStyle(
                    color: TelaAgendaEquipe.azulTexto,
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
                    color: TelaAgendaEquipe.azulTexto,
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
                        color: TelaAgendaEquipe.verde,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.chevron_right,
                      color: TelaAgendaEquipe.verde,
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

class _ItemMenuAgenda extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _ItemMenuAgenda({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado
        ? TelaAgendaEquipe.verde
        : TelaAgendaEquipe.azulTexto;

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
