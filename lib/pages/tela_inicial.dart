import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pets.dart';
import 'info_animal.dart';

class TelaAnimais extends StatelessWidget {
  const TelaAnimais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoção de Animais'),
        backgroundColor: Color.fromARGB(224, 43, 80, 52),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Animals>>(
        future: obterListaAnimais(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final listaAnimais = snapshot.data!;
            return ListView.builder(
              itemCount: listaAnimais.length,
              itemBuilder: (context, index) {
                final animal = listaAnimais[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          'https://adocao-production.up.railway.app${animal.img}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(animal.nome,
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 8.0),
                            Text(animal.especie,
                                style: Theme.of(context).textTheme.subtitle1),
                            const SizedBox(height: 8.0),
                            Text(animal.descricao,
                                style: Theme.of(context).textTheme.bodyText2),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para adoção do animal
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InfoAnimal(id: animal.id)),
                                );
                              },
                              child: const Text('Adotar'),
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(224, 43, 80, 52),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao obter lista de animais',
                  style: Theme.of(context).textTheme.bodyText1),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
