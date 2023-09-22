# Gunakan image Node.js versi 18 yang cocok dengan OpenShift
FROM registry.access.redhat.com/ubi8/nodejs-18-minimal:1-75

# Buat direktori untuk aplikasi Anda
WORKDIR /opt/app-root/src

# Salin aplikasi Node.js Express Anda ke dalam container
COPY . .

# Install modul Node.js
RUN npm install

# Ekspor port yang akan digunakan oleh aplikasi Anda
EXPOSE 5000

# Jalankan aplikasi Anda
CMD ["npm", "start"]
