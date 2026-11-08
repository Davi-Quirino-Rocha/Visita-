import 'package:flutter/material.dart';

const Color verdeVisita = Color(0xFF008577);
const Color azulVisita = Color(0xFF142A40);
const Color cinzaVisita = Color(0xFF647895);
const Color bordaVisita = Color(0xFFD9E2EC);
const Color fundoVisita = Color(0xFFF4F7FA);

class TelaNovaVisita extends StatefulWidget {
  final String nomeFamilia;
  final String enderecoFamilia;

  const TelaNovaVisita({
    super.key,
    this.nomeFamilia = 'Família Oliveira',
    this.enderecoFamilia = 'Jardim Céu Azul - casa 14',
  });

  @override
  State<TelaNovaVisita> createState() => _TelaNovaVisitaState();
}

class _TelaNovaVisitaState extends State<TelaNovaVisita> {
  final _formKey = GlobalKey<FormState>();
  final _objetivoController = TextEditingController();

  DateTime _data = DateTime(2024, 5, 20);
  TimeOfDay _inicio = const TimeOfDay(hour: 9, minute: 30);
  TimeOfDay _fim = const TimeOfDay(hour: 10, minute: 15);

  String _local = 'Residência da família';
  String _tipo = 'Visita domiciliar';

  @override
  void dispose() {
    _objetivoController.dispose();
    super.dispose();
  }

  String _formatarData(DateTime data) {
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    return '$dia/$mes/${data.year}';
  }

  String _formatarHora(TimeOfDay hora) {
    final h = hora.hour.toString().padLeft(2, '0');
    final m = hora.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  Future<void> _selecionarData() async {
    final dataSelecionada = await showDatePicker(
      context: context,
      initialDate: _data,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      locale: const Locale('pt', 'BR'),
    );

    if (dataSelecionada != null) {
      setState(() => _data = dataSelecionada);
    }
  }

  Future<void> _selecionarHora({required bool inicio}) async {
    final horaSelecionada = await showTimePicker(
      context: context,
      initialTime: inicio ? _inicio : _fim,
    );

    if (horaSelecionada != null) {
      setState(() {
        if (inicio) {
          _inicio = horaSelecionada;
        } else {
          _fim = horaSelecionada;
        }
      });
    }
  }

  void _salvarVisita() {
    if (!_formKey.currentState!.validate()) return;

    final inicioMinutos = _inicio.hour * 60 + _inicio.minute;
    final fimMinutos = _fim.hour * 60 + _fim.minute;

    if (fimMinutos <= inicioMinutos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O horário de término deve ser depois do início.'),
        ),
      );
      return;
    }

    // Volta para a tela anterior, que é a Agenda.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundoVisita,
      body: SafeArea(
        child: Column(
          children: [
            // CABEÇALHO
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 16, 12),
              child: Row(
                children: [
                  _BotaoVoltar(aoTocar: () => Navigator.pop(context)),
                  const SizedBox(width: 10),
                  const Text(
                    'Nova Visita',
                    style: TextStyle(
                      color: azulVisita,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // FORMULÁRIO COM ROLAGEM
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
                  children: [
                    // FAMÍLIA SELECIONADA
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: bordaVisita),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.025),
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7F4F1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.people_outline,
                              color: verdeVisita,
                              size: 21,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.nomeFamilia,
                                  style: TextStyle(
                                    color: azulVisita,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  widget.enderecoFamilia,
                                  style: TextStyle(
                                    color: cinzaVisita,
                                    fontSize: 9,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '♧ 5 membros',
                                  style: TextStyle(
                                    color: verdeVisita,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    const _TituloSecao(titulo: 'Dados da visita'),
                    const SizedBox(height: 7),

                    // DATA E HORÁRIOS
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: bordaVisita),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        children: [
                          _CampoAgenda(
                            icone: Icons.calendar_today_outlined,
                            rotulo: 'Data da visita',
                            valor: _formatarData(_data),
                            aoTocar: _selecionarData,
                          ),
                          const Divider(height: 1, color: bordaVisita),
                          _CampoAgenda(
                            icone: Icons.access_time,
                            rotulo: 'Horário de início',
                            valor: _formatarHora(_inicio),
                            aoTocar: () => _selecionarHora(inicio: true),
                          ),
                          const Divider(height: 1, color: bordaVisita),
                          _CampoAgenda(
                            icone: Icons.access_time,
                            rotulo: 'Horário de término',
                            valor: _formatarHora(_fim),
                            aoTocar: () => _selecionarHora(inicio: false),
                          ),
                          const Divider(height: 1, color: bordaVisita),

                          // LOCAL
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.home_outlined,
                                  color: verdeVisita,
                                  size: 17,
                                ),
                                const SizedBox(width: 9),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Local da visita',
                                        style: TextStyle(
                                          color: cinzaVisita,
                                          fontSize: 9,
                                        ),
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: _local,
                                          isExpanded: true,
                                          isDense: true,
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: cinzaVisita,
                                            size: 16,
                                          ),
                                          style: const TextStyle(
                                            color: azulVisita,
                                            fontSize: 10,
                                          ),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Residência da família',
                                              child: Text(
                                                'Residência da família',
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Unidade do CRAS',
                                              child: Text('Unidade do CRAS'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Outro local',
                                              child: Text('Outro local'),
                                            ),
                                          ],
                                          onChanged: (valor) {
                                            if (valor != null) {
                                              setState(() => _local = valor);
                                            }
                                          },
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

                    const SizedBox(height: 15),

                    const _TituloSecao(titulo: 'Tipo de visita'),
                    const SizedBox(height: 7),

                    // TIPOS DE VISITA
                    Row(
                      children: [
                        Expanded(
                          child: _OpcaoVisita(
                            titulo: 'Visita domiciliar',
                            icone: Icons.home_outlined,
                            selecionado: _tipo == 'Visita domiciliar',
                            aoTocar: () {
                              setState(() => _tipo = 'Visita domiciliar');
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _OpcaoVisita(
                            titulo: 'Visita na unidade',
                            icone: Icons.location_city_outlined,
                            selecionado: _tipo == 'Visita na unidade',
                            aoTocar: () {
                              setState(() => _tipo = 'Visita na unidade');
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    const _TituloSecao(titulo: 'Objetivo da visita'),
                    const SizedBox(height: 7),

                    // OBJETIVO
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: bordaVisita),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextFormField(
                        controller: _objetivoController,
                        maxLines: 4,
                        maxLength: 200,
                        validator: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Informe o objetivo da visita.';
                          }
                          return null;
                        },
                        style: const TextStyle(color: azulVisita, fontSize: 10),
                        decoration: const InputDecoration(
                          hintText: 'Descreva o objetivo da visita...',
                          hintStyle: TextStyle(
                            color: cinzaVisita,
                            fontSize: 10,
                          ),
                          contentPadding: EdgeInsets.all(12),
                          border: InputBorder.none,
                          counterStyle: TextStyle(
                            color: cinzaVisita,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 13),

                    // SALVAR
                    SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: ElevatedButton(
                        onPressed: _salvarVisita,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006B57),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
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
                border: Border(top: BorderSide(color: bordaVisita)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemInferior(icone: Icons.home_outlined, titulo: 'Início'),
                  _ItemInferior(
                    icone: Icons.calendar_month_outlined,
                    titulo: 'Agenda',
                  ),
                  _ItemInferior(
                    icone: Icons.assignment_outlined,
                    titulo: 'Visitas',
                    selecionado: true,
                  ),
                  _ItemInferior(
                    icone: Icons.people_outline,
                    titulo: 'Famílias',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TituloSecao extends StatelessWidget {
  final String titulo;

  const _TituloSecao({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        color: azulVisita,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _BotaoVoltar extends StatelessWidget {
  final VoidCallback aoTocar;

  const _BotaoVoltar({required this.aoTocar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoTocar,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: bordaVisita),
          borderRadius: BorderRadius.circular(9),
        ),
        child: const Icon(Icons.arrow_back, color: azulVisita, size: 17),
      ),
    );
  }
}

class _CampoAgenda extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final String valor;
  final VoidCallback aoTocar;

  const _CampoAgenda({
    required this.icone,
    required this.rotulo,
    required this.valor,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoTocar,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          children: [
            Icon(icone, color: verdeVisita, size: 16),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rotulo,
                    style: const TextStyle(color: cinzaVisita, fontSize: 8),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    valor,
                    style: const TextStyle(
                      color: azulVisita,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              rotulo == 'Data da visita'
                  ? Icons.calendar_month_outlined
                  : Icons.access_time,
              color: cinzaVisita,
              size: 13,
            ),
          ],
        ),
      ),
    );
  }
}

class _OpcaoVisita extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final bool selecionado;
  final VoidCallback aoTocar;

  const _OpcaoVisita({
    required this.titulo,
    required this.icone,
    required this.selecionado,
    required this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: aoTocar,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        decoration: BoxDecoration(
          color: selecionado ? const Color(0xFFE7F4F1) : Colors.white,
          border: Border.all(
            color: selecionado ? verdeVisita : bordaVisita,
            width: selecionado ? 1.4 : 1,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Icon(
              icone,
              color: selecionado ? verdeVisita : cinzaVisita,
              size: 14,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                titulo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: selecionado ? verdeVisita : cinzaVisita,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              selecionado
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selecionado ? verdeVisita : bordaVisita,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemInferior extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool selecionado;

  const _ItemInferior({
    required this.icone,
    required this.titulo,
    this.selecionado = false,
  });

  @override
  Widget build(BuildContext context) {
    final cor = selecionado ? verdeVisita : cinzaVisita;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: cor, size: 17),
        const SizedBox(height: 3),
        Text(
          titulo,
          style: TextStyle(
            color: cor,
            fontSize: 8,
            fontWeight: selecionado ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
