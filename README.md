# Northwind Query

Bu repo klassik **Northwind** nümunə verilənlər bazası (PostgreSQL) üzərində SQL öyrənmə və məşq məqsədilə yazılmış sorğuların (query) toplusudur. Sadə seçmələrdən tutmuş window function-lara qədər müxtəlif SQL texnikaları addım-addım nümayiş etdirilir.

## Verilənlər Bazası

Sorğular Northwind PostgreSQL sxemi üzərində işləyir və əsasən aşağıdakı cədvəllərdən istifadə edir:

- `customers`, `orders`, `"Order Details"`
- `products`, `categories`, `suppliers`
- `employees`

## Fayl Strukturu

```
northwind-query/
│
├── notebooks/
│   ├── 5_simple_queries.sql      # Sadə SELECT, WHERE, GROUP BY, ORDER BY sorğuları
│   ├── joins.sql                 # LEFT JOIN və INNER JOIN nümunələri
│   ├── groupby-having.sql        # GROUP BY + HAVING ilə aqreqasiya sorğuları
│   ├── subquery-cte.sql          # Subquery və CTE (WITH) nümunələri
│   ├── window-func.sql           # Window function-lar (ROW_NUMBER, RANK, SUM OVER)
│   └── optimization.sql          # İndeks yaratma və sorğu optimallaşdırması
│
└── README.md
```

## Sorğu Kateqoriyaları

### 1. Sadə Sorğular (`5_simple_queries.sql`)
- Almaniyadan olan müştərilərin siyahısı
- 10 ildən çox təcrübəsi olan işçilərin title üzrə sıralanması
- Məhsullar üzrə ortalama qiymət
- Ən bahalı 5 məhsul
- Müştəri sayına görə ən çox sifariş verən 10 şirkət

### 2. Join Sorğuları (`joins.sql`)
- Products ↔ Categories (LEFT JOIN)
- Customers ↔ Orders (INNER JOIN)
- Products ↔ Suppliers (INNER JOIN)
- Orders ↔ Customers ↔ Employees (çoxlu INNER JOIN)
- Order Details ↔ Orders ↔ Products (çoxlu INNER JOIN)

### 3. Qruplaşdırma və Filtrasiya (`groupby-having.sql`)
- Kateqoriya üzrə məhsul sayı və ortalama qiymət (5-dən çox məhsulu olan kateqoriyalar, `HAVING`)
- 2016-cı il üzrə aylıq satış sayı və ümumi satış həcmi

### 4. Subquery və CTE (`subquery-cte.sql`)
- Ortalama qiymətdən baha olan məhsulların tapılması — həm subquery, həm də CTE (`WITH`) ilə

### 5. Window Funksiyaları (`window-func.sql`)
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` ilə qiymətə görə sıralama
- `PARTITION BY` ilə kateqoriya daxilində sıralama
- `SUM() OVER()` ilə sifariş daxilində running total hesablanması

### 6. Optimallaşdırma (`optimization.sql`)
- `orderdate` sütunu üzərində indeks yaradılması
- Correlated subquery ilə JOIN + GROUP BY yanaşmasının performans baxımından müqayisəsi

## İstifadə Olunan Texnologiya

- PostgreSQL
- Northwind nümunə verilənlər bazası

## Necə İstifadə Etməli

1. Northwind verilənlər bazasını PostgreSQL-də quraşdırın.
2. `notebooks/` qovluğundakı `.sql` fayllarını istədiyiniz SQL klient (pgAdmin, DBeaver və s.) və ya `psql` ilə açıb ardıcıl işlədin.

```bash
psql -U postgres -d northwind -f notebooks/joins.sql
```

## Məqsəd

Bu repo SQL-in əsas mövzularını (join-lər, aqreqasiya, subquery/CTE, window function-lar, indeksləmə vasitəsilə sorğu optimallaşdırması) real Northwind datası üzərində praktiki şəkildə məşq etmək üçün hazırlanmışdır.
