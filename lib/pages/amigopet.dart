import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';
import 'cuidadores.dart';

class AmigoPetPage extends StatelessWidget {
  const AmigoPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ==============================
      // APP BAR
      // ==============================

      appBar: AppBar(
        backgroundColor: AmigoPetStyles.corFundo,
        elevation: 4,
        centerTitle: true,

        title: Text(
          'AmigoPet',
          style: AmigoPetStyles.textoTitulo,
        ),

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: AmigoPetStyles.corIcone,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Busca tocada'),
                ),
              );
            },
          ),

          IconButton(
            icon: Icon(
              Icons.favorite,
              color: AmigoPetStyles.corIcone,
            ),
            onPressed: () {
              print('Favorito tocado');
            },
          ),
        ],
      ),

      // ==============================
      // DRAWER
      // ==============================

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AmigoPetStyles.corCabecalho,
              ),

              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            // PERFIL
            ListTile(
              leading: const Icon(Icons.person),

              title: Text(
                'Perfil',
                style: AmigoPetStyles.textoItem,
              ),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            // CONFIGURAÇÕES
            ListTile(
              leading: const Icon(Icons.settings),

              title: Text(
                'Configurações',
                style: AmigoPetStyles.textoItem,
              ),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            // ==============================
            // CUIDADORES
            // ==============================

            ListTile(
              leading: const Icon(Icons.group),

              title: Text(
                'Cuidadores',
                style: AmigoPetStyles.textoItem,
              ),

              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CuidadoresPage();
                    },
                  ),
                );
              },
            ),

            // AGENDAMENTOS
            ListTile(
              leading: const Icon(Icons.event),

              title: Text(
                'Meus Agendamentos',
                style: AmigoPetStyles.textoItem,
              ),

              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // ==============================
      // TELA INICIAL
      // ==============================

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(
                Icons.pets,
                size: 90,
                color: AmigoPetStyles.corFundo,
              ),

              const SizedBox(height: 20),

              const Text(
                'Bem-vindo ao AmigoPet!',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Encontre cuidadores de confiança '
                    'para cuidar do seu melhor amigo.',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // BOTÃO PARA CUIDADORES
              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CuidadoresPage();
                        },
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.group,
                  ),

                  label: const Text(
                    'Encontrar cuidadores',
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    AmigoPetStyles.corFundo,

                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}