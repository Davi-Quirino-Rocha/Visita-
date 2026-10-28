import 'package:flutter/material.dart';

import 'tela_perfil_coordenador.dart';

class TelaHomeTecnico extends StatelessWidget {
  const TelaHomeTecnico({super.key});

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
                padding: const EdgeInsets.fromLTRB(17, 17, 17, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Olá, Camila',
                                style: TextStyle(
                                  color: azulEscuro,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Técnica de referência',
                                style: TextStyle(
                                  color: azulTexto,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => _mensagem(context, 'Notificações'),
                          icon: const Icon(
                            Icons.notifications_none,
                            color: azulEscuro,
                            size: 20,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: borda),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: const Size(38, 38),
                          ),
                        ),
                        const SizedBox(width: 5),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TelaPerfilCoordenador(
                                      nome: 'Camila Souza',
                                      matricula: '12345-6',
                                      unidade: 'CRAS Gama',
                                      funcao: 'Técnica de referência',
                                      email: 'camila.souza@gmail.com',
                                      telefone: '(61) 98324-9342',
                                      visitas: '45',
                                      acompanhamentos: '12',
                                    ),
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFF092D55),
                            child: Text(
                              'CS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Próxima visita em destaque
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF092D55),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'PRÓXIMA VISITA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.access_time,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(width: 4),
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
                          const Text(
                            'Família Oliveira',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFFD9E5F2),
                                size: 13,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Jardim Céu Azul · 2,4 km',
                                style: TextStyle(
                                  color: Color(0xFFD9E5F2),
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          SizedBox(
                            width: double.infinity,
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () => _mensagem(
                                context,
                                'Visita atribuída à Família Oliveira',
                              ),
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
                                      'Ver visita atribuída',
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

                    const SizedBox(height: 12),

                    // Indicadores
                    const Row(
                      children: [
                        Expanded(
                          child: _IndicadorTecnico(
                            icone: Icons.calendar_month_outlined,
                            numero: '03',
                            titulo: 'Visitas hoje',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _IndicadorTecnico(
                            icone: Icons.call_missed_outgoing,
                            numero: '01',
                            titulo: 'Retorno pendente',
                            retorno: true,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // Título da lista
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Próximas visitas',
                          style: TextStyle(
                            color: azulEscuro,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              _mensagem(context, 'Agenda completa'),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(40, 28),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Ver agenda',
                            style: TextStyle(color: verde, fontSize: 10),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 7),

                    const _VisitaTecnico(
                      horario: '13:30',
                      familia: 'Família Santos',
                      local: 'Etapa A, Casa 06 · Valparaíso de Goiás',
                      detalhe: 'Acompanhamento',
                    ),

                    const SizedBox(height: 10),

                    const _VisitaTecnico(
                      horario: '16:00',
                      familia: 'Família Almeida',
                      local: 'Parque Esplanada III · Valparaíso de Goiás',
                      detalhe: 'Primeira visita',
                    ),
                  ],
                ),
              ),
            ),

            // Menu inferior
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: borda)),
              ),
              padding: const EdgeInsets.fromLTRB(4, 7, 4, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MenuTecnico(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    selecionado: true,
                    aoTocar: () {},
                  ),
                  _MenuTecnico(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    aoTocar: () => _mensagem(context, 'Agenda'),
                  ),
                  _MenuTecnico(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    aoTocar: () => _mensagem(context, 'Famílias'),
                  ),
                  _MenuTecnico(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _MenuTecnico(
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

class _IndicadorTecnico extends StatelessWidget {
  final IconData icone;
  final String numero;
  final String titulo;
  final bool retorno;

  const _IndicadorTecnico({
    required this.icone,
    required this.numero,
    required this.titulo,
    this.retorno = false,
  });

  @override
  Widget build(BuildContext context) {
    final corIcone = retorno ? const Color(0xFFB7791F) : TelaHomeTecnico.verde;

    final fundoIcone = retorno
        ? const Color(0xFFFFF2D8)
        : const Color(0xFFE7F4F1);

    return Container(
      constraints: const BoxConstraints(minHeight: 65),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: TelaHomeTecnico.borda),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: fundoIcone,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(icone, color: corIcone, size: 14),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  numero,
                  style: const TextStyle(
                    color: TelaHomeTecnico.azulEscuro,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  titulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: TelaHomeTecnico.azulTexto,
                    fontSize: 7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisitaTecnico extends StatelessWidget {
  final String horario;
  final String familia;
  final String local;
  final String detalhe;

  const _VisitaTecnico({
    required this.horario,
    required this.familia,
    required this.local,
    required this.detalhe,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Detalhes de $familia em desenvolvimento.')),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            border: Border.all(color: TelaHomeTecnico.borda),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.025),
                blurRadius: 7,
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
                      color: TelaHomeTecnico.azulEscuro,
                      fontSize: 9,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
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
              const SizedBox(height: 10),
              Text(
                familia,
                style: const TextStyle(
                  color: TelaHomeTecnico.azulEscuro,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: TelaHomeTecnico.azulTexto,
                    size: 12,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      local,
                      style: const TextStyle(
                        color: TelaHomeTecnico.azulTexto,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      detalhe,
                      style: const TextStyle(
                        color: TelaHomeTecnico.azulTexto,
                        fontSize: 8,
                      ),
                    ),
                  ),
                  const Text(
                    'Ver detalhes',
                    style: TextStyle(
                      color: TelaHomeTecnico.verde,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: TelaHomeTecnico.verde,
                    size: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTecnico extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _MenuTecnico({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado ? TelaHomeTecnico.verde : TelaHomeTecnico.azulTexto;

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
