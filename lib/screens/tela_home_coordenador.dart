import 'package:flutter/material.dart';

import 'tela_novo_profissional.dart';

import 'tela_agenda_equipe.dart';
import 'tela_familias.dart';

import 'tela_equipe.dart';

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
                                  builder: (context) => TelaNovoProfissional(),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TelaAgendaEquipe(),
                              ),
                            );
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
                    aoTocar: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TelaAgendaEquipe(),
                        ),
                      );
                    },
                  ),
                  _ItemMenuHome(
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
                  _ItemMenuHome(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TelaEquipe(),
                        ),
                      );
                    },
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
