import 'package:flutter/material.dart';

class TelaPerfilCoordenador extends StatelessWidget {
  final String nome;
  final String matricula;
  final String unidade;
  final String funcao;
  final String email;
  final String telefone;
  final String visitas;
  final String acompanhamentos;

  const TelaPerfilCoordenador({
    super.key,
    this.nome = 'Renato Santos',
    this.matricula = '12345-6',
    this.unidade = 'CRAS Gama',
    this.funcao = 'Coordenador',
    this.email = 'renato.silva@instituicao.gov.br',
    this.telefone = '(61) 98324-9342',
    this.visitas = '128',
    this.acompanhamentos = '12',
  });

  static const verde = Color(0xFF008577);

  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const borda = Color(0xFFD9E2EC);
  static const fundo = Color(0xFFF4F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(17, 16, 17, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Perfil do profissional',
                      style: TextStyle(
                        color: azulEscuro,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'Seus dados e configurações',
                      style: TextStyle(color: azulTexto, fontSize: 11),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFF072C5C),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TelaPerfilCoordenador(
                                        nome: 'Camila Souza',
                                        matricula: '12345-6',
                                        unidade: 'CRAS Gama',
                                        funcao: 'Técnica de referência',
                                        email: 'camila.souza@gmail.com',
                                        telefone: '(61) 98324-9342',
                                        visitas: '45',
                                        acompanhamentos: '12',
                                      ),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xFF092D55),
                              child: Text(
                                'CS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Camila Souza',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Dados Profissionais',
                      style: TextStyle(
                        color: azulEscuro,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),

                    _card([
                      _linha(Icons.badge_outlined, 'Matrícula:', matricula),
                      _divider(),
                      _linha(Icons.location_on_outlined, 'Unidade:', unidade),
                      _divider(),
                      _linha(Icons.work_outline, 'Função:', funcao),
                    ]),

                    const SizedBox(height: 16),

                    const Text(
                      'Contatos',
                      style: TextStyle(
                        color: azulEscuro,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),

                    _card([
                      _linha(Icons.email_outlined, '', email),
                      _divider(),
                      _linha(Icons.phone_outlined, '', telefone),
                    ]),

                    const SizedBox(height: 16),

                    const Text(
                      'Visitas Concluídas',
                      style: TextStyle(
                        color: azulEscuro,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borda),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: _IndicadorPerfil(
                              icone: Icons.check_circle_outline,
                              valor: '128',
                              texto: 'Visitas concluídas',
                              cor: verde,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: VerticalDivider(color: borda),
                          ),
                          Expanded(
                            child: _IndicadorPerfil(
                              icone: Icons.people_outline,
                              valor: '12',
                              texto: 'Profissionais ativos',
                              cor: verde,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Alteração de senha será implementada depois.',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: verde,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Alterar senha',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Edição do perfil será implementada depois.',
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: verde,
                          side: const BorderSide(color: verde),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Editar perfil',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: borda)),
              ),
              padding: const EdgeInsets.fromLTRB(5, 7, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ItemMenu(Icons.home_outlined, 'Início', false),
                  _ItemMenu(Icons.calendar_month_outlined, 'Agenda', false),
                  _ItemMenu(Icons.people_outline, 'Famílias', false),
                  _ItemMenu(Icons.groups_outlined, 'Equipe', false),
                  _ItemMenu(Icons.more_horiz, 'Mais', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _card(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borda),
      ),
      child: Column(children: children),
    );
  }

  static Widget _divider() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Divider(height: 1),
  );

  static Widget _linha(IconData icone, String titulo, String valor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icone, color: verde, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (titulo.isNotEmpty)
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 10, color: azulTexto),
                ),
              Text(
                valor,
                style: const TextStyle(
                  fontSize: 12,
                  color: azulEscuro,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IndicadorPerfil extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String texto;
  final Color cor;

  const _IndicadorPerfil({
    required this.icone,
    required this.valor,
    required this.texto,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icone, color: cor, size: 26),
        const SizedBox(height: 8),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: TelaPerfilCoordenador.azulEscuro,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            color: TelaPerfilCoordenador.azulTexto,
          ),
        ),
      ],
    );
  }
}

class _ItemMenu extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool ativo;

  const _ItemMenu(this.icone, this.titulo, this.ativo);

  @override
  Widget build(BuildContext context) {
    final cor = ativo
        ? TelaPerfilCoordenador.verde
        : TelaPerfilCoordenador.azulTexto;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, color: cor, size: 18),
        const SizedBox(height: 3),
        Text(
          titulo,
          style: TextStyle(
            color: cor,
            fontSize: 8,
            fontWeight: ativo ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
