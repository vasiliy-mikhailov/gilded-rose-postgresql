```markdown
# Gilded Rose с PostgreSQL

## Описание

Эта реализация [Gilded Rose Refactoring Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata) переносит логику управления товарами в PostgreSQL. Исходный код хранимой процедуры `update_quality` был адаптирован для совместимости с анализом покрытия кода в `piggly`. Проект включает поддержку Docker и PostgreSQL 17, а также юнит-тесты на `pgTAP` для проверки логики.

Репозиторий: [vasiliy-mikhailov/gilded-rose-postgresql](https://github.com/vasiliy-mikhailov/gilded-rose-postgresql).  
Оригинальный проект: [emilybache/GildedRose-Refactoring-Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata).

## Требования

- Docker и Docker Compose.
- Bash-терминал (на Windows используйте WSL или Git Bash).

## Установка и запуск

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/vasiliy-mikhailov/gilded-rose-postgresql
   cd gilded-rose-postgresql
   ```

2. Запустите проект:
   ```bash
   ./start.sh
   ```
   Скрипт запускает Docker-контейнер с PostgreSQL (имя: `gildedrose-db`) и открывает его терминал.

3. Выполните тесты:
   ```bash
   /tests/run_tests.sh
   ```
   Тесты на `pgTAP` проверяют процедуру `update_quality`. В консоли отобразятся результаты и покрытие кода от `piggly`.

4. Просмотрите отчет о покрытии:
   Откройте HTML-отчет:
   ```bash
   open ./piggly/reports/index.html
   ```
   На Linux используйте `xdg-open`. На Windows или если команда не работает, откройте файл `./piggly/reports/index.html` в браузере.

## Ожидаемые результаты

### Вывод тестов
После запуска `/tests/run_tests.sh` вы увидите результаты тестов `pgTAP`. Пример:
```
Running all pgTAP tests...
/tests/test_when_update_quality_for_aged_brie_then_quality_increases.sql ... ok
/tests/test_when_update_quality_for_any_item_then_quality_never_exceeds_50.sql ... ok
[...]
All tests successful.
Files=9, Tests=9,  0 wallclock secs
Result: PASS
```
Это подтверждает, что 9 тестов для процедуры `update_quality` прошли успешно.

### Отчет о покрытии
В `./piggly/reports/index.html` отображается анализ покрытия кода от `piggly`. Пример:
- Покрытие блоков: ~90% (большинство кода протестировано).
- Покрытие веток: ~75% (некоторые условия, например, для Aged Brie с отрицательным `sell_in`, не покрыты).
- Покрытие циклов: ~50% (цикл частично протестирован).

Отчет выделяет протестированные (зеленые) и непротестированные (красные) участки кода.

## Особенности

- **Адаптация для `piggly`**: Код процедуры `update_quality` переработан для совместимости с анализом покрытия в `piggly`.
- **Docker и PostgreSQL 17**: Логика Gilded Rose реализована в хранимой процедуре с использованием PostgreSQL, запущенного в Docker.
- **pgTAP**: Юнит-тесты проверяют правила обновления качества товаров (Aged Brie, Backstage passes, Sulfuras и др.).

## Устранение неполадок

- **Контейнер не запускается**: Убедитесь, что Docker установлен, и выполните:
  ```bash
  docker-compose down && docker-compose up -d
  ```
- **Терминал не открывается**: Войдите вручную:
  ```bash
  docker exec -it gildedrose-db bash
  ```
- **Ошибки тестов**: Проверьте, что файлы в `/src` и `/tests` корректно скопированы (см. `Dockerfile`).

## Вклад в проект

Хотите улучшить тесты или код? Создайте pull request или сообщите об ошибке в [issues](https://github.com/vasiliy-mikhailov/gilded-rose-postgresql/issues).
```