import 'package:flutter/material.dart';

import 'tela_novo_profissional.dart';

import 'tela_perfil_coordenador.dart';

class TelaEquipe extends StatefulWidget {
  const TelaEquipe({super.key});

  @override
  State<TelaEquipe> createState() => _TelaEquipeState();
}

class _TelaEquipeState extends State<TelaEquipe> {
  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const fundo = Color(0xFFF3F7FA);
  static const borda = Color(0xFFD9E2EC);

  final TextEditingController _pesquisaController = TextEditingController();

  String _filtro = 'Todos';

  final List<Map<String, String>> _profissionais = [
    {
      'nome': 'Camila Souza',
      'perfil': 'Técnico de referência',
      'local': 'Valparaíso de Goiás',
      'status': 'Ativo',
      'matricula': '12345-6',
      'email': 'camila.souza@email.com',
      'telefone': '(61) 98324-9342',
      'visitas': '45',
      'acompanhamentos': '12',
    },
    {
      'nome': 'Marcos lima',
      'perfil': 'Técnico de referência',
      'local': 'Valparaíso de Goiás',
      'status': 'Ativo',
      'matricula': '12345-6',
      'email': 'camila.souza@email.com',
      'telefone': '(61) 98324-9342',
      'visitas': '45',
      'acompanhamentos': '12',
    },
    {
      'nome': 'Ana Martins',
      'perfil': 'Técnico de referência',
      'local': 'Valparaíso de Goiás',
      'status': 'Ativo',
      'matricula': '12345-6',
      'email': 'camila.souza@email.com',
      'telefone': '(61) 98324-9342',
      'visitas': '45',
      'acompanhamentos': '12',
    },
    {
      'nome': 'Rafael Santos',
      'perfil': 'Técnico de referência',
      'local': 'Valparaíso de Goiás',
      'status': 'Ativo',
      'matricula': '12345-6',
      'email': 'camila.souza@email.com',
      'telefone': '(61) 98324-9342',
      'visitas': '45',
      'acompanhamentos': '12',
    },
    {
      'nome': 'Fernanda Lopes',
      'perfil': 'Técnico de referência',
      'local': 'Valparaíso de Goiás',
      'status': 'Ativo',
      'matricula': '12345-6',
      'email': 'camila.souza@email.com',
      'telefone': '(61) 98324-9342',
      'visitas': '45',
      'acompanhamentos': '12',
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

    final profissionaisFiltrados = _profissionais.where((profissional) {
      final nome = profissional['nome']!.toLowerCase();
      final perfil = profissional['perfil']!.toLowerCase();

      final correspondePesquisa =
          nome.contains(termo) || perfil.contains(termo);

      final correspondeFiltro =
          _filtro == 'Todos' || profissional['perfil'] == _filtro;

      return correspondePesquisa && correspondeFiltro;
    }).toList();

    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 20, 17, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Equipe',
                                style: TextStyle(
                                  color: azulEscuro,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Profissionais cadastrados no sistema',
                                style: TextStyle(
                                  color: azulTexto,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TelaNovoProfissional(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.person_add_alt_1, size: 15),
                            label: const Text(
                              'Cadastrar',
                              style: TextStyle(fontSize: 10),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: verde,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // Campo de pesquisa
                    TextField(
                      controller: _pesquisaController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Pesquisar por nome ou função',
                        hintStyle: const TextStyle(
                          color: azulTexto,
                          fontSize: 11,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: azulTexto,
                          size: 20,
                        ),
                        suffixIcon: _pesquisaController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  _pesquisaController.clear();
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 17,
                                  color: azulTexto,
                                ),
                              )
                            : null,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
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
                            width: 1.3,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 13),

                    // Filtros por perfil
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _FiltroEquipe(
                            texto: 'Todos',
                            selecionado: _filtro == 'Todos',
                            aoTocar: () => setState(() {
                              _filtro = 'Todos';
                            }),
                          ),
                          const SizedBox(width: 7),
                          _FiltroEquipe(
                            texto: 'Coordenador',
                            selecionado: _filtro == 'Coordenador',
                            aoTocar: () => setState(() {
                              _filtro = 'Coordenador';
                            }),
                          ),
                          const SizedBox(width: 7),
                          _FiltroEquipe(
                            texto: 'Técnico de referência',
                            selecionado: _filtro == 'Técnico de referência',
                            aoTocar: () => setState(() {
                              _filtro = 'Técnico de referência';
                            }),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 23),

                    // Quantidade de profissionais
                    Text(
                      '${profissionaisFiltrados.length} '
                      '${profissionaisFiltrados.length == 1 ? 'profissional' : 'profissionais'}',
                      style: const TextStyle(
                        color: azulTexto,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 11),

                    // Lista de profissionais
                    if (profissionaisFiltrados.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: Center(
                          child: Text(
                            'Nenhum profissional encontrado.',
                            style: TextStyle(color: azulTexto, fontSize: 12),
                          ),
                        ),
                      )
                    else
                      ...profissionaisFiltrados.map(
                        (profissional) => Padding(
                          padding: const EdgeInsets.only(bottom: 11),
                          child: _CardProfissional(
                            profissional: profissional,
                            aoTocar: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TelaPerfilCoordenador(
                                    nome: profissional['nome']!,
                                    funcao: profissional['perfil']!,
                                    matricula:
                                        profissional['matricula'] ??
                                        'Não informada',
                                    unidade:
                                        profissional['local'] ??
                                        'Não informada',
                                    email:
                                        profissional['email'] ??
                                        'Não informado',
                                    telefone:
                                        profissional['telefone'] ??
                                        'Não informado',
                                    visitas: profissional['visitas'] ?? '0',
                                    acompanhamentos:
                                        profissional['acompanhamentos'] ?? '0',
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
                  _ItemMenuEquipe(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    aoTocar: () =>
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                  ),
                  _ItemMenuEquipe(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    aoTocar: () => _mensagem(context, 'Agenda'),
                  ),
                  _ItemMenuEquipe(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    aoTocar: () => _mensagem(context, 'Famílias'),
                  ),
                  _ItemMenuEquipe(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    selecionado: true,
                    aoTocar: () {},
                  ),
                  _ItemMenuEquipe(
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

class _CardProfissional extends StatelessWidget {
  final Map<String, String> profissional;
  final VoidCallback aoTocar;

  const _CardProfissional({required this.profissional, required this.aoTocar});

  @override
  Widget build(BuildContext context) {
    final nome = profissional['nome']!;
    final perfil = profissional['perfil']!;
    final status = profissional['status']!;

    final iniciais = nome
        .split(' ')
        .where((parte) => parte.isNotEmpty)
        .take(2)
        .map((parte) => parte[0])
        .join()
        .toUpperCase();

    final ativo = status == 'Ativo';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      child: InkWell(
        onTap: aoTocar,
        borderRadius: BorderRadius.circular(13),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD9E2EC)),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.025),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: ativo
                    ? const Color(0xFF174A78)
                    : const Color(0xFF9AAEC7),
                child: Text(
                  iniciais,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(width: 11),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        color: Color(0xFF142A40),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      perfil,
                      style: const TextStyle(
                        color: Color(0xFF647895),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xFF647895),
                          size: 13,
                        ),
                        SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            'Valparaíso de Goiás',
                            style: TextStyle(
                              color: Color(0xFF647895),
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: ativo
                          ? const Color(0xFFE4F5EF)
                          : const Color(0xFFEDF1F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 7,
                          color: ativo
                              ? const Color(0xFF168363)
                              : const Color(0xFF8193A8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: TextStyle(
                            color: ativo
                                ? const Color(0xFF168363)
                                : const Color(0xFF647895),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0xFF647895),
                    size: 20,
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

class _FiltroEquipe extends StatelessWidget {
  final String texto;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _FiltroEquipe({
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
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        decoration: BoxDecoration(
          color: selecionado ? const Color(0xFF008577) : Colors.white,
          border: Border.all(
            color: selecionado
                ? const Color(0xFF008577)
                : const Color(0xFFD9E2EC),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: selecionado ? Colors.white : const Color(0xFF647895),
            fontSize: 9,
            fontWeight: selecionado ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _ItemMenuEquipe extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _ItemMenuEquipe({
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
