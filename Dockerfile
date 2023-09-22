# Gunakan image Node.js versi 18
FROM node:18

# Buat direktori untuk aplikasi Anda
WORKDIR /app

# Salin aplikasi Node.js Express Anda ke dalam container
COPY . .

# Install modul Node.js
RUN npm install

# Ekspor port yang akan digunakan oleh aplikasi Anda
EXPOSE 5000

# Jalankan aplikasi Anda
CMD ["npm", "start"]
