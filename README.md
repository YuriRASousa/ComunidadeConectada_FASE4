# Comunidade Conectada (Smart HAS) 🤝

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google%20Maps-%234285F4.svg?style=for-the-badge&logo=google-maps&logoColor=white)

O **Comunidade Conectada** é um ecossistema digital desenvolvido em Flutter focado no fortalecimento de redes de apoio local. O aplicativo permite que membros de uma comunidade cadastrem recursos para doação, solicitem auxílio e localizem pontos de ajuda através de geolocalização, contando com o suporte de Inteligência Artificial Generativa para otimizar a interação entre os usuários.

---

## ✨ Funcionalidades Principais

### 📍 Geolocalização e Mapas
- **Visualização em Tempo Real:** Localize doações e pontos de apoio próximos via integração com Google Maps.
- **Categorização Visual:** Marcadores personalizados para identificar diferentes tipos de recursos.

### 🤖 Inteligência Artificial (Gemini)
- **Melhoria de Descrições:** IA que analisa e refina o texto das doações para torná-las mais claras e atrativas.
- **Categorização Inteligente:** Sugestão automática de categorias baseada na descrição do item.
- **Assistente Comunitário:** Chatbot integrado para tirar dúvidas sobre como usar o app ou como ajudar a comunidade.

### 💬 Comunicação e Gestão
- **Chat Integrado:** Sistema de mensagens em tempo real para combinar detalhes de entregas ou suporte.
- **Painel de Recursos:** Gestão completa de ofertas de ajuda, incluindo fotos e descrições detalhadas.
- **Onboarding Interativo:** Guia passo a passo para novos membros da rede.

---

## 🛠 Tecnologias e Arquitetura

O projeto utiliza o que há de mais moderno no ecossistema Flutter:

- **Framework:** [Flutter 3.x](https://flutter.dev)
- **Gerenciamento de Estado:** [Provider](https://pub.dev/packages/provider) (Abordagem reativa e desacoplada).
- **Integração de IA:** API do OpenRouter (Modelo Gemini/Cobuddy).
- **Mapas:** `google_maps_flutter` e `latlong2`.
- **UI/UX:** Material Design 3 com sistema de temas dinâmicos.

---

## 📂 Organização do Projeto

A lógica principal reside na pasta `FlutterProject/`, organizada seguindo as melhores práticas:

```text
lib/
 ├── models/      # Classes de dados (User, Resource, Message)
 ├── providers/   # Gerenciamento de estado e lógica de negócio
 ├── screens/     # Interfaces de usuário (UI) e navegação
 ├── services/    # Integrações externas (APIs de IA e Mapas)
 ├── theme/       # Configurações de estilo, cores e fontes
 └── widgets/     # Componentes reutilizáveis de interface
```

---

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK instalado e configurado.
- Emulador Android ou dispositivo físico para testes.

### Passo a Passo
1. Clone este repositório.
2. Acesse a pasta do projeto:
   ```bash
   cd FlutterProject
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o aplicativo:
   ```bash
   flutter run
   ```

> **Nota para o Professor:** As chaves de API (Google Maps e OpenRouter/IA) já estão pré-configuradas nos respectivos arquivos de serviço para permitir o teste imediato de todas as funcionalidades sem necessidade de configuração adicional.

---

## 📄 Créditos e Contexto
Este projeto foi desenvolvido como parte integrante da disciplina de **Desenvolvimento de Aplicativos Mobile**. O objetivo é demonstrar a aplicação prática de geolocalização, consumo de APIs REST e integração de modelos de linguagem (LLMs) em ambientes móveis.

---
**Desenvolvido com ❤️ para uma comunidade mais conectada.**
