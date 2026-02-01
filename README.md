# 🍳 FlavorHub - Your Culinary Companion

<div align="center">
  <img src="repo-assets/logo.png" alt="FlavorHub Logo" width="200"/>
  
  **Descoperă, salvează și pregătește rețete delicioase cu FlavorHub!**
  
<<<<<<< HEAD
   [![Flutter](https://img.shields.io/badge/Flutter-3.5.0-02569B?logo=flutter)](https://flutter.dev)
   [![Dart](https://img.shields.io/badge/Dart-3.0-0175C2?logo=dart)](https://dart.dev)
   [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
   [![GitHub repo](https://img.shields.io/badge/GitHub-flavor__hub-black?logo=github)](https://github.com/MosutLarisa/flavor_hub)


</div>

---

## 📖 Despre Proiect

**FlavorHub** este o aplicație mobilă Flutter care te ajută să explorezi și să organizezi rețete culinare. Fie că îți dorești un desert dulce sau o mâncare săratăFlavorHub îți oferă o colecție variată de rețete cu instrucțiuni detaliate.

### 🎯 Problemă Rezolvată

Mulți oameni:
- ❌ Pierd timpul căutând rețete pe internet
- ❌ Nu își pot organiza rețetele preferate
- ❌ Au dificultăți în găsirea rețetelor pe nivelul lor de experiență

**FlavorHub rezolvă toate acestea** oferind o platformă simplă, offline și organizată pentru gestionarea rețetelor tale culinare!

---

## ✨ Funcționalități Principale

### 🔍 **Căutare Inteligentă**
- Caută rețete după nume
- Filtrare după dificultate (Ușor, Mediu, Dificil)
- Navigare rapidă între categorii (Dulce/Sărat)

### ❤️ **Sistem de Favorite**
- Salvează rețetele preferate cu un singur tap
- Acces rapid la colecția ta personală
- Persistență locală (favorite salvate chiar și după închiderea aplicației)

### 📱 **Interfață Intuitivă**
- Design modern și colorat
- Carduri vizuale pentru fiecare rețetă
- Imagini atractive pentru fiecare preparat

### 📋 **Detalii Complete**
- Listă detaliată de ingrediente
- Pași de preparare numerotați și clari
- Timp de preparare și nivel de dificultate

---

## 🎨 Capturi de Ecran

<div align="center">
  <img src="repo-assets/screenshot1.png" alt="Lista de rețete" width="250"/>
  <img src="repo-assets/screenshot2.png" alt="Detalii rețetă" width="250"/>
  <img src="repo-assets/screenshot3.png" alt="Favorite" width="250"/>
</div>

---

## 🏗️ Arhitectură

Proiectul respectă principiile **Clean Architecture** și **Clean Code**:
```
lib/
├── common/          # Constante și string-uri UI
├── data/            # Date statice (rețete)
├── models/          # Modele de date (Recipe, RecipeCategory)
├── providers/       # Gestionarea stării (FavoritesProvider)
├── screens/         # Ecranele aplicației
├── utils/           # Funcții helper (navigare)
├── widgets/         # Componente UI reutilizabile
└── main.dart        # Punct de intrare
```

### 🧩 Componente Cheie

#### **Models**
- `Recipe`: Modelul de date pentru rețete
- `RecipeCategory`: Enum pentru categorii (dulce/sărat)

#### **Providers**
- `FavoritesProvider`: Singleton pentru gestionarea favoritelor cu persistență locală

#### **Screens**
- `HomeScreen`: Ecran principal cu navigare bottom
- `RecipeListScreen`: Listă de rețete cu căutare și filtre
- `RecipeDetailScreen`: Detalii complete rețetă
- `FavoritesScreen`: Colecția de rețete favorite

#### **Widgets Reutilizabile**
- `RecipeCard`: Card vizual pentru rețete
- `SearchBarWidget`: Bară de căutare
- `DifficultyFilterWidget`: Filtru după dificultate
- `RecipeImageHeader`: Header cu imagine
- `RecipeDetailsSection`: Secțiune cu detalii complete

---

## 🚀 Cum Rulezi Proiectul

### Cerințe Preliminare

- Flutter SDK >= 3.5.0
- Dart SDK >= 3.0.0
- Android Studio / VS Code cu extensia Flutter
- Un emulator Android/iOS sau un dispozitiv fizic

### Pași de Instalare

1. **Clonează repository-ul:**
```bash
   git clone https://github.com/username/flavor_hub.git
   cd flavor_hub
```

2. **Instalează dependențele:**
```bash
   flutter pub get
```

3. **Verifică configurația Flutter:**
```bash
   flutter doctor
```

4. **Rulează aplicația:**
```bash
   flutter run
```

### Build pentru Producție

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web
```

---

## 📦 Dependențe

| Pachet | Versiune | Descriere |
|--------|----------|-----------|
| `flutter` | SDK | Framework principal |
| `shared_preferences` | ^2.2.2 | Salvare date locale |

---

## 🎓 Concepte Flutter Demonstrate

### ✅ Widget-uri ca Clase (nu funcții)
Toate componentele extrase sunt **clase** (conform best practices Flutter):
```dart
class _RecipeTitle extends StatelessWidget { ... }
```

### ✅ Organizare Modulară
- Separarea responsabilităților
- Reutilizarea codului
- Cod ușor de întreținut

### ✅ State Management
- `StatefulWidget` pentru stare locală
- Singleton pattern pentru stare globală

### ✅ Persistență Date
- SharedPreferences pentru salvare locală
- Serializare/Deserializare JSON

---

## 🛠️ Tehnologii Folosite

- **Flutter**: Framework UI cross-platform
- **Dart**: Limbaj de programare
- **Material Design**: Sistem de design Google
- **SharedPreferences**: Persistență date simple

---

## 📝 Licență

Acest proiect este licențiat sub [MIT License](LICENSE).

---

## 👨‍💻 Autor

**[Numele Tău]**
- GitHub: [@username](https://github.com/username)
- Email: email@example.com

---

## 🙏 Mulțumiri

Proiect dezvoltat pentru cursul de **Dezvoltare Aplicații Mobile cu Flutter** - [Universitatea X].

---

<div align="center">
  <strong>Făcut cu ❤️ și Flutter</strong>
</div>
