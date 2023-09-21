# Gunakan image Node.js versi 18
FROM node:18

# Buat direktori untuk aplikasi Anda
WORKDIR /app

# Buat direktori "/app" dan atur kepemilikan ke user "jay"
RUN chown node:node /app

# Salin aplikasi Node.js Express Anda ke dalam container
COPY . .

# Install modul Node.js
RUN npm install

# Ekspor port yang akan digunakan oleh aplikasi Anda
EXPOSE 5000

# Beralih ke user "jay"
USER node

# Jalankan aplikasi Anda
CMD ["npm", "start"]
