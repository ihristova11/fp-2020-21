## Работа с низове

Scheme поддържа "символни низове" - обекти, чиито елементи са символи.
Синтаксисът за конструиране на символ е с диез и обратна наклонена черта
преди символа: `#\c`, а този
за конструиране на низ е с двойни кавички: `"foo bar"`.

Да разгледаме следните функции от стандартната библиотека:

- `(make-string n c)` - Създава низ със дължина n, който се състои от повторения на символа c
- `(string-length str)` - Връща дължината на подадения низ
- `(string-ref str k)` - Връща символът на позиция k в дадения низ
- `(string-append str ...)` - Връща нов низ, който се получава при долепяне на подадените низове

За повече информация, разгледайте [документацията](https://schemers.org/Documents/Standards/R5RS/HTML/r5rs-Z-H-2.html#%_toc_%_sec_6.3.5).

#### Задачи
Използвайки единствено гореспоменатите операции за работа с низове, дефинирайте следните функции:

1. `(str-chr? str c)` - Проверява дали символът `c` се съдържа в низа `str`
2. `(str-sub str a b)` - Връща нов низ, който е частта от `str`, намираща се между позициите `a` и `b`.
3. `(str-str? needle haystack)` - Ако низът `needle` се съдържа в низа `haystack`, връща първата позиция, на която се среща. Иначе, връща `#f`.
