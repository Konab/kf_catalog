from libs.orm import DB


if __name__ == '__main__':
    with open('_dump/catalog.sql', 'r', encoding='utf8') as f:
        with DB() as db:
            db.execute_and_commit(f.read())
