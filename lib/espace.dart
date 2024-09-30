import 'package:flutter/material.dart';

class MonEspacePage extends StatelessWidget {
  const MonEspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color.fromARGB(159, 15, 163, 126),
              ),
              child: Column(children: [
                AppBar(
                  title: const Text('Mon espace',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  elevation: 0,
                  leading: const Icon(Icons.menu, color: Colors.white),
                  backgroundColor: Colors.transparent,
                  actions: const [
                    Icon(Icons.edit, color: Colors.white),
                    SizedBox(width: 30),
                  ],
                ),
                const SizedBox(height: 60),
              ]),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                    top: 80,
                    left: 35,
                    right:
                        35), // Add padding to make space for the profile card
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            _buildListItem(
                                'Préférences', Icons.arrow_forward_ios),
                            _buildListItem(
                                'Notifications', Icons.arrow_forward_ios),
                            _buildListItem(
                                'Infos personnels', Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // mettre le GridView dans une BoxDecoration
                      Card(
                          elevation: 3,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Favoris',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                    itemCount: 9,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )))
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Positioned(
            top: kToolbarHeight +
                35, // Ajustez cette valeur pour contrôler le chevauchement
            left: 35,
            right: 35,
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Losterne Brice',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cotonou, Fidjrosse',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Activités'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Mon espace'),
        ],
        selectedItemColor: Colors.teal,
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Icon(icon, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
