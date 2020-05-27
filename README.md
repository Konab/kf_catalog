## Настройка окружения

```
python3.8 -m venv venv
```

```
source venv/bin/activate
```

```
pip install -r requirements.txt
```

```
touch .env
```

Записать ссылку на базу данных в файл `.env` по примеру из `templ_env`

## Миграция БД

```
python migration.py
```

## Запуск приложения

```
flask run
```









