import 'package:flutter/material.dart';

const Color verdeEncaminhamento = Color(0xFF008577);
const Color azulEncaminhamento = Color(0xFF142A40);
const Color cinzaEncaminhamento = Color(0xFF647895);
const Color bordaEncaminhamento = Color(0xFFD9E2EC);
const Color fundoEncaminhamento = Color(0xFFF4F7FA);

class TelaResultadoEncaminhamento extends StatelessWidget {
  const TelaResultadoEncaminhamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundoEncaminhamento,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: azulEncaminhamento,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Encaminhamentos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: azulEncaminhamento,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Resultado do encaminhamento da visita',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: cinzaEncaminhamento,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    _cartaoFamilia(),

                    const SizedBox(height: 25),

                    _titulo('Necessita de encaminhamento?'),
                    const SizedBox(height: 9),
                    _respostaSim(),

                    const SizedBox(height: 22),

                    _titulo('Tipo de encaminhamento'),
                    const SizedBox(height: 9),
                    _cartaoInformacao(
                      icone: Icons.local_hospital_outlined,
                      texto: 'Unidade de Saúde',
                    ),

                    const SizedBox(height: 22),

                    _titulo('Descrição / Motivo'),
                    const SizedBox(height: 9),
                    _cartaoDescricao(
                      'Acompanhamento com enfermeiro para avaliação '
                      'de pressão arterial.',
                    ),

                    const SizedBox(height: 22),

                    _titulo('Prioridade'),
                    const SizedBox(height: 9),
                    _prioridade(),

                    const SizedBox(height: 22),

                    _titulo('Responsável pelo encaminhamento'),
                    const SizedBox(height: 9),
                    _cartaoInformacao(
                      icone: Icons.person_outline,
                      texto: 'Camila Souza',
                    ),

                    const SizedBox(height: 22),

                    _titulo('Data sugerida'),
                    const SizedBox(height: 9),
                    _cartaoInformacao(
                      icone: Icons.calendar_month_outlined,
                      texto: '27/05/2024',
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verdeEncaminhamento,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Concluir',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _barraNavegacao(),
          ],
        ),
      ),
    );
  }

  Widget _titulo(String texto) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: azulEncaminhamento,
      ),
    );
  }

  Widget _cartaoFamilia() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: bordaEncaminhamento),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F4F1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.people_outline,
              color: verdeEncaminhamento,
              size: 21,
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Família Oliveira',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: azulEncaminhamento,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Jardim Céu Azul - Casa 14',
                  style: TextStyle(fontSize: 10, color: cinzaEncaminhamento),
                ),
                SizedBox(height: 5),
                Text(
                  '5 membros',
                  style: TextStyle(fontSize: 9, color: verdeEncaminhamento),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _respostaSim() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F4F1),
        border: Border.all(color: verdeEncaminhamento),
        borderRadius: BorderRadius.circular(9),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: verdeEncaminhamento,
            size: 17,
          ),
          SizedBox(width: 9),
          Text(
            'Sim, necessita de encaminhamento',
            style: TextStyle(
              fontSize: 11,
              color: verdeEncaminhamento,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartaoInformacao({required IconData icone, required String texto}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: bordaEncaminhamento),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Icon(icone, color: cinzaEncaminhamento, size: 17),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 11, color: azulEncaminhamento),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartaoDescricao(String texto) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: bordaEncaminhamento),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 11,
          color: azulEncaminhamento,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _prioridade() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F4F1),
        border: Border.all(color: verdeEncaminhamento),
        borderRadius: BorderRadius.circular(9),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: verdeEncaminhamento,
            size: 15,
          ),
          SizedBox(width: 7),
          Text(
            'Média',
            style: TextStyle(
              color: verdeEncaminhamento,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _barraNavegacao() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: bordaEncaminhamento)),
      ),
      child: const SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ItemEncaminhamento(Icons.home_outlined, 'Início'),
              _ItemEncaminhamento(Icons.calendar_month_outlined, 'Agenda'),
              _ItemEncaminhamento(Icons.assignment_outlined, 'Visitas', true),
              _ItemEncaminhamento(Icons.people_outline, 'Famílias'),
              _ItemEncaminhamento(Icons.more_horiz, 'Mais'),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemEncaminhamento extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;

  const _ItemEncaminhamento(
    this.icone,
    this.titulo, [
    this.selecionado = false,
  ]);

  @override
  Widget build(BuildContext context) {
    final cor = selecionado ? verdeEncaminhamento : cinzaEncaminhamento;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: cor, size: 19),
        const SizedBox(height: 3),
        Text(
          titulo,
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
