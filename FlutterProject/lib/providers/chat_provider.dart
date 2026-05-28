import 'package:flutter/material.dart';
import '../models/message.dart';
import '../services/gemini_service.dart';

class ChatConversation {
  final String resourceId;
  final String resourceTitle;
  final Message lastMessage;

  ChatConversation({
    required this.resourceId,
    required this.resourceTitle,
    required this.lastMessage,
  });
}

class ChatProvider with ChangeNotifier {
  final Map<String, List<Message>> _resourceChats = {};
  final Map<String, String> _resourceTitles = {}; // Store titles for the list

  final List<Message> _botMessages = [
    Message(
      id: '1',
      senderId: 'bot',
      content: 'Olá! Eu sou o ConectaIA. Como posso ajudar você hoje?',
      timestamp: DateTime.now(),
      isFromMe: false,
    ),
  ];

  final GeminiService _geminiService = GeminiService();

  List<Message> get botMessages => [..._botMessages];

  List<ChatConversation> get activeConversations {
    return _resourceChats.entries.map((e) {
      return ChatConversation(
        resourceId: e.key,
        resourceTitle: _resourceTitles[e.key] ?? 'Recurso',
        lastMessage: e.value.last,
      );
    }).toList()
      ..sort((a, b) => b.lastMessage.timestamp.compareTo(a.lastMessage.timestamp));
  }

  List<Message> getMessagesForResource(String resourceId) {
    return _resourceChats[resourceId] ?? [];
  }

  void sendMessageToResource(String resourceId, String content) {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'me',
      content: content,
      timestamp: DateTime.now(),
      resourceId: resourceId,
      isFromMe: true,
    );

    if (!_resourceChats.containsKey(resourceId)) {
      _resourceChats[resourceId] = [];
    }
    _resourceChats[resourceId]!.add(newMessage);
    notifyListeners();
  }

  Future<void> sendMessageToBot(String content) async {
    final userMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'me',
      content: content,
      timestamp: DateTime.now(),
      isFromMe: true,
    );

    _botMessages.add(userMessage);
    notifyListeners();

    final response = await _geminiService.generateResponse(content);
    
    final botMessage = Message(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      senderId: 'bot',
      content: response,
      timestamp: DateTime.now(),
      isFromMe: false,
    );

    _botMessages.add(botMessage);
    notifyListeners();
  }

  void startRequestFlow(String resourceId, String resourceTitle) {
    _resourceTitles[resourceId] = resourceTitle;
    if (!_resourceChats.containsKey(resourceId)) {
      _resourceChats[resourceId] = [
        Message(
          id: 'init',
          senderId: 'system',
          content: 'Olá! Tenho interesse no recurso: $resourceTitle',
          timestamp: DateTime.now(),
          resourceId: resourceId,
          isFromMe: true,
        )
      ];
      notifyListeners();
    }
  }
}
