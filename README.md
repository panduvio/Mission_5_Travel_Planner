# mission_5_wanderly

// 🚩 Saran: Dengan arsitektur Clean Architecture yang kamu bangun,
// README ini harusnya bisa menjelaskan diagram foldermu! 📝📐

## Struktur

Struktur folder yang saya gunakan pada clean architecture project ini berbasis layer dimana layer terdalam tidak mengetahui logic dari layer di luarnya. Domain merupakan layer terdalam dari clean architecture dan tidak bergantung pada UI dan Database. Selain itu, terdapat folder core sebagai pendukung bussiness logic, UI, ataupun navigasi. Dependency Injection digunakan agar mengurangi ketergantungan antar kelas

### Sub-Folder

pada presentation layer, terdapat screen sebagai layar yang ditampilkan, widget sebagai komponen pendukung dan reusable, dan provider sebagai state management. Pada domain layer, terdapat entity sebagai pemodelan dari objek yang digunakan pada aplikasi, terdapat repository sebagai abstraksi tentang fitur-fitur yang membutuhkan akses data baik local maupun remote, terdapat usecase sebagai bussiness logic untuk fitur seperti CRUD. Pada data layer, terdapat model sebagai manifestasi dari entity sehingga dapat dikirim dan diterima database dalam bentuk json, terdapat repository implement yang seperti namanya mengimplementasikan abstraksi repository sehingga menjembatani domain dan data layer, dan terdapat source yang terhubung dengan repository implement dan datasource seperti firebase maupun hive (jika diperlukan). Pada folder core, terdapat constant yang berisi ukuran tetap agar UI konsisten, terdapat error handler untuk handle error secara custom, terdapat extension untuk mempersingkat dan mempermudah kode untuk dibaca dan dikembangkan, terdapat helper untuk pendukung seperti filter dan validasi, terdapat router untuk membantu navigasi, dan terdapat theme untuk mengatur tema dari keseluruhan aplikasi

## Fitur

fitur yang diupdate pada mission 7 adalah migrasi hive ke firebase baik data maupun login, fitur my trip dan explore yang terpisah, logic booking yang sebelumnya belum ada atau hanya itinerary saja, dan penambahan activity timeline.

### Fitur yang bisa dikembangkan

login menggunakan google akan ditambahkan di commit berikutnya. penyesuaian homescreen agar semua fitur bisa bekerja. menambahkan halaman profile. menambahkan session (kondisional). refactor UI (clean design dan color pallete).
