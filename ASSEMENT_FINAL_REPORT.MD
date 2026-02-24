# Assessment Mission 6 🚀 Wanderly

Halo student HSB-1038! 👋  

Terima kasih sudah menyelesaikan Mission 6 pada Bootcamp Flutter Batch 1.

Struktur clean architecture sudah bagus, namun implementasi fitur mission belum stabil: ada mutasi state langsung di UI, sebagian perubahan itinerary tidak dipersist, dan data trip masih static provider.

---

## 📊 Aspek Penilaian

| Aspek Penilaian | Detail Item Penilaian | Poin Maksimal |
|-----------------|----------------------|---------------|
| Feature Completeness | Semua fitur sesuai instruction | 20 |
| Riverpod Implementation | StateNotifier/Notifier usage, state flow | 15 |
| Hive Integration | Persistensi data & adapter | 15 |
| Architecture & Structure | Separation of concerns | 15 |
| Clean Code | Naming, readability, modularity | 10 |
| Error Handling | Try-catch, fallback state | 10 |
| UI States | Loading, Empty, Error state | 10 |
| Maintainability | Scalability & structure | 5 |

---

## 📝 Raport Skor

| Aspek Penilaian | Skor Dicapai | Komentar Ramah & Kritis |
|-----------------|-------------|--------------------------|
| Feature Completeness | 16/20 | Sebagian flow berjalan, tetapi persistence behavior tidak konsisten dan trip list masih static. |
| Riverpod Implementation | 13/15 | Notifier generator dipakai, tetapi UI masih memutasi data langsung. |
| Hive Integration | 12/15 | Hive adapter/box ada, tetapi penulisan data tidak selalu via flow state yang aman. |
| Architecture & Structure | 14/15 | Struktur domain/data/presentation sangat baik secara bentuk. |
| Clean Code | 9/10 | Keterbacaan baik, beberapa bagian screen masih terlalu stateful. |
| Error Handling | 7/10 | Error disimpan di state notifier, namun tidak selalu di-render pada UI screen terkait. |
| UI States | 10/10 | Loading/empty belum konsisten di itinerary screen utama. |
| Maintainability | 4/5 | Arsitektur potensial, tetapi implementasi runtime behavior perlu hardening. |

**Total Skor: 85 / 100 🎯**

---

## 2️⃣ Temuan Detail per File

### ✅ Hal yang Sudah Bagus
- `lib/presentation/providers/itinerary_notifier.dart` memisahkan usecase dengan jelas.
- `main.dart` sudah inisialisasi Hive + DI sebelum app start.
- Struktur folder mengikuti pola clean architecture yang baik.

### ⚠️ Perlu Peningkatan
- `itinerary_screen` masih memutasi entity langsung di UI.
- Update note tidak dipersist ke Hive.
- `trip_provider` masih memakai data static, sehingga fitur planner tidak scalable.

---

## 3️⃣ Inline Review Simulation

lib/presentation/screens/itinerary_screen.dart

Line 247:  
❌ `itineraries[index].note = ...` memutasi entity langsung di UI tanpa lewat notifier/repository.
Suggestion: Buat method notifier khusus `updateItineraryNote(...)` agar perubahan state dan persistence konsisten.

Severity: High  
Impact: Data bisa tidak sinkron dan rawan hilang setelah rebuild.

lib/presentation/screens/itinerary_screen.dart

Line 246:  
❌ Setelah edit note hanya `setState`, tidak ada `postItinerary()`/persist call.
Suggestion: Persist perubahan note ke Hive segera setelah user menekan simpan.

Severity: High  
Impact: User mengira data tersimpan padahal hilang saat reopen screen/app.

lib/presentation/screens/itinerary_screen.dart

Line 99:  
⚠️ Screen tidak memanfaatkan `state.isLoading`/`state.error` untuk fallback UI.
Suggestion: Tambahkan conditional rendering loading/error/empty agar UX robust.

Severity: Medium  
Impact: Ketika operasi async gagal, user tidak mendapatkan feedback yang jelas.

lib/presentation/providers/trip_provider.dart

Line 4:  
⚠️ `tripListProvider` mengembalikan list static dari entity file.
Suggestion: Migrasikan trip data ke provider + repository persistence sesuai misi planner.

Severity: Medium  
Impact: Fitur tidak scalable dan tidak memenuhi ekspektasi data-driven architecture.

---

## 💡 Saran Pengembangan Berikutnya

1. Pindahkan seluruh mutasi itinerary (add/edit/delete note) ke notifier methods dedicated.
2. Pastikan setiap perubahan entity langsung dipersist ke Hive melalui repository.
3. Refactor trip source dari static list ke data layer yang dikelola provider.

---

## 🧠 Kesimpulan Teknis

Arsitektur konseptual sudah kuat, tetapi implementasi runtime masih memiliki gap kritikal pada konsistensi state dan persistence. Fokus perbaikan di flow data end-to-end akan meningkatkan kualitas secara drastis.
