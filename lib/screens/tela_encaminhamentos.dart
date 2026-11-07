import 'package:flutter/material.dart';

class TelaEncaminhamentos extends StatefulWidget {
  const TelaEncaminhamentos({super.key});

  @override
  State<TelaEncaminhamentos> createState() => _TelaEncaminhamentosState();
}

class _TelaEncaminhamentosState extends State<TelaEncaminhamentos> {
  final Color verde = const Color(0xFF008577);
  final Color azulEscuro = const Color(0xFF142A40);
  final Color cinza = const Color(0xFF647895);
  final Color borda = const Color(0xFFD9E2EC);

  bool necessitaEncaminhamento = true;

  String tipoEncaminhamento = 'Unidade de Saúde';
  String prioridade = 'Média';
  String responsavel = 'Camila Souza';

  DateTime dataSugerida = DateTime(2024, 5, 27);

  final TextEditingController descricaoController = TextEditingController(
    text: 'Acompanhamento com enfermeiro para avaliação de pressão arterial.',
  );

  @override
  void dispose() {
    descricaoController.dispose();
    super.dispose();
  }

  String formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/'
        '${data.month.toString().padLeft(2, '0')}/'
        '${data.year}';
  }

  Widget tituloSecao(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        texto,
        style: TextStyle(
          color: azulEscuro,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget opcao(
    String texto,
    String selecionado,
    Function(String) aoSelecionar,
  ) {
    final bool ativo = texto == selecionado;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            aoSelecionar(texto);
          });
        },
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ativo ? const Color(0xFFEAF7F4) : Colors.white,
            border: Border.all(
              color: ativo ? verde : borda,
              width: ativo ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                texto,
                style: TextStyle(
                  fontSize: 9,
                  color: ativo ? verde : azulEscuro,
                  fontWeight: ativo ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              if (ativo) ...[
                const SizedBox(width: 4),
                Icon(Icons.check_circle_outline, size: 12, color: verde),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget campoDropdown({
    required String valor,
    required List<String> opcoes,
    required Function(String?) aoAlterar,
  }) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borda),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: valor,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, size: 17, color: cinza),
          style: TextStyle(fontSize: 9, color: azulEscuro),
          items: opcoes.map((item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: aoAlterar,
        ),
      ),
    );
  }

  Future<void> selecionarData() async {
    final DateTime? escolhida = await showDatePicker(
      context: context,
      initialDate: dataSugerida,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      locale: const Locale('pt', 'BR'),
    );

    if (escolhida != null) {
      setState(() {
        dataSugerida = escolhida;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 10, 17, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: BorderRadius.circular(11),
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              border: Border.all(color: borda),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 19,
                              color: azulEscuro,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Encaminhamentos',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: azulEscuro,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Defina encaminhamentos da visita',
                              style: TextStyle(fontSize: 9, color: cinza),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Cartão da família
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFF0F3F6)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 9,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE8F5F2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.people_outline,
                              color: verde,
                              size: 21,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Família Oliveira',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: azulEscuro,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 11,
                                      color: cinza,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      'Jardim Céu Azul – Casa 14',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: cinza,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEAF8F1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '♧ 5 membros',
                                    style: TextStyle(fontSize: 8, color: verde),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 13),

                    // Necessita de encaminhamento?
                    tituloSecao('Necessita de encaminhamento?'),

                    Row(
                      children: [
                        opcao(
                          'Sim',
                          necessitaEncaminhamento ? 'Sim' : 'Não',
                          (v) => necessitaEncaminhamento = v == 'Sim',
                        ),
                        const SizedBox(width: 7),
                        opcao(
                          'Não',
                          necessitaEncaminhamento ? 'Sim' : 'Não',
                          (v) => necessitaEncaminhamento = v == 'Sim',
                        ),
                      ],
                    ),

                    if (necessitaEncaminhamento) ...[
                      const SizedBox(height: 12),

                      // Tipo de encaminhamento
                      tituloSecao('Tipo de encaminhamento'),

                      campoDropdown(
                        valor: tipoEncaminhamento,
                        opcoes: [
                          'Unidade de Saúde',
                          'Assistência Social',
                          'CRAS',
                          'CREAS',
                          'Conselho Tutelar',
                          'Outro',
                        ],
                        aoAlterar: (v) {
                          if (v != null) {
                            setState(() {
                              tipoEncaminhamento = v;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 12),

                      // Descrição
                      tituloSecao('Descrição / Motivo'),

                      Container(
                        height: 72,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: borda),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: descricaoController,
                                maxLength: 300,
                                maxLines: null,
                                expands: true,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: azulEscuro,
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Descreva o motivo...',
                                  hintStyle: TextStyle(fontSize: 10),
                                  border: InputBorder.none,
                                  counterText: '',
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${descricaoController.text.length}/300',
                                style: TextStyle(fontSize: 8, color: cinza),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Prioridade
                      tituloSecao('Prioridade'),

                      Row(
                        children: [
                          opcao('Baixa', prioridade, (v) => prioridade = v),
                          const SizedBox(width: 6),
                          opcao('Média', prioridade, (v) => prioridade = v),
                          const SizedBox(width: 6),
                          opcao('Alta', prioridade, (v) => prioridade = v),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Responsável
                      tituloSecao('Responsável pelo encaminhamento'),

                      campoDropdown(
                        valor: responsavel,
                        opcoes: [
                          'Camila Souza',
                          'João Silva',
                          'Maria Oliveira',
                          'Pedro Santos',
                        ],
                        aoAlterar: (v) {
                          if (v != null) {
                            setState(() {
                              responsavel = v;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 12),

                      // Data sugerida
                      tituloSecao('Data sugerida'),

                      GestureDetector(
                        onTap: selecionarData,
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: borda),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: cinza,
                                size: 14,
                              ),
                              const Spacer(),
                              Text(
                                formatarData(dataSugerida),
                                style: TextStyle(
                                  fontSize: 9,
                                  color: azulEscuro,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 12),

                    // Botão salvar
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                necessitaEncaminhamento
                                    ? 'Encaminhamento registrado com sucesso!'
                                    : 'Visita finalizada sem encaminhamento!',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006B57),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: const Text(
                          'Salvar e finalizar',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu inferior
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: borda.withOpacity(0.6))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _itemMenu(Icons.home_outlined, 'Início', false),
                  _itemMenu(Icons.calendar_month_outlined, 'Agenda', false),
                  _itemMenu(Icons.assignment_outlined, 'Visitas', true),
                  _itemMenu(Icons.people_outline, 'Famílias', false),
                  _itemMenu(Icons.more_horiz, 'Mais', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemMenu(IconData icone, String texto, bool selecionado) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 17,
          color: selecionado ? verde : const Color(0xFF91A4BD),
        ),
        const SizedBox(height: 3),
        Text(
          texto,
          style: TextStyle(
            fontSize: 8,
            color: selecionado ? verde : const Color(0xFF91A4BD),
            fontWeight: selecionado ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
