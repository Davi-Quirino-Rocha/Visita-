import 'package:flutter/material.dart';

import 'tela_profissional_cadastro.dart';

class TelaNovoProfissional extends StatefulWidget {
  const TelaNovoProfissional({super.key});

  @override
  State<TelaNovoProfissional> createState() => _TelaNovoProfissionalState();
}

class _TelaNovoProfissionalState extends State<TelaNovoProfissional> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();

  String _perfil = 'Técnico de referência';

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const fundo = Color(0xFFF3F7FA);
  static const borda = Color(0xFFD9E2EC);
  static const azulPainel = Color(0xFFEAF1F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 19,
                      color: azulEscuro,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: borda),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: const Size(40, 40),
                    ),
                  ),
                  const SizedBox(width: 9),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Novo profissional',
                          style: TextStyle(
                            color: azulEscuro,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Cadastro feito pelo Coordenador',
                          style: TextStyle(color: azulTexto, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Formulário rolável
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 13, 17, 14),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dados de acesso',
                        style: TextStyle(
                          color: azulEscuro,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Use apenas informações institucionais. A senha provisória será enviada por e-mail.',
                        style: TextStyle(
                          color: azulTexto,
                          fontSize: 10,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 10),

                      _campo(
                        titulo: 'Nome completo',
                        dica: 'Digite o nome do profissional',
                        icone: Icons.person_outline,
                        controller: _nomeController,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o nome completo';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _campo(
                        titulo: 'E-mail institucional',
                        dica: 'nome@instituicao.gov.br',
                        icone: Icons.mail_outline,
                        controller: _emailController,
                        teclado: TextInputType.emailAddress,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o e-mail institucional';
                          }
                          if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(valor.trim())) {
                            return 'Digite um e-mail válido';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _campo(
                        titulo: 'CPF',
                        dica: '000.000.000-00',
                        icone: Icons.person_outline,
                        controller: _cpfController,
                        teclado: TextInputType.number,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o CPF';
                          }
                          if (valor.replaceAll(RegExp(r'\D'), '').length !=
                              11) {
                            return 'O CPF deve ter 11 números';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _campo(
                        titulo: 'Telefone',
                        dica: '(61) 99999-0000',
                        icone: Icons.person_outline,
                        controller: _telefoneController,
                        teclado: TextInputType.phone,
                        validador: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o telefone';
                          }
                          if (valor.replaceAll(RegExp(r'\D'), '').length < 10) {
                            return 'Digite um telefone válido';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Perfil de acesso',
                        style: TextStyle(
                          color: azulEscuro,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),

                      Container(
                        height: 41,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: verde),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _perfil,
                            isExpanded: true,
                            icon: const Icon(
                              Icons.chevron_right,
                              color: azulTexto,
                              size: 19,
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Técnico de referência',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.card_travel_outlined,
                                      color: verde,
                                      size: 15,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      'Técnico de referência',
                                      style: TextStyle(
                                        color: azulTexto,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Coordenador',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.admin_panel_settings_outlined,
                                      color: verde,
                                      size: 15,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      'Coordenador',
                                      style: TextStyle(
                                        color: azulTexto,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            onChanged: (valor) {
                              if (valor != null) {
                                setState(() => _perfil = valor);
                              }
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Permissões do perfil
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: azulPainel,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.verified_user_outlined,
                                  color: Color(0xFF174A78),
                                  size: 14,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Permissões do perfil',
                                  style: TextStyle(
                                    color: Color(0xFF174A78),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ..._permissoes.map(
                              (permissao) => Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.check,
                                      color: verde,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(
                                        permissao,
                                        style: const TextStyle(
                                          color: Color(0xFF174A78),
                                          fontSize: 9,
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

                      const SizedBox(height: 17),

                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: _cadastrar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: verde,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cadastrar profissional',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),

                      const SizedBox(height: 3),

                      SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: verde, fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const _permissoes = [
    'Consultar visitas atribuídas',
    'Registrar atendimento e encaminhamento',
    'Solicitar retorno ao Coordenador',
  ];

  Widget _campo({
    required String titulo,
    required String dica,
    required IconData icone,
    required TextEditingController controller,
    required String? Function(String?) validador,
    TextInputType teclado = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: azulEscuro,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 41,
          child: TextFormField(
            controller: controller,
            keyboardType: teclado,
            validator: validador,
            style: const TextStyle(color: azulEscuro, fontSize: 11),
            decoration: InputDecoration(
              hintText: dica,
              helperText: ' ',
              helperStyle: const TextStyle(fontSize: 11),
              hintStyle: const TextStyle(color: azulTexto, fontSize: 11),
              prefixIcon: Icon(icone, color: azulTexto, size: 15),
              prefixIconConstraints: const BoxConstraints(minWidth: 30),
              errorMaxLines: 2,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: borda),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: borda),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: verde),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _cadastrar() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TelaProfissionalCadastrado()),
    );
  }
}
