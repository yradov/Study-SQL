# Используем официальный образ MySql
FROM mysql:latest

# Создаем директорию для инициализации базы данных
# RUN mkdir /docker-entrypoint-initdb.d/

# Копируем файл data.sql в директорию инициализации
COPY data.sql /docker-entrypoint-initdb.d/

# Указываем параметры для создания базы данных
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=ComputerCompany

# Запускаем MySql в качестве сервиса
CMD ["mysqld"]