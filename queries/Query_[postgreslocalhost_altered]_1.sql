-- Таблица посетителей
CREATE TABLE visitor (
                         id INT PRIMARY KEY,
                         full_name VARCHAR(100),
                         email VARCHAR(100)
);

-- Таблица логов
-- Обрати внимание: НЕТ FOREIGN KEY visitor_id → visitor.id
CREATE TABLE visitor_log (
                             id INT PRIMARY KEY,
                             visitor_id INT NOT NULL,
                             visit_time TIMESTAMP NOT NULL,
                             page_url VARCHAR(255) NOT NULL
);

-- Данные
INSERT INTO visitor (id, full_name, email) VALUES
                                               (1, 'Alice Johnson', 'alice@example.com'),
                                               (2, 'Bob Smith', 'bob@example.com');

-- Вставляем строку с "невалидным" visitor_id,
-- которая была бы ошибкой при настоящем FK.
INSERT INTO visitor_log (id, visitor_id, visit_time, page_url) VALUES
    (100, 999, NOW(), '/demo');