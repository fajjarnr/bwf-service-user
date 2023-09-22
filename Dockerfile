# Gunakan image Node.js versi 18
FROM node:18

# Tambahkan user "jay" yang akan menjalankan aplikasi
RUN useradd -m -s /bin/bash jay

RUN mkdir -p /home/jay/app

# Buat direktori untuk aplikasi Anda
WORKDIR /home/jay/app

# Salin aplikasi Node.js Express Anda ke dalam container
COPY . .

# Buat direktori "/app" dan atur kepemilikan ke user "jay"
RUN chown -R jay:jay /home/jay/app


# Install modul Node.js
RUN npm install

# Ekspor port yang akan digunakan oleh aplikasi Anda
EXPOSE 5000

# Beralih ke user "jay"
USER jay

# Jalankan aplikasi Anda
CMD ["npm", "start"]
