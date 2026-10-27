import 'package:flutter/material.dart';

import 'tela_agenda_equipe.dart';

import 'tela_detalhes_familia.dart';

class TelaFamilias extends StatefulWidget {
  const TelaFamilias({super.key});

  @override
  State<TelaFamilias> createState() => _TelaFamiliasState();
}

class _TelaFamiliasState extends State<TelaFamilias> {
  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const fundo = Color(0xFFF3F7FA);
  static const borda = Color(0xFFD9E2EC);

  final _buscaController = TextEditingController();
  String _busca = '';

  final List<Map<String, String>> _familias = [
    {
      'nome': 'Família Oliveira',
      'endereco': 'Quadra 08, Casa 14 · Jardim Céu Azul',
    },
    {
      'nome': 'Família Santos',
      'endereco': 'Etapa A, Casa 06 · Valparaíso de Goiás',
    },
    {
      'nome': 'Família Almeida',
      'endereco': 'Parque Esplanada III · Valparaíso de Goiás',
    },
  ];

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final familiasFiltradas = _familias.where((familia) {
      return familia['nome']!.toLowerCase().contains(
        _busca.toLowerCase().trim(),
      );
    }).toList();

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
                      'Famílias',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Consulte as famílias acompanhadas pela unidade.',
                      style: TextStyle(
                        color: azulTexto,
                        fontSize: 11,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 15),

                    const Text(
                      'Buscar família',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    TextField(
                      controller: _buscaController,
                      onChanged: (valor) {
                        setState(() => _busca = valor);
                      },
                      style: const TextStyle(color: azulEscuro, fontSize: 11),
                      decoration: InputDecoration(
                        hintText: 'Nome da família',
                        hintStyle: const TextStyle(
                          color: azulTexto,
                          fontSize: 11,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: azulTexto,
                          size: 17,
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 38,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: borda),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: verde),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Famílias acompanhadas',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    if (familiasFiltradas.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: Center(
                          child: Text(
                            'Nenhuma família encontrada.',
                            style: TextStyle(color: azulTexto, fontSize: 11),
                          ),
                        ),
                      )
                    else
                      ...familiasFiltradas.map(
                        (familia) => Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: _CardFamilia(
                            nome: familia['nome']!,
                            endereco: familia['endereco']!,
                            aoTocar: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TelaDetalhesFamilia(
                                    nome: familia['nome']!,
                                    endereco: familia['endereco']!,
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
              padding: const EdgeInsets.fromLTRB(5, 7, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemMenuFamilias(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    aoTocar: () => Navigator.of(context).pop(),
                  ),
                  _ItemMenuFamilias(
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
                  _ItemMenuFamilias(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    selecionado: true,
                    aoTocar: () {},
                  ),
                  _ItemMenuFamilias(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _ItemMenuFamilias(
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

class _CardFamilia extends StatelessWidget {
  final String nome;
  final String endereco;
  final VoidCallback aoTocar;

  const _CardFamilia({
    required this.nome,
    required this.endereco,
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
          width: double.infinity,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _TelaFamiliasState.borda),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F5F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.people_outline,
                  color: _TelaFamiliasState.verde,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        color: _TelaFamiliasState.azulEscuro,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: _TelaFamiliasState.azulTexto,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            endereco,
                            style: const TextStyle(
                              color: _TelaFamiliasState.azulTexto,
                              fontSize: 9,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.chevron_right,
                color: _TelaFamiliasState.verde,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemMenuFamilias extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _ItemMenuFamilias({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado
        ? _TelaFamiliasState.verde
        : _TelaFamiliasState.azulTexto;

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
