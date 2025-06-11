# ⛽ Calcula Fuel - Flutter

Um aplicativo Flutter multifuncional que auxilia motoristas a tomarem decisões inteligentes sobre abastecimento e oferece informações úteis.

---

## 💡 Sobre o App

O **Calcula Fuel** evoluiu! Além de ser uma calculadora prática para determinar o custo-benefício entre álcool e gasolina, o aplicativo agora inclui seções para gerenciamento de informações de postos de gasolina e visualização de conteúdo de marketing. A navegação é facilitada por uma barra inferior intuitiva. O aplicativo agora conta com autenticação de usuários e um sistema de perfis para uma experiência personalizada.

---

## 🔍 Como funciona o Calculador de Combustível

A lógica é baseada na regra comum de comparação:

> Se o preço do álcool for **menor que 70%** do preço da gasolina, **vale mais a pena abastecer com álcool**.

Caso contrário, o app recomenda a gasolina.

---

## 🎨 Funcionalidades

- **Calculadora de Custo-Benefício de Combustível:** Decida facilmente entre álcool e gasolina.
- **Registro de Postos de Gasolina:** Salve informações sobre postos, incluindo nome, endereço e preços de combustíveis (atualmente salvo em memória).
- **Página de Marketing/Promoções:** Visualize ofertas e novidades (conteúdo de exemplo).
- **Autenticação de Usuários:** Cadastro e login com e-mail e senha (via Supabase).
- **Perfil de Usuário:** Formulário para salvar dados do perfil do usuário (nome, telefone, endereço, modelo do carro) no banco de dados Supabase.
- **Espaço para Publicidade:** Interface preparada com um local para futura integração de anúncios.
- **Interface Intuitiva:** Navegação simplificada com barra inferior e acesso ao perfil.

---

## 🧠 O que você aprende neste projeto

Este app mostra como:

- Criar interfaces com Flutter, incluindo navegação multi-telas (BottomNavigationBar).
- Gerenciar estado básico para listas de dados (ex: postos de gasolina).
- Implementar autenticação com Supabase (cadastro, login, gerenciamento de sessão).
- Salvar e recuperar dados de um banco de dados (Supabase) para perfis de usuário.
- Utilizar inputs do usuário e realizar cálculos.
- Incluir e gerenciar assets (imagens).
- Estruturar um aplicativo Flutter com múltiplos módulos/telas e navegação condicional (AuthGate).

---

## 🚀 Como rodar o app

1. Clone o repositório:
   ```bash
   git clone https://github.com/emersonnjsantos/calcula_fuel_flutter.git
   ```
2. Navegue até o diretório do projeto:
   ```bash
   cd calcula_fuel_flutter
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o aplicativo:
   ```bash
   flutter run
   ```
