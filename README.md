# Gilded Rose на PostgreSQL

## Описание

Реализация задачи [Gilded Rose](https://github.com/emilybache/GildedRose-Refactoring-Kata) с использованием PostgreSQL. Проект демонстрирует рефакторинг кода и управление товарами с особыми правилами обновления качества (Aged Brie, Backstage passes, Sulfuras и др.).

## Требования

- Docker и Docker Compose.
- Bash-терминал.

## Запуск

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/vasiliy-mikhailov/gilded-rose-postgresql
   cd gilded-rose-postgresql
   ```

2. Запустите проект:
   ```bash
   bash start.sh
   ```
   Откроется терминал контейнера с PostgreSQL.

3. Выполните тесты:
   ```bash
   /tests/run_tests.sh
   ```
   Тесты, написанные с использованием `pgTAP`, проверяют хранимую процедуру `update_quality`. В консоли отобразится результат тестов и информация о покрытии кода (с использованием `piggly`).

4. Просмотрите отчет о покрытии:
   Откройте в браузере:
   ```bash
   open ./piggly/reports/index.html
   ```
   (На Linux используйте `xdg-open` или откройте файл вручную.)

## Что вы увидите

### Результат тестов
После запуска `/tests/run_tests.sh` в консоли отобразится вывод `pgTAP` с результатами юнит-тестов. Пример:

```
Running all pgTAP tests...
/tests/test_when_update_quality_for_aged_brie_then_quality_increases.sql ..................... ok
/tests/test_when_update_quality_for_any_item_then_quality_never_exceeds_50.sql ............... ok
/tests/test_when_update_quality_for_any_item_then_quality_never_negative.sql ................. ok
/tests/test_when_update_quality_for_backstage_then_quality_drops_to_0_after_concert.sql ...... ok
/tests/test_when_update_quality_for_backstage_then_quality_increases_by_2_if_10_or_less.sql .. ok
/tests/test_when_update_quality_for_backstage_then_quality_increases_by_3_if_5_or_less.sql ... ok
/tests/test_when_update_quality_for_expired_item_then_quality_decreases_twice.sql ............ ok
/tests/test_when_update_quality_for_normal_item_then_quality_decreases.sql ................... ok
/tests/test_when_update_quality_for_sulfuras_then_quality_never_changes.sql .................. ok
All tests successful.
Files=9, Tests=9,  0 wallclock secs
Result: PASS
```

### Отчет о покрытии
В `./piggly/reports/index.html` будет HTML-отчет о покрытии кода процедуры `update_quality`, сгенерированный `piggly`. Пример данных:
- **Block Coverage**: 90.48% (19 из 21 блока покрыты).
- **Loop Coverage**: 50.00% (1 цикл, частично покрыт).
- **Branch Coverage**: 75.00% (12 из 16 веток покрыты).

Отчет показывает код процедуры с выделением протестированных и непротестированных участков, а также заметки о ветках, которые никогда не выполнялись (например, некоторые условия для Aged Brie при отрицательном `sell_in`).

## Тестирование

- **pgTAP**: Юнит-тесты для процедуры `update_quality`, проверяющие правила обновления качества товаров.
- **piggly**: Генерирует отчет о покрытии кода в HTML, показывая процент покрытия и неподлежащие тестированию участки.
