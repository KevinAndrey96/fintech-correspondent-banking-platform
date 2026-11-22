-- ============================================================================
-- Fintech Correspondent Banking Platform (Corresponsales Bancarios & Recargas)
-- Database DDL Schema (MySQL 8.0+ / InnoDB / utf8mb4)
-- ============================================================================

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8mb4;

-- ----------------------------------------------------------------------------
-- 1. Websockets Statistics (beyondcode/laravel-websockets)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `websockets_statistics_entries`;
CREATE TABLE `websockets_statistics_entries` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `app_id` VARCHAR(255) NOT NULL,
    `peak_connection_count` INT NOT NULL DEFAULT 0,
    `websocket_message_count` INT NOT NULL DEFAULT 0,
    `api_message_count` INT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_ws_stats_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 2. Brands (Multi-tenant White-label Portal)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `domain` VARCHAR(255) NULL,
    `square_logo_url` VARCHAR(255) NULL,
    `rectangular_logo_url` VARCHAR(255) NULL,
    `primary_color` VARCHAR(50) NULL,
    `banner` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 3. Commissions Groups
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `commissions_groups`;
CREATE TABLE `commissions_groups` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `user_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_comm_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 4. Products (Financial Services & Agreements)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `product_name` VARCHAR(255) NOT NULL,
    `product_type` VARCHAR(255) NOT NULL,
    `product_description` LONGTEXT NOT NULL,
    `product_logo` VARCHAR(255) NULL,
    `product_commission` FLOAT NULL DEFAULT 0,
    `is_enabled` TINYINT(1) NOT NULL DEFAULT 1,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `client_name` TINYINT(1) NOT NULL DEFAULT 0,
    `client_document` TINYINT(1) NOT NULL DEFAULT 0,
    `phone_number` TINYINT(1) NOT NULL DEFAULT 0,
    `email` TINYINT(1) NOT NULL DEFAULT 0,
    `account_type` TINYINT(1) NOT NULL DEFAULT 0,
    `account_number` TINYINT(1) NOT NULL DEFAULT 1,
    `code` TINYINT(1) NOT NULL DEFAULT 0,
    `extra` TINYINT(1) NOT NULL DEFAULT 0,
    `min_amount` DOUBLE NOT NULL DEFAULT 1000,
    `max_amount` DOUBLE NOT NULL DEFAULT 2000000,
    `priority` INT NOT NULL DEFAULT 1,
    `num_jineteo` INT NOT NULL DEFAULT 3,
    `hours` INT NOT NULL DEFAULT 24,
    `reassignment_minutes` INT NULL DEFAULT 5,
    `com_dis` FLOAT NULL DEFAULT 0,
    `com_shp` FLOAT NULL DEFAULT 0,
    `com_sup` FLOAT NULL DEFAULT 0,
    `fixed_commission` FLOAT NULL DEFAULT 0,
    `giros` TINYINT(1) NULL DEFAULT 0,
    `are_default_fields` TINYINT(1) NOT NULL DEFAULT 1,
    `field_names` VARCHAR(500) NULL,
    `category` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_products_enabled_deleted` (`is_enabled`, `is_deleted`),
    INDEX `idx_products_type_cat` (`product_type`, `category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 5. Users (Administrators, Distributors, Shopkeepers, Suppliers)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `role` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `balance` DOUBLE NULL DEFAULT 0,
    `profit` DOUBLE NULL DEFAULT 0,
    `max_queue` INT NULL,
    `document_type` VARCHAR(50) NULL,
    `document` VARCHAR(100) NULL,
    `city` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NULL,
    `priority` INT NULL,
    `is_online` TINYINT(1) NULL DEFAULT 0,
    `is_enabled` TINYINT(1) NOT NULL DEFAULT 1,
    `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
    `password` VARCHAR(255) NOT NULL,
    `google2fa_secret` TEXT NULL,
    `backup_google2fa_secret` TEXT NULL,
    `remember_token` VARCHAR(100) NULL,
    `distributor_id` BIGINT UNSIGNED NULL,
    `qr` VARCHAR(255) NULL,
    `qr_enabled` TINYINT(1) NULL DEFAULT 1,
    `last_login_at` TIMESTAMP NULL DEFAULT NULL,
    `last_login_ip` VARCHAR(45) NULL,
    `daily_password` VARCHAR(255) NULL,
    `daily_verified` TINYINT(1) NULL DEFAULT 0,
    `enabled_daily` TINYINT(1) NULL DEFAULT 0,
    `first_login` TINYINT(1) NULL DEFAULT 1,
    `extrainfo` TEXT NULL,
    `brand_id` BIGINT UNSIGNED NULL,
    `commissions_group_id` BIGINT UNSIGNED NULL,
    `balance_min_amount` FLOAT NULL,
    `developer_mode` TINYINT(1) NULL DEFAULT 0,
    `webhook_url` VARCHAR(500) NULL,
    `giros` TINYINT(1) NULL DEFAULT 0,
    `product_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    `deleted_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_users_role` (`role`),
    INDEX `idx_users_distributor_id` (`distributor_id`),
    INDEX `idx_users_brand_id` (`brand_id`),
    INDEX `idx_users_commissions_group_id` (`commissions_group_id`),
    INDEX `idx_users_product_id` (`product_id`),
    CONSTRAINT `fk_users_distributor` FOREIGN KEY (`distributor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_users_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_users_commissions_group` FOREIGN KEY (`commissions_group_id`) REFERENCES `commissions_groups` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_users_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Complete commissions_groups foreign key to users
ALTER TABLE `commissions_groups`
    ADD CONSTRAINT `fk_commissions_groups_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

-- ----------------------------------------------------------------------------
-- 6. Password Resets & Failed Jobs
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `uuid` VARCHAR(255) NOT NULL UNIQUE,
    `connection` TEXT NOT NULL,
    `queue` TEXT NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `exception` LONGTEXT NOT NULL,
    `failed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 7. Personal Access Tokens (Sanctum)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `tokenable_type` VARCHAR(255) NOT NULL,
    `tokenable_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `token` VARCHAR(64) NOT NULL UNIQUE,
    `abilities` TEXT NULL,
    `last_used_at` TIMESTAMP NULL DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`, `tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 8. Cards (Disbursement & Settlement Bank Cards)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `cardIMG` VARCHAR(255) NOT NULL,
    `cardPDF` VARCHAR(255) NOT NULL,
    `bank` VARCHAR(255) NOT NULL,
    `qr_img` VARCHAR(255) NULL,
    `min_amount` FLOAT NULL DEFAULT 50000,
    `penalty` FLOAT NULL DEFAULT 0,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_cards_bank` (`bank`),
    INDEX `idx_cards_is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 9. User Banks (Merchant & Supplier Registered Bank Accounts)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `user_banks`;
CREATE TABLE `user_banks` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `card_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_user_banks_user` (`user_id`),
    INDEX `idx_user_banks_card` (`card_id`),
    CONSTRAINT `fk_user_banks_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_user_banks_card` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 10. Balances (Recharges, Deposits & Balance Movements)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `balances`;
CREATE TABLE `balances` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `amount` DOUBLE NOT NULL DEFAULT 0,
    `date` VARCHAR(255) NULL,
    `admin_date` VARCHAR(255) NULL,
    `is_valid` TINYINT(1) NULL,
    `type` VARCHAR(255) NOT NULL,
    `boucher` VARCHAR(255) NULL,
    `comment` VARCHAR(255) NULL,
    `bank_id` BIGINT UNSIGNED NULL,
    `card_id` BIGINT UNSIGNED NULL,
    `administrator_id` BIGINT UNSIGNED NULL,
    `payment_code` VARCHAR(255) NULL,
    `is_assigned` TINYINT(1) NULL DEFAULT 0,
    `indirect` TINYINT(1) NULL DEFAULT 0,
    `product_name` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_balances_user_id` (`user_id`),
    INDEX `idx_balances_admin_id` (`administrator_id`),
    INDEX `idx_balances_card_id` (`card_id`),
    CONSTRAINT `fk_balances_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_balances_admin` FOREIGN KEY (`administrator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_balances_card` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 11. Profits (Commission Disbursements & Withdrawals)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `profits`;
CREATE TABLE `profits` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NULL,
    `transaction_id` BIGINT UNSIGNED NULL,
    `amount` DOUBLE NOT NULL DEFAULT 0,
    `date` DATE NULL,
    `is_valid` TINYINT(1) NULL,
    `type` VARCHAR(255) NOT NULL,
    `boucher` VARCHAR(255) NULL,
    `extra` VARCHAR(255) NULL,
    `comment` VARCHAR(255) NULL,
    `product_id` BIGINT UNSIGNED NULL,
    `administrator_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_profits_user_id` (`user_id`),
    INDEX `idx_profits_admin_id` (`administrator_id`),
    INDEX `idx_profits_product_id` (`product_id`),
    CONSTRAINT `fk_profits_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_profits_admin` FOREIGN KEY (`administrator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_profits_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 12. User Product Assignments
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `user_product`;
CREATE TABLE `user_product` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_user_product_user` (`user_id`),
    INDEX `idx_user_product_prod` (`product_id`),
    CONSTRAINT `fk_user_product_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_user_product_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 13. Supplier Product Assignments (Liquidity Routing)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `supplier_products`;
CREATE TABLE `supplier_products` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_supplier_products_user` (`user_id`),
    INDEX `idx_supplier_products_prod` (`product_id`),
    CONSTRAINT `fk_supplier_products_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_supplier_products_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 14. Transactions (The Core Ledger of Operations)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `shopkeeper_id` BIGINT UNSIGNED NULL,
    `distributor_id` BIGINT UNSIGNED NOT NULL,
    `supplier_id` BIGINT UNSIGNED NULL,
    `admin_id` BIGINT UNSIGNED NULL,
    `product_id` BIGINT UNSIGNED NULL,
    `account_number` VARCHAR(255) NULL,
    `amount` DOUBLE NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'hold',
    `detail` TEXT NULL,
    `date` DATE NOT NULL,
    `voucher` VARCHAR(255) NULL,
    `comment` TEXT NULL,
    `com_adm` FLOAT NULL DEFAULT 0,
    `com_dis` FLOAT NULL DEFAULT 0,
    `com_sup` FLOAT NULL DEFAULT 0,
    `com_shp` FLOAT NULL DEFAULT 0,
    `userIP` VARCHAR(255) NULL,
    `first_transaction` TINYINT(1) NULL DEFAULT 0,
    `own_commission` FLOAT NULL DEFAULT 0,
    `observation` VARCHAR(255) NULL,
    `giros` TINYINT(1) NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_tx_shopkeeper` (`shopkeeper_id`),
    INDEX `idx_tx_distributor` (`distributor_id`),
    INDEX `idx_tx_supplier` (`supplier_id`),
    INDEX `idx_tx_admin` (`admin_id`),
    INDEX `idx_tx_product` (`product_id`),
    INDEX `idx_tx_status` (`status`),
    INDEX `idx_tx_account_product` (`account_number`, `product_id`),
    INDEX `idx_tx_date` (`date`),
    CONSTRAINT `fk_tx_shopkeeper` FOREIGN KEY (`shopkeeper_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_tx_distributor` FOREIGN KEY (`distributor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tx_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_tx_admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_tx_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Complete profits foreign key to transactions
ALTER TABLE `profits`
    ADD CONSTRAINT `fk_profits_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL;

-- ----------------------------------------------------------------------------
-- 15. Commissions (Custom Commission Overrides per Product/User)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `commissions`;
CREATE TABLE `commissions` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `amount` DOUBLE NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_commissions_prod_user` (`product_id`, `user_id`),
    CONSTRAINT `fk_commissions_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_commissions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 16. General Commissions
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `general_commissions`;
CREATE TABLE `general_commissions` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NULL,
    `amount_dis` FLOAT NULL DEFAULT 0,
    `amount_shop` FLOAT NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_gen_comm_prod` (`product_id`),
    CONSTRAINT `fk_gen_comm_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 17. Commissions Group General Commissions Pivot
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `commissions_group_general_commissions`;
CREATE TABLE `commissions_group_general_commissions` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `comm_group_id` BIGINT UNSIGNED NOT NULL,
    `gen_comm_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_cg_gc_group` (`comm_group_id`),
    INDEX `idx_cg_gc_gen` (`gen_comm_id`),
    CONSTRAINT `fk_cg_gc_group` FOREIGN KEY (`comm_group_id`) REFERENCES `commissions_groups` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_cg_gc_gen` FOREIGN KEY (`gen_comm_id`) REFERENCES `general_commissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 18. User Transaction Limits (Anti-Fraud & Anti-Smurfing Limits)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `user_transaction_limits`;
CREATE TABLE `user_transaction_limits` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `upper_limit` DECIMAL(20, 2) NOT NULL,
    `lower_limit` DECIMAL(20, 2) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_utl_user_prod` (`user_id`, `product_id`),
    CONSTRAINT `fk_utl_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_utl_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 19. Summaries (Financial Summary & Audit Ledger)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `summaries`;
CREATE TABLE `summaries` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `movement_id` BIGINT UNSIGNED NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `movement_type` VARCHAR(255) NOT NULL,
    `amount` DOUBLE NOT NULL DEFAULT 0,
    `previous_balance` DOUBLE NOT NULL DEFAULT 0,
    `next_balance` DOUBLE NOT NULL DEFAULT 0,
    `bank` VARCHAR(255) NULL,
    `fixed_commission` DOUBLE NULL DEFAULT 0,
    `product_name` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_summaries_user` (`user_id`),
    INDEX `idx_summaries_movement` (`movement_id`, `movement_type`),
    CONSTRAINT `fk_summaries_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 20. Dynamic Form Fields (product_fields & transaction_fields)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `product_fields`;
CREATE TABLE `product_fields` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `product_name` VARCHAR(255) NULL,
    `product_type` VARCHAR(255) NULL,
    `product_description` VARCHAR(255) NULL,
    `product_logo` VARCHAR(255) NULL,
    `product_commission` VARCHAR(255) NULL,
    `com_dis` VARCHAR(255) NULL,
    `com_shp` VARCHAR(255) NULL,
    `com_sup` VARCHAR(255) NULL,
    `fixed_commission` VARCHAR(255) NULL,
    `is_enabled` VARCHAR(255) NULL,
    `client_name` VARCHAR(255) NULL,
    `client_document` VARCHAR(255) NULL,
    `phone_number` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `account_type` VARCHAR(255) NULL,
    `account_number` VARCHAR(255) NULL,
    `code` VARCHAR(255) NULL,
    `reassignment_minutes` VARCHAR(255) NULL,
    `extra` VARCHAR(255) NULL,
    `min_amount` VARCHAR(255) NULL,
    `max_amount` VARCHAR(255) NULL,
    `priority` VARCHAR(255) NULL,
    `num_jineteo` VARCHAR(255) NULL,
    `hours` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `transaction_fields`;
CREATE TABLE `transaction_fields` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `document` VARCHAR(255) NOT NULL,
    `document_type` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `first_code` VARCHAR(255) NOT NULL,
    `second_code` VARCHAR(255) NOT NULL,
    `client_name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 21. Banners & Platforms
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `banner_url` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `platforms`;
CREATE TABLE `platforms` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `is_enabled` TINYINT(1) NULL DEFAULT 1,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 22. Advisers, Preloaded Answers, Support Chats, Publicity & Exchanges
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `shopkeeper_advisers`;
CREATE TABLE `shopkeeper_advisers` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `shopkeeper_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `adviser_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    CONSTRAINT `fk_sa_shopkeeper` FOREIGN KEY (`shopkeeper_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_sa_adviser` FOREIGN KEY (`adviser_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `answer` LONGTEXT NOT NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `transaction_id` INT NOT NULL,
    `message` LONGTEXT NOT NULL,
    `user_role` VARCHAR(255) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    INDEX `idx_chats_tx` (`transaction_id`),
    INDEX `idx_chats_user` (`user_id`),
    CONSTRAINT `fk_chats_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `publicities`;
CREATE TABLE `publicities` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `publicity_url` VARCHAR(255) NULL,
    `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `exchanges`;
CREATE TABLE `exchanges` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `badge` VARCHAR(255) NOT NULL,
    `value` FLOAT NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 23. Spatie Permission Tables (RBAC)
-- ----------------------------------------------------------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
DROP TABLE IF EXISTS `model_has_roles`;
DROP TABLE IF EXISTS `model_has_permissions`;
DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(125) NOT NULL,
    `guard_name` VARCHAR(125) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    UNIQUE KEY `permissions_name_guard_name_unique` (`name`, `guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(125) NOT NULL,
    `guard_name` VARCHAR(125) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    UNIQUE KEY `roles_name_guard_name_unique` (`name`, `guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
    `permission_id` BIGINT UNSIGNED NOT NULL,
    `model_type` VARCHAR(255) NOT NULL,
    `model_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`permission_id`, `model_id`, `model_type`),
    INDEX `model_has_permissions_model_id_model_type_index` (`model_id`, `model_type`),
    CONSTRAINT `fk_model_has_permissions_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
    `role_id` BIGINT UNSIGNED NOT NULL,
    `model_type` VARCHAR(255) NOT NULL,
    `model_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`role_id`, `model_id`, `model_type`),
    INDEX `model_has_roles_model_id_model_type_index` (`model_id`, `model_type`),
    CONSTRAINT `fk_model_has_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
    `permission_id` BIGINT UNSIGNED NOT NULL,
    `role_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`permission_id`, `role_id`),
    INDEX `role_has_permissions_role_id_foreign` (`role_id`),
    CONSTRAINT `fk_role_has_permissions_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_role_has_permissions_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
