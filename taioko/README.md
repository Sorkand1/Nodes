Установка
Установка Docker

curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh | bash
Клонируем репозиторий

git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
Копируем .env.sample в .env

cp .env.sample .env
Запускаем ноду

docker-compose up -d
Ждем чтобы нода синхронизировалась, последний блок можете глянуть ТУТ, дальше можете запустить proposer (по желанию)

Редактируем файл .env

cd simple-taiko-node

sudo docker-compose down

sudo nano .env
В редакторе мы откроем .env фаил, который нам нужно отредактировать. Нужно будет изменить строчки

ENABLE_PROPOSER= у вас false а надо поставить true
L1_PROPOSER_PRIVATE_KEY=ВАШ_ПРИВАТНЫЙ_КЛЮЧ
L2_SUGGESTED_FEE_RECIPIENT=ВАШ_АДРЕС_0x….
Сохраняем редактор CTRL+X,Y,Enter
sudo docker-compose up -d
Полезные команды:
Остановка ноды

docker-compose down
Посмотреть логи

cd simple-taiko-node
docker-compose logs -f
Удаление ноды

docker-compose down -v
rm -f .env
cd ~
rm -rf simple-taiko-node
