## Настройка окружения

```
python3.8 -m venv venv
```

```
source venv/bin/activate
```

```
pip install --upgrade pip
```

```
pip install -r requirements
```

```
touch .env
```

Записать ссылку на базу данных в файл `.env` по примеру из `templ_env`

## Миграция БД

```
python migration.py
```

Дамп в директории: _dump/catalog.sql

## Запуск приложения

```
flask run
```









