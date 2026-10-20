# Product Portfolio Management System (PPMS)

**Individual university project — Web Technology**

A Japanese-food-themed product portfolio and ordering website developed with PHP, MySQL/MariaDB, HTML, CSS and JavaScript. Includes a customer interface and an administrative management panel.

## Features

**Customer side:** Browse and search products, view product details, register/login, manage a session-based cart, submit orders, see order history, read blog posts, and leave reviews.

**Admin side:** Manage product categories, products, blog posts, reservations/orders, reviews, and user accounts.

## Technology

- PHP (server-side application)
- MySQL / MariaDB database accessed through MySQLi
- HTML, CSS, JavaScript
- XAMPP for local development

## Run locally

1. Install XAMPP with Apache, PHP and MySQL/MariaDB.
2. Place the `ppms` folder in the XAMPP `htdocs` directory.
3. Start Apache and MySQL using XAMPP.
4. Create a `ppms` database in phpMyAdmin and import `ppms.sql`.
5. Review `ppms/config/config.php` and adjust database credentials and `BASE_URL` / `ADMIN_BASE_URL` for your local setup.
6. Open `http://localhost/ppms/`. The admin interface is at `http://localhost/ppms/admin/`.
7. The database import already includes two disposable demo accounts listed below. You can also register an additional account (which receives `userRoles = 2` by default). To promote that newly registered account **locally**, run `UPDATE user SET userRoles = 1 WHERE userEmail = 'your-admin-email@example.com';`.

## Demo login (local testing only)

The supplied `ppms.sql` already contains both test accounts, so **no extra SQL import or registration is required**. The password **ends with a full stop (`.`)** in both cases.

| Role | Email | Password | `userRoles` |
|---|---|---|---|
| Customer | `user@email.com` | `User1.` | `2` |
| Administrator | `admin@email.com` | `Admin1.` | `1` |

Both passwords were verified with PHP `password_verify()` against the bcrypt hashes in the author-provided SQL file. The database stores **hashed passwords**, not the plaintext passwords listed above. These are public **demo-only** credentials: do not reuse them for real accounts or deploy them unchanged on an internet-facing server.

Newly registered users receive role `2` automatically. For a *new* local test account you want to promote, you may run this in phpMyAdmin after registration:

```sql
UPDATE user SET userRoles = 1 WHERE userEmail = 'your-new-admin@example.com';
```

The included administrator account already has role `1`; no manual promotion is needed for it.

## Database import notes

The provided `ppms.sql` includes the database tables, sample product categories and products, plus the two local demo accounts. Existing tables may conflict if importing into a populated database; import into a new, empty `ppms` database.

## Screenshots

Screenshots are in `screenshots/user-panel/` and `screenshots/admin-panel/`. See the public-facing catalog, cart, checkout, and product-management pages for representative examples.

## Repository notes

- The included `ppms.sql` is the author-provided database export (October 20, 2026), with user and admin records assigned `userRoles` 2 and 1 respectively. Import this single SQL file; no separate demo-account import is needed.
- This repository preserves the academic project for portfolio review. It has **not** been security-hardened or verified for deployment to the public internet. Review authentication/authorization, SQL query parameterization, output escaping, state-changing GET requests, and server-side order totals before production use.
- A conventional Vercel static deployment will not run this PHP/MySQL application; use a PHP-capable host if you later want a live backend demo. Your Vercel portfolio can link to this GitHub repository.

## Author

Developed individually as part of a university Web Technology course.
