import 'package:flutter/material.dart';

import 'tela_informacoes_visita.dart';

class TelaDetalhesFamilia extends StatelessWidget {
  final String nome;
  final String endereco;

  const TelaDetalhesFamilia({
    super.key,
    this.nome = 'Família Oliveira',
    this.endereco = 'Jardim Céu Azul - casa 14',
  });

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
                      'Detalhes da família',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Informações da família',
                      style: TextStyle(color: azulTexto, fontSize: 11),
                    ),
                    const SizedBox(height: 27),

                    // Identificação da família
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borda),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD8EFEB),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.family_restroom,
                              color: verde,
                              size: 34,
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
                                    color: azulEscuro,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: azulTexto,
                                      size: 13,
                                    ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        endereco,
                                        style: const TextStyle(
                                          color: azulTexto,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEAF5F2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        color: verde,
                                        size: 11,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '5 membros',
                                        style: TextStyle(
                                          color: verde,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      'Dados da família',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 19),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borda),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: const Column(
                        children: [
                          _InformacaoFamilia(
                            icone: Icons.home,
                            titulo: 'Endereço',
                            descricao: 'Quadra 04, Casa 14 -\nJardim Céu Azul - Gama/DF',
                          ),
                          _InformacaoFamilia(
                            icone: Icons.call,
                            titulo: 'Telefone',
                            descricao: '(61) 99999-0000',
                          ),
                          _InformacaoFamilia(
                            icone: Icons.person,
                            titulo: 'Responsável familiar',
                            descricao: 'Maria Oliveira (Mãe)',
                          ),
                          _InformacaoFamilia(
                            icone: Icons.receipt_long,
                            titulo: 'CPF do responsável',
                            descricao: '000.000.000-00',
                          ),
                          _InformacaoFamilia(
                            icone: Icons.info,
                            titulo: 'Observações',
                            descricao: 'Família acompanhada\ndesde 04/2024',
                            ultima: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TelaInformacoesVisita(),
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
                          'Informações da visita',
                          style: TextStyle(fontSize: 13),
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
                  _ItemMenuDetalhes(
                    icone: Icons.home_outlined,
                    titulo: 'Início',
                    aoTocar: () =>
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                  ),
                  _ItemMenuDetalhes(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                    aoTocar: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Abra a Agenda pela barra inferior da Home.',
                          ),
                        ),
                      );
                    },
                  ),
                  _ItemMenuDetalhes(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                    selecionado: true,
                    aoTocar: () => Navigator.of(context).pop(),
                  ),
                  _ItemMenuDetalhes(
                    icone: Icons.groups_outlined,
                    titulo: 'Equipe',
                    aoTocar: () => _mensagem(context, 'Equipe'),
                  ),
                  _ItemMenuDetalhes(
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

class _InformacaoFamilia extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final bool ultima;

  const _InformacaoFamilia({
    required this.icone,
    required this.titulo,
    required this.descricao,
    this.ultima = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: ultima
            ? null
            : const Border(
                bottom: BorderSide(color: TelaDetalhesFamilia.borda),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            child: Icon(icone, color: TelaDetalhesFamilia.verde, size: 23),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: TelaDetalhesFamilia.azulEscuro,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  descricao,
                  style: const TextStyle(
                    color: TelaDetalhesFamilia.azulTexto,
                    fontSize: 10,
                    height: 1.35,
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

class _ItemMenuDetalhes extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _ItemMenuDetalhes({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado
        ? TelaDetalhesFamilia.verde
        : TelaDetalhesFamilia.azulTexto;

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
