import 'package:flutter/material.dart';

import 'tela_encaminhamentos.dart';

class TelaObservacoes extends StatefulWidget {
  const TelaObservacoes({super.key});

  @override
  State<TelaObservacoes> createState() => _TelaObservacoesState();
}

class _TelaObservacoesState extends State<TelaObservacoes> {
  final Color verde = const Color(0xFF008577);
  final Color azulEscuro = const Color(0xFF142A40);
  final Color cinza = const Color(0xFF647895);
  final Color borda = const Color(0xFFD9E2EC);

  final TextEditingController observacoesController = TextEditingController();

  final TextEditingController outrosController = TextEditingController();

  String condicaoDomicilio = 'Adequadas';
  String participacaoFamilia = 'Ativa';

  bool cartilha = true;
  bool calendario = true;
  bool hipoclorito = false;
  bool outros = false;

  @override
  void dispose() {
    observacoesController.dispose();
    outrosController.dispose();
    super.dispose();
  }

  Widget opcaoSelecionavel(
    String texto,
    String valorSelecionado,
    Function(String) aoSelecionar,
  ) {
    final selecionado = texto == valorSelecionado;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            aoSelecionar(texto);
          });
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 38),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          decoration: BoxDecoration(
            color: selecionado ? const Color(0xFFEAF7F4) : Colors.white,
            border: Border.all(
              color: selecionado ? verde : borda,
              width: selecionado ? 1.6 : 1,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9.5,
                    color: selecionado ? verde : azulEscuro,
                    fontWeight: selecionado
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (selecionado) ...[
                const SizedBox(width: 3),
                Icon(Icons.check_circle_outline, size: 12, color: verde),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget campoMaterial(
    String texto,
    bool selecionado,
    Function(bool?) aoAlterar,
  ) {
    return InkWell(
      onTap: () {
        aoAlterar(!selecionado);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              height: 20,
              child: Checkbox(
                value: selecionado,
                activeColor: verde,
                side: BorderSide(color: borda, width: 1.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onChanged: aoAlterar,
              ),
            ),
            const SizedBox(width: 7),
            Text(texto, style: TextStyle(fontSize: 11, color: azulEscuro)),
          ],
        ),
      ),
    );
  }

  Widget tituloSecao(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
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
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              border: Border.all(color: borda),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: azulEscuro,
                              size: 19,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Observações',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: azulEscuro,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Registre as observações da visita',
                              style: TextStyle(fontSize: 9, color: cinza),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Cartão da família
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: const Color(0xFFF0F3F6)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.035),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 43,
                            height: 43,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE8F5F2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.people_outline,
                              color: verde,
                              size: 22,
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

                    const SizedBox(height: 14),

                    // Observações
                    tituloSecao('Observações da visita'),

                    Container(
                      height: 72,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: borda),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: observacoesController,
                              maxLength: 500,
                              maxLines: null,
                              expands: true,
                              style: TextStyle(fontSize: 10, color: azulEscuro),
                              decoration: const InputDecoration(
                                hintText: 'Digite as observações da visita...',
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF647895),
                                ),
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
                              '${observacoesController.text.length}/500',
                              style: TextStyle(fontSize: 8, color: cinza),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Condições do domicílio
                    tituloSecao('Condições do domicílio'),

                    Row(
                      children: [
                        opcaoSelecionavel(
                          'Adequadas',
                          condicaoDomicilio,
                          (v) => condicaoDomicilio = v,
                        ),
                        const SizedBox(width: 5),
                        opcaoSelecionavel(
                          'Parcialmente adequadas',
                          condicaoDomicilio,
                          (v) => condicaoDomicilio = v,
                        ),
                        const SizedBox(width: 5),
                        opcaoSelecionavel(
                          'Inadequadas',
                          condicaoDomicilio,
                          (v) => condicaoDomicilio = v,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Participação da família
                    tituloSecao('Participação da família'),

                    Row(
                      children: [
                        opcaoSelecionavel(
                          'Ativa',
                          participacaoFamilia,
                          (v) => participacaoFamilia = v,
                        ),
                        const SizedBox(width: 5),
                        opcaoSelecionavel(
                          'Parcial',
                          participacaoFamilia,
                          (v) => participacaoFamilia = v,
                        ),
                        const SizedBox(width: 5),
                        opcaoSelecionavel(
                          'Baixa',
                          participacaoFamilia,
                          (v) => participacaoFamilia = v,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Materiais
                    tituloSecao('Materiais e orientações fornecidas'),

                    campoMaterial(
                      'Cartilha sobre alimentação saudável',
                      cartilha,
                      (v) => setState(() => cartilha = v ?? false),
                    ),
                    campoMaterial(
                      'Calendário de vacinação',
                      calendario,
                      (v) => setState(() => calendario = v ?? false),
                    ),
                    campoMaterial(
                      'Hipoclorito',
                      hipoclorito,
                      (v) => setState(() => hipoclorito = v ?? false),
                    ),
                    campoMaterial(
                      'Outros materiais',
                      outros,
                      (v) => setState(() => outros = v ?? false),
                    ),

                    if (outros) ...[
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: TextField(
                          controller: outrosController,
                          style: TextStyle(fontSize: 10, color: azulEscuro),
                          decoration: InputDecoration(
                            hintText: 'Especifique...',
                            hintStyle: TextStyle(fontSize: 10, color: cinza),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 9,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(color: borda),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(color: borda),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Botão salvar
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 4, 17, 12),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006B57),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaEncaminhamentos(),
                      ),
                    );
                  },
                  child: const Text(
                    'Salvar e continuar',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // Menu inferior
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: borda.withValues(alpha: 0.6)),
                ),
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
