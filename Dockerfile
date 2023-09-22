# Gunakan image Node.js versi 18 yang cocok dengan OpenShift
FROM node:18-buster

RUN useradd -m -s /bin/bash jay

# Buat direktori untuk aplikasi Anda
WORKDIR /app

# Salin aplikasi Node.js Express Anda ke dalam container
COPY . .

# Install modul Node.js
RUN npm install

RUN chown -R jay:0 /app

# Ekspor port yang akan digunakan oleh aplikasi Anda
EXPOSE 5000

USER jay

# Jalankan aplikasi Anda
CMD ["npm", "start"]
