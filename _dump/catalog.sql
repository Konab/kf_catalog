-- -------------------------------------------------------------
-- TablePlus 3.1.2(296)
--
-- https://tableplus.com/
--
-- Database: catalog
-- Generation Time: 2020-05-27 19:49:01.3520
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."object";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS object_id_seq;

-- Table Definition
CREATE TABLE "public"."object" (
    "id" int4 NOT NULL DEFAULT nextval('object_id_seq'::regclass),
    "name" text NOT NULL,
    "address" varchar(128) NOT NULL,
    "area" int4 NOT NULL,
    "floor" int4 NOT NULL,
    "type_id" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."object__subway_station";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."object__subway_station" (
    "object_id" int4 NOT NULL,
    "subway_station_id" int4 NOT NULL,
    PRIMARY KEY ("object_id","subway_station_id")
);

DROP TABLE IF EXISTS "public"."subway_station";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS subway_station_id_seq;

-- Table Definition
CREATE TABLE "public"."subway_station" (
    "id" int4 NOT NULL DEFAULT nextval('subway_station_id_seq'::regclass),
    "name" varchar NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."type";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS type_id_seq;

-- Table Definition
CREATE TABLE "public"."type" (
    "id" int4 NOT NULL DEFAULT nextval('type_id_seq'::regclass),
    "name" varchar(16) NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."object" ("id", "name", "address", "area", "floor", "type_id") VALUES
('1', 'Звезды Арбата', 'ЦАО, Арбат, м. Краснопресненская, Новый Арбат улица, д. 32', '133', '10', '2'),
('12', 'Резиденция Чистые Пруды', 'ЦАО, Басманный, м. Чистые Пруды, Подсосенский переулок, д. 3', '920', '1', '1'),
('13', 'Андреевский дом', 'ЦАО, Хамовники, м. Фрунзенская, Фрунзенская 2-я улица, д. 8', '420', '11', '3'),
('14', 'Звезды Арбата', 'ЦАО, Арбат, м. Краснопресненская, Новый Арбат улица, д. 32', '78', '3', '2'),
('15', 'Респект', 'ЦАО, Тверской, м. Тверская, Гнездниковский Б. переулок, д. 3', '138', '6', '1'),
('16', 'Четыре Солнца', 'ЦАО, Замоскворечье, м. Новокузнецкая, Татарская Б. улица, д. 7', '163', '8', '1'),
('17', 'Купеческая Усадьба', 'ЦАО, Замоскворечье, м. Новокузнецкая, Климентовский переулок, д. 2', '136', '4', '1'),
('18', 'Староконюшенный, 19', 'ЦАО, Арбат, м. Арбатская, Староконюшенный переулок, д. 19', '82', '3', '1'),
('21', 'Долина Грёз', 'ЗАО, Крылатское, м. Молодежная, Крылатская улица, д. 45 к. 3', '150', '2', '1'),
('22', 'Покровское-Глебово', 'СЗАО, Покровское-Стрешнево, м. Водный Стадион, Береговая улица, д. 8 к. 1', '135', '3', '1'),
('23', 'Покровское-Глебово', 'СЗАО, Покровское-Стрешнево, м. Тушинская, Береговая улица, д. 8', '484', '1', '1'),
('24', '2-ой Обыденский переулок, 3/1', 'ЦАО, Хамовники, м. Кропоткинская, Обыденский 2-ой переулок, д. 3/1', '103', '2', '1'),
('25', 'Золотые Ключи-2', 'ЗАО, Раменки, м. Славянский Бульвар, Минская улица, д. 1Г к. 1', '116', '18', '1'),
('26', 'Большой Николопесковский переулок, 13стр1', 'ЦАО, Арбат, м. Смоленская, Николопесковский Б. переулок, д. 13 стр. 1', '336', '4', '3'),
('27', 'Сердце Столицы', 'СЗАО, Хорошево-Мневники, м. Хорошёвская, Шелепихинская набережная, д. 34 к. 2', '55', '3', '1'),
('28', 'Соколиное гнездо', 'САО, Аэропорт, м. Аэропорт, Ленинградский проспект, д. 76 к. 1', '213', '17', '2'),
('29', 'Дом на Мосфильмовской', 'ЗАО, Раменки, м. Парк Победы, Мосфильмовская улица, д. 8', '149', '21', '3'),
('30', 'Дом на Мосфильмовской', 'ЗАО, Раменки, м. Парк Победы, Мосфильмовская улица, д. 8', '160', '47', '1'),
('31', 'Меркурий Сити', 'ЦАО, Пресненский, м. Выставочная, Красногвардейский 1-й проезд, д. 15', '150', '44', '2'),
('32', 'Дом с французскими окнами', 'ЦАО, Хамовники, м. Кропоткинская, Зачатьевский 1-й переулок, д. 6 стр. 1', '160', '4', '1'),
('33', 'Соколиное гнездо', 'САО, Аэропорт, м. Аэропорт, Ленинградский проспект, д. 76 к. 1', '213', '17', '3'),
('34', 'Дипломат', 'ЗАО, Раменки, м. Воробьевы Горы, Мичуринский проспект, д. 39', '70', '8', '1'),
('35', 'Троице-Лыково', 'СЗАО, Строгино, м. Строгино, Лыковская 2-я улица, д. 65 стр. 1 к. 1', '550', '1', '2'),
('36', 'Охотный ряд, 2', 'ЦАО, Тверской, м. Площадь Революции, Охотный Ряд улица, д. 2', '185', '5', '2'),
('37', 'Дом на Мосфильмовской', 'ЗАО, Раменки, м. Парк Победы, Мосфильмовская улица, д. 8', '149', '21', '1');

INSERT INTO "public"."object__subway_station" ("object_id", "subway_station_id") VALUES
('1', '6'),
('1', '16'),
('12', '2'),
('13', '3'),
('14', '1'),
('15', '4'),
('16', '5'),
('17', '5'),
('18', '6'),
('18', '16'),
('21', '9'),
('21', '13'),
('22', '7'),
('23', '8'),
('24', '16'),
('25', '9'),
('26', '10'),
('27', '11'),
('28', '12'),
('29', '13'),
('30', '13'),
('31', '14'),
('32', '16'),
('33', '12'),
('34', '15'),
('35', '9'),
('36', '4'),
('37', '13');

INSERT INTO "public"."subway_station" ("id", "name") VALUES
('1', 'Краснопресненская'),
('2', 'Чистые Пруды'),
('3', 'Фрунзенская'),
('4', 'Тверская'),
('5', 'Новокузнецкая'),
('6', 'Арбатская'),
('7', 'Водный Стадион'),
('8', 'Тушинская'),
('9', 'Славянский Бульвар'),
('10', 'Смоленская'),
('11', 'Хорошёвская'),
('12', 'Аэропорт'),
('13', 'Парк Победы'),
('14', 'Выставочная'),
('15', 'Воробьевы Горы'),
('16', 'Кропоткинская');

INSERT INTO "public"."type" ("id", "name") VALUES
('1', 'квартира'),
('2', 'апартаменты'),
('3', 'пентхаус');

ALTER TABLE "public"."object" ADD FOREIGN KEY ("type_id") REFERENCES "public"."type"("id");
ALTER TABLE "public"."object__subway_station" ADD FOREIGN KEY ("object_id") REFERENCES "public"."object"("id");
ALTER TABLE "public"."object__subway_station" ADD FOREIGN KEY ("subway_station_id") REFERENCES "public"."subway_station"("id");
