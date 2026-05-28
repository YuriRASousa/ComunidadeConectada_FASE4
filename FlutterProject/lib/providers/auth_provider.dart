import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isGhost = false;

  User? get currentUser => _currentUser;
  bool get isGhost => _isGhost;
  bool get isAuthenticated => _currentUser != null || _isGhost;

  // Mock database of users
  final List<User> _mockUsers = [
    User(
      id: 'user_dev_123',
      name: 'Yuri Ribeiro',
      email: 'yuri@exemplo.com',
      address: 'Av. Paulista, 1000, São Paulo - SP',
      reputation: 4.9,
      totalTransactions: 12,
      isVerified: true,
    ),
  ];

  void login(String email, String password) {
    // Simular busca no "banco de dados"
    try {
      final user = _mockUsers.firstWhere((u) => u.email == email);
      _currentUser = user;
      _isGhost = false;
      notifyListeners();
    } catch (e) {
      // Se não encontrar, para fins de protótipo, podemos criar um erro ou apenas não logar
      throw Exception('Usuário não encontrado ou senha incorreta.');
    }
  }

  void loginAsGhost() {
    _currentUser = User(
      id: 'ghost_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Visitante (Ghost)',
      email: 'ghost@conectada.com',
      address: 'Não informado',
      reputation: 0.0,
      totalTransactions: 0,
      isVerified: false,
    );
    _isGhost = true;
    notifyListeners();
  }

  void register(String name, String email, String address) {
    final newUser = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      address: address,
      reputation: 5.0,
      totalTransactions: 0,
      isVerified: false,
    );
    _mockUsers.add(newUser);
    _currentUser = newUser;
    _isGhost = false;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _isGhost = false;
    notifyListeners();
  }

  void updateUser({String? name, String? address, String? profileImageUrl}) {
    if (_currentUser != null) {
      _currentUser = User(
        id: _currentUser!.id,
        name: name ?? _currentUser!.name,
        email: _currentUser!.email,
        address: address ?? _currentUser!.address,
        profileImageUrl: profileImageUrl ?? _currentUser!.profileImageUrl,
        reputation: _currentUser!.reputation,
        totalTransactions: _currentUser!.totalTransactions,
        isVerified: _currentUser!.isVerified,
      );
      notifyListeners();
    }
  }
}
