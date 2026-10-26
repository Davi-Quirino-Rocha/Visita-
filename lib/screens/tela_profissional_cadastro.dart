import 'package:flutter/material.dart';

import 'tela_home_coordenador.dart';

class TelaProfissionalCadastrado extends StatelessWidget {
  const TelaProfissionalCadastrado({super.key});

  static const verde = Color(0xFF008577);
  static const azulEscuro = Color(0xFF142A40);
  static const azulTexto = Color(0xFF647895);
  static const azulPainel = Color(0xFFEAF1F8);
  static const azulIcone = Color(0xFF174A78);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const Spacer(flex: 4),

              // Ícone de sucesso
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F6F0),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Color(0xFF168363),
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Profissional cadastrado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: azulEscuro,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'O acesso foi criado e as orientações de\n'
                'primeiro acesso foram enviadas ao e-mail\n'
                'institucional.',
                textAlign: TextAlign.center,
                style: TextStyle(color: azulTexto, fontSize: 11, height: 1.45),
              ),

              const SizedBox(height: 20),

              // Próximo passo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: azulPainel,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: azulIcone, size: 15),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Próximo passo',
                            style: TextStyle(
                              color: azulIcone,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'O profissional deverá trocar a senha '
                            'provisória no primeiro acesso.',
                            style: TextStyle(
                              color: azulIcone,
                              fontSize: 10,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Voltar para a equipe
              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const TelaHomeCoordenador(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: verde,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Voltar para a equipe',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ),

              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
