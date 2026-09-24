import 'package:flutter/material.dart';
import '../styles/amigopet_styles.dart';
import 'detalhes_cuidador.dart';

class CuidadoresPage extends StatelessWidget {
  const CuidadoresPage({super.key});

  static const List<Map<String, dynamic>> cuidadores = [
    {
      'nome': 'Ana Souza',
      'servico': 'Passeadora e cuidadora',
      'avaliacao': 4.9,
      'distancia': '1,2 km',
      'preco': 'R\$ 35/h',
      'inicial': 'A',
    },
    {
      'nome': 'Carlos Oliveira',
      'servico': 'Cuidador de pets',
      'avaliacao': 4.8,
      'distancia': '1,8 km',
      'preco': 'R\$ 40/h',
      'inicial': 'C',
    },
    {
      'nome': 'Mariana Santos',
      'servico': 'Passeadora',
      'avaliacao': 4.7,
      'distancia': '2,1 km',
      'preco': 'R\$ 30/h',
      'inicial': 'M',
    },
    {
      'nome': 'João Pereira',
      'servico': 'Hospedagem e cuidados',
      'avaliacao': 4.9,
      'distancia': '2,7 km',
      'preco': 'R\$ 45/h',
      'inicial': 'J',
    },
    {
      'nome': 'Beatriz Lima',
      'servico': 'Cuidadora de gatos',
      'avaliacao': 4.6,
      'distancia': '3,2 km',
      'preco': 'R\$ 32/h',
      'inicial': 'B',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ==============================
      // APP BAR
      // ==============================

      appBar: AppBar(
        backgroundColor: AmigoPetStyles.corFundo,
        foregroundColor: Colors.white,
        elevation: 4,

        title: const Text(
          'Cuidadores',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.filter_list,
            ),

            onSelected: (opcao) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Ordenar por: $opcao',
                  ),
                ),
              );
            },

            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: 'Mais próximos',
                  child: Text('Mais próximos'),
                ),

                PopupMenuItem(
                  value: 'Melhor avaliados',
                  child: Text('Melhor avaliados'),
                ),

                PopupMenuItem(
                  value: 'Menor preço',
                  child: Text('Menor preço'),
                ),
              ];
            },
          ),
        ],
      ),

      // ==============================
      // LISTA
      // ==============================

      body: ListView.builder(
        padding: const EdgeInsets.all(16),

        itemCount: cuidadores.length,

        itemBuilder: (context, index) {
          final cuidador = cuidadores[index];

          return Card(
            margin: const EdgeInsets.only(
              bottom: 14,
            ),

            elevation: 3,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),

            child: InkWell(
              borderRadius: BorderRadius.circular(16),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetalhesCuidadorPage(
                        nome: cuidador['nome'],
                        servico: cuidador['servico'],
                        avaliacao: cuidador['avaliacao'],
                      );
                    },
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(14),

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,

                      backgroundColor:
                      AmigoPetStyles.corFundo,

                      child: Text(
                        cuidador['inicial'],

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [
                          Text(
                            cuidador['nome'],

                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            cuidador['servico'],

                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 7),

                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),

                              const SizedBox(width: 4),

                              Text(
                                '${cuidador['avaliacao']}',
                              ),

                              const SizedBox(width: 12),

                              const Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 17,
                              ),

                              const SizedBox(width: 3),

                              Text(
                                cuidador['distancia'],
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          Text(
                            cuidador['preco'],

                            style: TextStyle(
                              color:
                              AmigoPetStyles.corFundo,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}