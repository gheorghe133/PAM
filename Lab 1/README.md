# Calculator Viteză Medie

O aplicație mobilă Flutter simplă pentru calcularea vitezei medii în funcție de distanță și timp.

## Descriere

Această aplicație implementează **Varianta 3** din cerințele proiectului - un calculator de viteză medie care:

- Primește ca input distanța (km) și timpul (ore) prin două TextField-uri
- Folosește un ElevatedButton pentru calculul vitezei
- Afișează viteza medie rezultată în km/h

## Funcționalități

✅ **Input**: Două TextField-uri pentru distanță și timp
✅ **Calcul**: Viteza = Distanța / Timpul
✅ **Output**: Afișarea vitezei medii în km/h
✅ **Validare**: Verifică input-uri valide
✅ **Teste**: Suite de teste de bază

## Tehnologii folosite

- **Flutter**: Framework pentru dezvoltarea aplicațiilor mobile
- **Dart**: Limbajul de programare

## Instalare și rulare

### Cerințe preliminare

- Flutter SDK instalat

### Pași pentru instalare

1. Instalează dependențele:

```bash
flutter pub get
```

2. Rulează aplicația:

```bash
flutter run
```

## Testare

```bash
flutter test
```

## Structura proiectului

```
lib/
├── main.dart          # Aplicația principală (92 linii)
test/
├── widget_test.dart   # Teste de bază (43 linii)
```

## Exemple de utilizare

- Distanța: 100 km, Timpul: 2 ore → Viteza medie: 50.00 km/h
- Input invalid → "Introduceți valori valide"
