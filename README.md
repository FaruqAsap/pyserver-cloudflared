# Flask File Server

Flask File Server adalah aplikasi berbasis Python yang memungkinkan pengguna untuk mengunduh file yang tersedia di direktori tertentu melalui antarmuka web.

## Fitur
- Menampilkan daftar file yang tersedia untuk diunduh
- Mendukung folder dan subfolder dalam direktori unduhan
- Menggunakan Flask sebagai backend
- UI berbasis HTML (tersedia di folder `templates/`)

## Prasyarat
Pastikan Anda telah menginstal Python dan pip sebelum menjalankan aplikasi ini.

### Instalasi Python
```sh
sudo apt update && sudo apt install -y python3 python3-pip  # Untuk Ubuntu/Debian
sudo yum install -y python3 python3-pip  # Untuk CentOS/RHEL
```

## Cara Menggunakan

### 1. Clone Repository
```sh
git clone https://github.com/username/repository.git
cd repository
```

### 2. Install Dependensi
```sh
pip3 install -r requirements.txt
```

### 3. Jalankan Server Flask
```sh
python3 app.py
```

Server akan berjalan di `http://127.0.0.1:5000/`.

## Struktur Direktori
```
project_root/
│── app.py                 # Script utama Flask
│── requirements.txt       # Dependensi aplikasi
│── templates/
│   └── index.html        # Tampilan halaman utama
│── downloads/            # Folder tempat file tersedia untuk diunduh
```

## Penggunaan
- Akses halaman utama di `http://127.0.0.1:5000/`
- Klik file yang tersedia untuk mengunduhnya
- Pastikan file yang ingin diunduh tersedia di folder `downloads/`

## Kontribusi
Pull request sangat diterima! Pastikan perubahan yang diajukan meningkatkan kinerja atau fungsionalitas proyek ini.

## Lisensi
Proyek ini dirilis di bawah lisensi **GNU General Public License v3.0 (GPL 3.0)**. Silakan lihat file `LICENSE` untuk detail lebih lanjut.

---

Happy coding! 🚀
