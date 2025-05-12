import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/img1.jpg',
      'assets/images/img2.jpg',
      'assets/images/img3.jpg',
    ];
    return Scaffold(
      extendBodyBehindAppBar: true, // agar gradient naik sampai atas
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75), // Tinggi AppBar total
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea( // Ini penting agar isi tidak kena status bar
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0), // Jarak opsional dari status bar
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.menu, color: Colors.black54),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Search",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Icon(Icons.search, color: Colors.black54),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF66B2FF),
              Color(0xFF66B2FF),
            ],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Big Box
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 50),
                // Cards
                Expanded(
                  child: ListView.builder(
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Card(
                        color: Colors.white
                            .withOpacity(0.9), // Warna background card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 192, 214, 255),
                            child: Text("A"),
                          ),
                          title: Text("Header $index"),
                          subtitle: Text("Subhead $index"),
                          trailing: SizedBox(
                            width: 50,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  imagePaths[index],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Report Button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Report Pothole"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    foregroundColor: const Color.fromARGB(255, 58, 79, 183),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    elevation: 4,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color.fromARGB(255, 60, 58, 183),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
