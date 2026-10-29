import 'package:flutter/material.dart';

import 'tela_nova_visita.dart';

const Color verde = Color(0xFF008577);
const Color azulEscuro = Color(0xFF142A40);
const Color azulTexto = Color(0xFF647895);
const Color borda = Color(0xFFD9E2EC);
const Color fundo = Color(0xFFF4F7FA);

class TelaAgendaTecnico extends StatelessWidget {
  const TelaAgendaTecnico({super.key});

  @override
  Widget build(BuildContext context) {
    final visitas = [
      {
        'horario': '09:30',
        'familia': 'Família Oliveira',
        'endereco': 'Jardim Céu Azul - 2,4 km',
        'tipo': 'Visita domiciliar',
      },
      {
        'horario': '13:30',
        'familia': 'Família Santos',
        'endereco': 'Etapa A, Casa 06 · Valparaíso de Goiás',
        'tipo': 'Acompanhamento',
      },
      {
        'horario': '16:00',
        'familia': 'Família Almeida',
        'endereco': 'Parque Esplanada III · Valparaíso de Goiás',
        'tipo': 'Primeira visita',
      },
    ];

    return Scaffold(
      backgroundColor: fundo,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CABEÇALHO
                    const Text(
                      'Agenda',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Visitas atribuídas a Camila Souza.',
                      style: TextStyle(color: azulTexto, fontSize: 12),
                    ),

                    const SizedBox(height: 20),

                    // RESUMO DA AGENDA
                    Row(
                      children: [
                        Expanded(
                          child: _CartaoResumo(
                            icone: Icons.calendar_month_outlined,
                            quantidade: '03',
                            titulo: 'Visitas hoje',
                            cor: const Color(0xFFE3F3F0),
                            corIcone: verde,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _CartaoResumo(
                            icone: Icons.key_outlined,
                            quantidade: '01',
                            titulo: 'Retorno pendente',
                            cor: const Color(0xFFFFF0D5),
                            corIcone: const Color(0xFFB7791F),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // BOTÃO AGENDAR
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TelaNovaVisita(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Agendar nova visita',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.chevron_right, size: 20),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // TÍTULO DA LISTA
                    const Text(
                      'Visitas de hoje',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // LISTA DE VISITAS
                    ...visitas.map(
                      (visita) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _CartaoVisita(
                          horario: visita['horario']!,
                          familia: visita['familia']!,
                          endereco: visita['endereco']!,
                          tipo: visita['tipo']!,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // VER TODAS AS VISITAS
                    Container(
                      width: double.infinity,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borda),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'A tela com todas as visitas será implementada depois.',
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.description_outlined,
                              color: verde,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Ver todas as visitas',
                              style: TextStyle(color: azulEscuro, fontSize: 11),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right,
                              color: azulEscuro,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // MENU INFERIOR
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: borda)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 9),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemMenu(icone: Icons.home_outlined, texto: 'Início'),
                  _ItemMenu(
                    icone: Icons.calendar_month_outlined,
                    texto: 'Agenda',
                    selecionado: true,
                  ),
                  _ItemMenu(icone: Icons.people_outline, texto: 'Famílias'),
                  _ItemMenu(icone: Icons.groups_outlined, texto: 'Equipe'),
                  _ItemMenu(icone: Icons.more_horiz, texto: 'Mais'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CARTÃO DE RESUMO

class _CartaoResumo extends StatelessWidget {
  final IconData icone;
  final String quantidade;
  final String titulo;
  final Color cor;
  final Color corIcone;

  const _CartaoResumo({
    required this.icone,
    required this.quantidade,
    required this.titulo,
    required this.cor,
    required this.corIcone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borda),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icone, color: corIcone, size: 17),
          ),

          const SizedBox(width: 7),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quantidade,
                  style: const TextStyle(
                    color: azulEscuro,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  titulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: azulTexto, fontSize: 8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// CARTÃO DE CADA VISITA

class _CartaoVisita extends StatelessWidget {
  final String horario;
  final String familia;
  final String endereco;
  final String tipo;

  const _CartaoVisita({
    required this.horario,
    required this.familia,
    required this.endereco,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borda),
        borderRadius: BorderRadius.circular(12),
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
          // HORÁRIO E STATUS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                horario,
                style: const TextStyle(
                  color: azulEscuro,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE4F5EF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Confirmada',
                  style: TextStyle(
                    color: verde,
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // NOME DA FAMÍLIA
          Text(
            familia,
            style: const TextStyle(
              color: azulEscuro,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          // ENDEREÇO
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: azulTexto,
                size: 13,
              ),

              const SizedBox(width: 3),

              Expanded(
                child: Text(
                  endereco,
                  style: const TextStyle(color: azulTexto, fontSize: 9),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // TIPO E DETALHES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  tipo,
                  style: const TextStyle(color: azulTexto, fontSize: 9),
                ),
              ),

              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Detalhes de $familia serão implementados depois.',
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ver detalhes',
                      style: TextStyle(
                        color: verde,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: verde, size: 17),
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

// ITEM DO MENU INFERIOR

class _ItemMenu extends StatelessWidget {
  final IconData icone;
  final String texto;
  final bool selecionado;

  const _ItemMenu({
    required this.icone,
    required this.texto,
    this.selecionado = false,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado ? verde : azulTexto;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: cor, size: 19),

        const SizedBox(height: 4),

        Text(
          texto,
          style: TextStyle(
            color: cor,
            fontSize: 9,
            fontWeight: selecionado ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
