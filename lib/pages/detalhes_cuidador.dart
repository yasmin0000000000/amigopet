import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';

class DetalhesCuidadorPage extends StatelessWidget {
  final String nome;
  final String servico;
  final double avaliacao;

  const DetalhesCuidadorPage({
    super.key,
    required this.nome,
    required this.servico,
    required this.avaliacao,
  });

  // ============================================
  // ALERT DIALOG
  // ============================================

  void cancelarAgendamento(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento?',
          ),

          content: const Text(
            'Tem certeza que deseja cancelar '
                'este agendamento?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Não',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Sim, cancelar',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================
  // SIMPLE DIALOG
  // ============================================

  void escolherServico(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Tipo de serviço',
          ),

          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Passeio',
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Hospedagem',
              ),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Banho e tosa',
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================
  // BOTTOM SHEET
  // ============================================

  void abrirMaisOpcoes(BuildContext context) {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),

                child: Text(
                  'Mais opções',

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(
                  Icons.share,
                ),

                title: const Text(
                  'Compartilhar perfil',
                ),

                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Compartilhar perfil',
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.flag,
                ),

                title: const Text(
                  'Denunciar',
                ),

                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Perfil denunciado',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AmigoPetStyles.corFundoTela,

      // ============================================
      // APPBAR
      // ============================================

      appBar: AppBar(
        backgroundColor:
        AmigoPetStyles.corFundo,

        elevation: 4,

        centerTitle: true,

        title: Text(
          'AmigoPet',
          style: AmigoPetStyles.textoTitulo,
        ),

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AmigoPetStyles.corIcone,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: AmigoPetStyles.corIcone,
            ),

            onPressed: () {
              abrirMaisOpcoes(context);
            },
          ),
        ],
      ),

      // ============================================
      // CORPO
      // ============================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            // FOTO
            CircleAvatar(
              radius: 60,

              backgroundColor:
              AmigoPetStyles.corFundo,

              child: Text(
                nome[0],

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NOME
            Text(
              nome,

              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // SERVIÇO
            Text(
              servico,

              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            // AVALIAÇÃO
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                const SizedBox(width: 5),

                Text(
                  '$avaliacao',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // ========================================
            // TIPO DE SERVIÇO
            // ========================================

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  escolherServico(context);
                },

                icon: const Icon(
                  Icons.pets,
                ),

                label: const Text(
                  'Tipo de serviço',
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  AmigoPetStyles.corFundo,

                  foregroundColor: Colors.white,

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ========================================
            // CANCELAR
            // ========================================

            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: () {
                  cancelarAgendamento(context);
                },

                child: const Text(
                  'Cancelar agendamento',
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ========================================
            // MAIS OPÇÕES
            // ========================================

            SizedBox(
              width: double.infinity,

              child: TextButton.icon(
                onPressed: () {
                  abrirMaisOpcoes(context);
                },

                icon: const Icon(
                  Icons.more_horiz,
                ),

                label: const Text(
                  'Mais opções',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}