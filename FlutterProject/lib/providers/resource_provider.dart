import 'package:flutter/material.dart';
import '../models/resource.dart';

class ResourceProvider with ChangeNotifier {
  final List<Resource> _resources = [
    Resource(
      id: '1',
      title: 'Furadeira Bosch',
      description: 'Furadeira de impacto em perfeito estado, acompanha brocas.',
      category: 'Ferramentas',
      condition: 'Excelente',
      offerantId: 'user1',
      offerantName: 'João Silva',
      imageUrl: 'https://images.unsplash.com/photo-1504148455328-c376907d081c?q=80&w=500&auto=format&fit=crop',
      availability: 'Disponível',
      type: 'Empréstimo',
      latitude: -23.5631,
      longitude: -46.6544,
    ),
    Resource(
      id: '2',
      title: 'Cadeira de Rodas',
      description: 'Cadeira de rodas dobrável, semi-nova.',
      category: 'Saúde',
      condition: 'Boa',
      offerantId: 'user2',
      offerantName: 'Maria Oliveira',
      imageUrl: 'https://images.unsplash.com/photo-1576765608535-5f04d1e3f289?q=80&w=500&auto=format&fit=crop',
      availability: 'Disponível',
      type: 'Empréstimo',
      latitude: -23.5689,
      longitude: -46.6642,
    ),
    Resource(
      id: '3',
      title: 'Livro: Dom Casmurro',
      description: 'Clássico da literatura brasileira em ótimo estado.',
      category: 'Educação',
      condition: 'Excelente',
      offerantId: 'user3',
      offerantName: 'Carlos Souza',
      imageUrl: 'https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=500&auto=format&fit=crop',
      availability: 'Disponível',
      type: 'Troca',
      latitude: -23.5505,
      longitude: -46.6333,
    ),
  ];

  List<Resource> get resources => [..._resources];

  void addResource(Resource resource) {
    _resources.insert(0, resource);
    notifyListeners();
  }

  List<Resource> getResourcesByCategory(String category) {
    return _resources.where((r) => r.category == category).toList();
  }
}
