-- Демонстрационный скрипт для "виртуального внешнего ключа"

-- 1. Таблица посетителей (master)
CREATE TABLE visitor (
                         id          INT PRIMARY KEY,
                         full_name   VARCHAR(100) NOT NULL,
                         email       VARCHAR(100)
);

-- 2. Таблица логов посещений (detail)
--    Обрати внимание: НЕТ FOREIGN KEY (visitor_id) REFERENCES visitor(id)
CREATE TABLE visitor_log (
                             id          INT PRIMARY KEY,
                             visitor_id  INT NOT NULL,      -- логическая связь с visitor.id
                             visit_time  TIMESTAMP NOT NULL,
                             page_url    VARCHAR(255) NOT NULL
    -- сознательно НЕ добавляем внешнего ключа
);

-- 3. Немного данных
INSERT INTO visitor (id, full_name, email) VALUES
                                               (1, 'Alice Johnson', 'alice@example.com'),
                                               (2, 'Bob Smith',     'bob@example.com'),
                                               (3, 'Charlie Ray',   'charlie@example.com');

INSERT INTO visitor_log (id, visitor_id, visit_time, page_url) VALUES
                                                                   (100, 1, NOW() - INTERVAL '2 day', '/home'),
                                                                   (101, 1, NOW() - INTERVAL '1 day', '/pricing'),
                                                                   (102, 2, NOW() - INTERVAL '3 hour', '/blog'),
                                                                   (103, 2, NOW() - INTERVAL '1 hour', '/contact'),
                                                                   (104, 99, NOW() - INTERVAL '10 minute', '/404-test');  -- "висящий" visitor_id

-- 4. Пример запроса, который ты можешь использовать в IDE
--    "Это мой пример запроса" – навигация и completion будут работать
--    благодаря виртуальному внешнему ключу (если его настроить).
SELECT
    v.id               AS visitor_id,
    v.full_name,
    v.email,
    l.id               AS log_id,
    l.visit_time,
    l.page_url
FROM visitor_log l
         LEFT JOIN visitor v
                   ON l.visitor_id = v.id
ORDER BY l.visit_time DESC;
