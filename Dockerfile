# Gunakan image Node.js versi 18 yang cocok dengan OpenShift
FROM node:18-buster

RUN mkdir -p /opt/src

WORKDIR /opt/src

ADD . /opt/src

RUN chgrp -R 0 /opt/src && \
    chmod -R g=u /opt/src

RUN npm install

# Jalankan aplikasi Anda
CMD ["npm", "start"]
