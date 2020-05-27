import psycopg2

from string import Template

from config import Config


class DB():
    def __init__(self):
        pass

    def close(self):
        self.conn.close()

    def __enter__(self):
        self.conn = psycopg2.connect(Config.DATABASE_URI)
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()
        if exc_val:
            raise

    def execute(self, sql):
        with self.conn.cursor() as cursor:
            cursor.execute(sql)
            try:
                records = cursor.fetchall()
            except Exception as Err:
                print(">> Error in DB: ", Err)
                records = []
        return records

    def execute_and_commit(self, sql):
        with self.conn.cursor() as cursor:
            cursor.execute(sql)
            print(self.conn.commit())

    def get_sql_query(self, name, params={}):
        with open(Config.SQL_QUERY_DIR+name+'.sql', 'r', encoding='utf8') as f:
            if params:
                return Template(f.read()).substitute(**params)
            else:
                return f.read()

    def get_sql_query_with_filter(self, name, params={}):
        sql = Template(self.get_sql_query(name))
        filter_ = ""
        if params:
            where_bool = False
            for key in params:
                if not where_bool:
                    t = Template("where $key=$value\n")
                    where_bool = True
                else:
                    t = Template("and $key=$value\n")
                filter_ += t.substitute(
                    key=key.replace("_min", " >").replace("_max", " <"),
                    value=params[key]
                )
        return sql.substitute(filter=filter_)
