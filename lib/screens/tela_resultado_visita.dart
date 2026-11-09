import 'package:flutter/material.dart';

import 'tela_resultado_encaminhamento.dart';

const Color verdeResultado = Color(0xFF008577);
const Color azulResultado = Color(0xFF142A40);
const Color cinzaResultado = Color(0xFF647895);
const Color bordaResultado = Color(0xFFD9E2EC);
const Color fundoResultado = Color(0xFFF4F7FA);

class TelaResultadoVisita extends StatelessWidget {
  const TelaResultadoVisita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundoResultado,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resultado da visita',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: azulResultado,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Resumo do atendimento realizado',
                      style: TextStyle(fontSize: 12, color: cinzaResultado),
                    ),

                    const SizedBox(height: 25),

                    _titulo('Família'),
                    const SizedBox(height: 10),
                    _cartaoFamilia(),

                    const SizedBox(height: 24),

                    _titulo('Observações da visita'),
                    const SizedBox(height: 10),
                    _cartaoTexto(
                      'Família receptiva e participativa. '
                      'Dúvidas sanadas sobre alimentação saudável '
                      'e calendário vacinal.',
                    ),

                    const SizedBox(height: 22),

                    _titulo('Condições do domicílio'),
                    const SizedBox(height: 10),
                    _resultado('Adequadas'),

                    const SizedBox(height: 22),

                    _titulo('Participação da família'),
                    const SizedBox(height: 10),
                    _resultado('Ativa'),

                    const SizedBox(height: 22),

                    _titulo('Materiais e orientações fornecidas'),
                    const SizedBox(height: 10),

                    _material('Cartilha sobre alimentação saudável', true),
                    _material('Calendário de vacinação', true),
                    _material('Hipoclorito', false),
                    _material('Outros materiais', false),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TelaResultadoEncaminhamento(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verdeResultado,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Ver resultado do encaminhamento',
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
        color: azulResultado,
      ),
    );
  }

  Widget _cartaoFamilia() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: bordaResultado),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F4F1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.people_outline, color: verdeResultado),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Família Oliveira',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: azulResultado,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Jardim Céu Azul - Casa 14',
                  style: TextStyle(fontSize: 10, color: cinzaResultado),
                ),
                SizedBox(height: 5),
                Text(
                  '5 membros',
                  style: TextStyle(fontSize: 9, color: verdeResultado),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartaoTexto(String texto) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: bordaResultado),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 11, color: azulResultado, height: 1.5),
      ),
    );
  }

  Widget _resultado(String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F4F1),
        border: Border.all(color: verdeResultado),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: verdeResultado, size: 16),
          const SizedBox(width: 7),
          Text(
            texto,
            style: const TextStyle(
              color: verdeResultado,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _material(String texto, bool fornecido) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            fornecido ? Icons.check_box : Icons.check_box_outline_blank,
            color: fornecido ? verdeResultado : bordaResultado,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 11, color: cinzaResultado),
            ),
          ),
        ],
      ),
    );
  }
}
