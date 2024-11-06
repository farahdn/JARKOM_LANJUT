Nama: Farah Dina Awalunnisa Sidiq  
NIM: 20220801212  
Mata Kuliah: Jaringan Komputer Lanjut (CIE722)  
Dosen Pengampu: Jefry Sunupurwa Asri, S.Kom., M.Kom.  
Fakultas/Prodi: Ilmu Komputer/Teknik Informatika 

## **ESSAY** 

**1. Jelaskan menurut anda apa itu Routing Static ?**

Routing static merupakan sebuah proses setting router suatu jaringan menggunakan tabel routing yang dikonfigurasikan secara manual oleh admin. Saat menggunakan routing statis, tabel routing hanya akan berisi alamat IP tujuan dan arah rute ke jaringan tertentu. Router akan menggunakan tabel ini untuk mengarahkan ke jalur yang telah ditentukan. Jika terdapat perubahan, maka admin harus memperbarui tabel routing secara manual agar koneksi tetap terjaga dengan baik.

**Berikut merupakan langkah-langkah konfigurasi Routing Static :**

1. Buka Winbox dan masuk ke perangkat Mikrotik.
2. Pada halaman utama, pilih menu IP lalu pilih Routes.
3. Pada halaman Routes, pilih tombol **+** untuk menambahkan rute baru dengan detail berikut:

        - Destination Address: **`192.168.2.0/4`** (IP / Subnet tujuan)
        - Gateway: **`192.168.1.1`** (Alamat dari router yang akan dilalui)

4. Pilih OK untuk menyimpan konfigurasi.

**Note**: Sesuaikan gateway dengan topologi jaringan masing-masing.


**2. Jelaskan menurut anda apa itu Routing Dynamic ?**

Routing dynamic merupakan sebuah proses setting router suatu jaringan yang dapat membuat tabel routing secara otomatis oleh protokol routing berdasarkan jaringan dan router yang terhubung. Saat menggunakan routing dynamic, protocol routing akan secara otomatis membuat dan memperbarui tabel routing jika terdapat perubahan. Hal tersebut dilakukan untuk mengetahui jaringan dan rute yang terhubung, kemudian menentukan jalur berdasarkan jaringan yang ada.

**Berikut merupakan langkah-langkah konfigurasi Routing Dynamic :**

1. Buka Winbox dan masuk ke perangkat Mikrotik.
2. Pada halaman utama, pilih menu IP lalu pilih Addresses.
3. Pada halaman Addresses, pilih tombol **+** untuk menambahkan IP dengan detail berikut:

        Untuk Router 1 tambahkan:
        - IP Address: `192.168.1.1/24` pada interface `Ether1`
        - New Address: `10.10.1.1/30` pada interface `Ether2`

        Untuk Router 2 tambahkan:
        - IP Address: `192.168.2.1/24` pada interface `Ether1`
        - New Address: `10.10.1.2/30` pada interface `Ether2`

4. Kembali ke halaman utama, pilih menu IP lalu pilih Routing
5. Pada halaman Routing, pilih tombol **+** untuk menambahkan RIP Interface dengan detail berikut : 

        Untuk Router 1 tambahkan :
        - New Interface dengan `Ether2`
        - Receive v1-2
        - Send v2
        - Lalu apply dan ok

        Untuk Router 2 tambahkan :
        - New Interface dengan `Ether1`
        - Receive v1-2
        - Send v2
        - Lalu apply dan ok

6. Pada menu RIP Network, pilih tombol **+** untuk menambahkan jaringan dengan detail berikut : 

        Untuk Router 1 tambahkan : 
        - Addresses 192.168.1.0/24 (Jaringan Lokal)
        - Addresses 10.10.10.0/30 (Untuk jaringan yang digunakan untuk menghubungkan ke Router 2)
        - Lalu apply dan ok

        Untuk Router 2 tambahkan : 
        - Addresses 192.168.2.0/24 (Jaringan Lokal)
        - Addresses 10.10.10.0/30 (Untuk jaringan yang digunakan untuk menghubungkan ke Router 2)
        - Lalu apply dan ok

7. Lakukan uji konektivitas antara PC1 dan PC2 dengan tahapan berikut:

    1. Pada halaman utama, pilih menu IP, lalu pilih DHCP Server.
    2. Pada halaman DHCP Server, pilih DHCP Setup dan pilih Ether1, lalu klik Next hingga selesai.
    3. Buka Command Prompt dan jalankan perintah ipconfig untuk memeriksa konfigurasi IP.
    4. Lakukan ping ke `10.10.10.2` untuk menguji konektivitas dengan PC lain.
    5. Lakukan ping ke `192.168.2.254` untuk menguji konektivitas dengan PC lain.

**3. Jelaskan menurut anda apa itu Firewall ?**

Firewall dalam Mikrotik merupakan sebuah fitur yang bertugas untuk memonitor  dan menyaring keluar masuknya data dari router Mikrotik. Firewall digunakan untuk mengatur mengenai izin berdasarkan alamat IP, Port ataupun Protokol.


**4. Jelaskan menurut anda apa itu NAT ?**

Network Address Translation atau NAT merupakan sebuah metode yang digunakan untuk mengkonversi alamat IP Privat yang berada di dalam jaringan lokal menjadi alamat IP Publik yang dapat diakses melalui internet dengan menggunakan satu alamat IP Publik.