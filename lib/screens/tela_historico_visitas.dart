import 'package:flutter/material.dart';

class TelaHistoricoVisitas extends StatefulWidget {
  const TelaHistoricoVisitas({super.key});

  @override
  State<TelaHistoricoVisitas> createState() => _TelaHistoricoVisitasState();
}

class _TelaHistoricoVisitasState extends State<TelaHistoricoVisitas> {
  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF092D55);
  static const azulTexto = Color(0xFF647895);
  static const fundo = Color(0xFFF3F7FA);
  static const borda = Color(0xFFD9E2EC);

  final _pesquisaController = TextEditingController();

  String _filtro = 'Todas';

  final List<Map<String, dynamic>> _visitas = [
    {
      'tipo': 'Acompanhamento',
      'status': 'Concluída',
      'data': '00/00/2026',
      'horario': '09:00',
      'profissional': 'Camila Souza',
      'iniciais': 'CS',
      'familia': 'Família Oliveira',
      'icone': Icons.check_circle_outline,
      'cor': Color(0xFFBDF5B8),
      'corIcone': Color(0xFF168363),
      'periodo': 'Este mês',
    },
    {
      'tipo': 'Atendimento',
      'status': 'Concluída',
      'data': '00/00/2026',
      'horario': '09:00',
      'profissional': 'Marcos Lima',
      'iniciais': 'ML',
      'familia': 'Família Silva',
      'icone': Icons.assignment_outlined,
      'cor': Color(0xFFC8D4FF),
      'corIcone': Color(0xFF4169C1),
      'periodo': 'Últimos 3 meses',
    },
    {
      'tipo': 'Encaminhamento',
      'status': 'Concluída',
      'data': '00/00/2026',
      'horario': '09:00',
      'profissional': 'Ana Martins',
      'iniciais': 'AM',
      'familia': 'Família Santos',
      'icone': Icons.arrow_forward,
      'cor': Color(0xFFFFE99A),
      'corIcone': Color(0xFFB7791F),
      'periodo': 'Últimos 3 meses',
    },
  ];

  @override
  void dispose() {
    _pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final termo = _pesquisaController.text.trim().toLowerCase();

    final visitasFiltradas = _visitas.where((visita) {
      final correspondeTexto =
          visita['familia'].toString().toLowerCase().contains(termo) ||
          visita['profissional'].toString().toLowerCase().contains(termo);

      final correspondePeriodo =
          _filtro == 'Todas' || visita['periodo'] == _filtro;

      return correspondeTexto && correspondePeriodo;
    }).toList();

    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Histórico de visitas',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Selecione uma visita para ver os detalhes',
                      style: TextStyle(color: azulTexto, fontSize: 11),
                    ),

                    const SizedBox(height: 20),

                    // Pesquisa
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        border: Border.all(color: borda),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: TextField(
                        controller: _pesquisaController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Pesquisar por família ou CPF',
                          hintStyle: const TextStyle(
                            color: azulTexto,
                            fontSize: 10,
                          ),
                          prefixIcon: const Icon(
                            Icons.person_search_outlined,
                            color: azulEscuro,
                            size: 20,
                          ),
                          suffixIcon: _pesquisaController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    _pesquisaController.clear();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.close, size: 17),
                                )
                              : null,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: borda),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: verde),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Filtros
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _FiltroHistorico(
                            texto: 'Todas',
                            selecionado: _filtro == 'Todas',
                            aoTocar: () => setState(() {
                              _filtro = 'Todas';
                            }),
                          ),
                          const SizedBox(width: 6),
                          _FiltroHistorico(
                            texto: 'Este mês',
                            selecionado: _filtro == 'Este mês',
                            aoTocar: () => setState(() {
                              _filtro = 'Este mês';
                            }),
                          ),
                          const SizedBox(width: 6),
                          _FiltroHistorico(
                            texto: 'Últimos 3 meses',
                            selecionado: _filtro == 'Últimos 3 meses',
                            aoTocar: () => setState(() {
                              _filtro = 'Últimos 3 meses';
                            }),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Cartões do histórico
                    if (visitasFiltradas.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: Center(
                          child: Text(
                            'Nenhuma visita encontrada.',
                            style: TextStyle(color: azulTexto, fontSize: 12),
                          ),
                        ),
                      )
                    else
                      ...visitasFiltradas.map(
                        (visita) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _CardHistorico(
                            visita: visita,
                            aoTocar: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Detalhes de ${visita['familia']} '
                                    'em desenvolvimento.',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
              padding: const EdgeInsets.fromLTRB(4, 7, 4, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _MenuHistorico(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    aoTocar: () =>
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                  ),
                  _MenuHistorico(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    aoTocar: () => _mensagem(context, 'Agenda'),
                  ),
                  _MenuHistorico(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    selecionado: true,
                    aoTocar: () => Navigator.of(context).pop(),
                  ),
                  _MenuHistorico(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _MenuHistorico(
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

  void _mensagem(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$texto: tela ainda em desenvolvimento.')),
    );
  }
}

class _CardHistorico extends StatelessWidget {
  final Map<String, dynamic> visita;
  final VoidCallback aoTocar;

  const _CardHistorico({required this.visita, required this.aoTocar});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        onTap: aoTocar,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 9, 8, 7),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD9E2EC)),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: visita['cor'] as Color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      visita['icone'] as IconData,
                      color: visita['corIcone'] as Color,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          visita['tipo'] as String,
                          style: const TextStyle(
                            color: Color(0xFF202A35),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          visita['status'] as String,
                          style: const TextStyle(
                            color: Color(0xFF788694),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        visita['data'] as String,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                        ),
                      ),
                      Text(
                        'às ${visita['horario']}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: const Color(0xFF092D55),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: const Color(0xFF367AC7),
                          child: Text(
                            visita['iniciais'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Text(
                            visita['profissional'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      visita['familia'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Ver detalhes',
                      style: TextStyle(color: Color(0xFF008577), fontSize: 9),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF008577),
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FiltroHistorico extends StatelessWidget {
  final String texto;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _FiltroHistorico({
    required this.texto,
    required this.selecionado,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoTocar,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selecionado ? const Color(0xFF006F5F) : Colors.white,
          border: Border.all(
            color: selecionado
                ? const Color(0xFF006F5F)
                : const Color(0xFFD9E2EC),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: selecionado ? Colors.white : const Color(0xFF263746),
            fontSize: 9,
          ),
        ),
      ),
    );
  }
}

class _MenuHistorico extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _MenuHistorico({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado ? const Color(0xFF008577) : const Color(0xFF647895);

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
