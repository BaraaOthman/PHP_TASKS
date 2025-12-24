# PHP_TASKS

## Environment Details

- **XAMPP Version:** 1.8.1  
- **PHP Version:** 5.4.x  
- **OpenCart Version:** 1.5.6.4  
- **Database:** MySQL (phpMyAdmin)  
- **Operating System:** Windows  
- **Tools:** VS Code, Git  

---

## TASK 1 — Product Page Modifications (Admin)

### Task 1.1 — Add Cost Column

**Modified Files**
- `admin/language/english/catalog/product.php`
- `admin/model/catalog/product.php`
- `admin/controller/catalog/product.php`
- `admin/view/template/catalog/product_list.tpl`

**Description**
- Added a new `cost` field for products.
- Displayed the Cost column in the product list.
- Implemented filtering with inequality operators (`<`, `>`, `<=`, `>=`, `!=`).
- Enabled sorting by cost.

**Challenges**
- Handling inequality filters correctly in SQL queries.
- Ensuring filters and sorting worked without breaking pagination.

---

### Task 1.2 — Add Profit Column (Dynamic)

**Modified Files**
- `admin/model/catalog/product.php`
- `admin/controller/catalog/product.php`
- `admin/language/english/catalog/product.php`
- `admin/view/template/catalog/product_list.tpl`

**Description**
- Added a Profit column calculated dynamically as `price - cost`.
- Implemented inequality-based filtering and sorting.
- Profit is not stored in the database.

**Challenges**
- Implementing sorting and filtering on a calculated value without persisting it in the database.
- Avoiding performance issues when calculating profit dynamically.

---

### Task 1.3 — Automatic Parent Category Assignment

**Modified Files**
- `admin/model/catalog/product.php`

**Description**
- Automatically assigns products to all parent categories when a child category is selected.
- Works during both product creation and editing.
- Uses recursive traversal of the category hierarchy.

**Challenges**
- Correctly handling recursive category traversal.
- Preventing duplicate category assignments.

---

### Task 1.4 — Category Column (Full Path)

**Modified Files**
- `admin/model/catalog/product.php`
- `admin/controller/catalog/product.php`
- `admin/language/english/catalog/product.php`
- `admin/view/template/catalog/product_list.tpl`

**Description**
- Added a Category column showing full category paths (e.g. `Home & Kitchen > Appliances`).
- Displays multiple category paths if applicable.
- Added a dropdown filter listing categories in full-path format.

**Challenges**
- Building full category paths using OpenCart’s closure table structure.
- Displaying multiple category paths clearly in the product list.

---

## TASK 2 — Category Page Modifications (Admin)

### Task 2.1 — Product Count Column

**Modified Files**
- `admin/controller/catalog/category.php`
- `admin/model/catalog/category.php`
- `admin/view/template/catalog/category_list.tpl`
- `admin/language/english/catalog/category.php`

**Description**
- Added a Product Count column showing the number of products per category.
- Implemented inequality filtering and sorting.
- Counts are calculated dynamically from product-category relations.

**Challenges**
- Calculating product counts efficiently without affecting performance.
- Integrating filters and sorting into the existing category list logic.

---

### Task 2.2 — Parent Category (Full Path)

**Modified Files**
- `admin/controller/catalog/category.php`
- `admin/model/catalog/category.php`
- `admin/view/template/catalog/category_list.tpl`
- `admin/language/english/catalog/category.php`

**Description**
- Added a Parent Category column showing the full parent path (excluding the current category).
- Supports deep category hierarchies.

**Challenges**
- Extracting parent paths while excluding the current category.
- Maintaining compatibility with OpenCart 1.5.x category structure.

---

## TASK 3 — Order Page Modification (Admin)

**Modified Files**
- `admin/controller/sale/order.php`
- `admin/view/template/sale/order_list.tpl`

**Description**
- Added a View Products button to each order.
- Clicking the button opens a modal popup.
- Order products are loaded dynamically using jQuery (AJAX).
- Displays Product ID, Name, Price, Quantity, and Total.

**Challenges**
- Integrating dynamic AJAX loading into the legacy OpenCart admin UI.
- Handling JavaScript scope and modal initialization correctly.

---

## Overall Challenges

- Setting up and configuring PHP 5.4 with XAMPP.
- This project was my **first hands-on experience with PHP**, requiring time to understand:
  - PHP syntax
  - OpenCart MVC structure
  - Legacy OpenCart (v1.5.x) patterns
- Debugging undefined variables across controllers, models, and templates.
