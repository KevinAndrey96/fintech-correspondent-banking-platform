-- ============================================================================
-- Fintech Correspondent Banking Platform (Corresponsales Bancarios & Recargas)
-- Realistic Seed Data (Colombia: Nequi, Daviplata, Bancolombia, Red de Tenderos)
-- ============================================================================

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- 1. Brands (White-Label Portals)
-- ----------------------------------------------------------------------------
INSERT INTO `brands` (`id`, `domain`, `square_logo_url`, `rectangular_logo_url`, `primary_color`, `banner`, `created_at`, `updated_at`) VALUES
(1, 'portal.redcorresponsal.co', '/images/brands/red_square.png', '/images/brands/red_rect.png', '#0D47A1', '/images/brands/banner_corresponsal.png', NOW(), NOW()),
(2, 'aliados.multiservicios.com.co', '/images/brands/multi_square.png', '/images/brands/multi_rect.png', '#1B5E20', '/images/brands/banner_multiservicios.png', NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 2. Commissions Groups
-- ----------------------------------------------------------------------------
INSERT INTO `commissions_groups` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Comisiones Estandar Red Urbana', 1, NOW(), NOW()),
(2, 'Comisiones Preferenciales Alto Volumen', 1, NOW(), NOW()),
(3, 'Comisiones Red Distribuidores Regionales', 1, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 3. Products (Financial Services Catalog)
-- ----------------------------------------------------------------------------
INSERT INTO `products` (`id`, `product_name`, `product_type`, `product_description`, `product_logo`, `product_commission`, `is_enabled`, `is_deleted`, `client_name`, `client_document`, `phone_number`, `email`, `account_type`, `account_number`, `code`, `extra`, `min_amount`, `max_amount`, `priority`, `num_jineteo`, `hours`, `reassignment_minutes`, `com_dis`, `com_shp`, `com_sup`, `fixed_commission`, `giros`, `are_default_fields`, `field_names`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Recarga Nequi', 'Deposit', 'Acreditacion inmediata de saldo a billetera Nequi Colombia', '/images/products/nequi.png', 500, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 5000, 2000000, 1, 3, 24, 3, 250, 450, 150, 850, 0, 1, 'Numero Celular Nequi, Titular, Cedula', 'Billeteras Moviles', NOW(), NOW()),
(2, 'Deposito Daviplata', 'Deposit', 'Deposito directo en cuenta monedero Daviplata Banco Davivienda', '/images/products/daviplata.png', 600, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 10000, 2000000, 1, 3, 24, 3, 300, 500, 200, 1000, 0, 1, 'Numero Celular Daviplata, Nombre, Cedula', 'Billeteras Moviles', NOW(), NOW()),
(3, 'Deposito Bancolombia Ahorros', 'Deposit', 'Consignacion en cuenta de ahorros o corriente Bancolombia', '/images/products/bancolombia.png', 800, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 10000, 3000000, 2, 5, 12, 5, 400, 700, 250, 1350, 0, 1, 'Numero Cuenta Bancolombia, Titular, Documento', 'Corresponsal Bancario', NOW(), NOW()),
(4, 'Deposito Ahorro a la Mano Bancolombia', 'Deposit', 'Consignacion cuenta ALM Bancolombia (antiguo Ahorro a la Mano)', '/images/products/ahorro_mano.png', 550, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 5000, 1500000, 2, 4, 12, 4, 250, 450, 150, 850, 0, 1, 'Numero Cuenta ALM, Titular, Cedula', 'Billeteras Moviles', NOW(), NOW()),
(5, 'Deposito Banco de Bogota', 'Deposit', 'Deposito en corresponsal Grupo Aval Banco de Bogota', '/images/products/banco_bogota.png', 800, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 10000, 3000000, 3, 4, 12, 5, 400, 650, 250, 1300, 0, 1, 'Numero Cuenta Aval, Nombre Titular, Documento', 'Corresponsal Bancario', NOW(), NOW()),
(6, 'Retiro Nequi con Pin', 'Withdrawal', 'Entrega de efectivo en miscelanea mediante codigo OTP Nequi de 6 digitos', '/images/products/retiro_nequi.png', 1000, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 10000, 1000000, 1, 2, 6, 3, 450, 900, 200, 1550, 0, 1, 'Celular Nequi, Pin Temporal 6 Digitos, Cedula', 'Retiros en Efectivo', NOW(), NOW()),
(7, 'Retiro Daviplata Codigo OTP', 'Withdrawal', 'Desembolso de efectivo con codigo temporal generado desde app Daviplata', '/images/products/retiro_daviplata.png', 1000, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 10000, 1000000, 1, 2, 6, 3, 450, 900, 200, 1550, 0, 1, 'Celular Daviplata, Codigo OTP 6 Digitos, Cedula', 'Retiros en Efectivo', NOW(), NOW()),
(8, 'Pago Factura Servicios Publicos', 'Payment', 'Recaudo de facturas Enel, EPM, Vanti, Acueducto de Bogota y Triple A', '/images/products/servicios_publicos.png', 700, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 2000, 5000000, 4, 10, 24, 10, 300, 550, 200, 1050, 0, 1, 'Referencia de Pago, Empresa Prestadora, Valor Factura', 'Recaudos y Facturas', NOW(), NOW()),
(9, 'Recarga Celular Multidestino', 'Recharge', 'Recargas en tiempo real para operadores Claro, Tigo, Movistar, Wom y Virgin', '/images/products/recargas_moviles.png', 350, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1000, 100000, 5, 10, 24, 2, 150, 300, 100, 550, 0, 1, 'Numero Celular, Operador Seleccionado', 'Operadores Moviles', NOW(), NOW()),
(10, 'Giro Nacional Corresponsal', 'Giro', 'Giro postal nacional con cobro en efectivo y confirmacion via SMS', '/images/products/giros.png', 1200, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 10000, 2500000, 2, 3, 24, 5, 500, 1000, 300, 1800, 1, 1, 'Remitente, Cedula Remitente, Beneficiario, Celular Beneficiario', 'Giros Nacionales', NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 4. Users (Hierarchy: Admin, Distributors, Shopkeepers, Suppliers)
-- Note: bcrypt hash corresponds to 'password'
-- ----------------------------------------------------------------------------
INSERT INTO `users` (`id`, `name`, `email`, `role`, `phone`, `balance`, `profit`, `max_queue`, `document_type`, `document`, `city`, `address`, `priority`, `is_online`, `is_enabled`, `email_verified_at`, `password`, `google2fa_secret`, `distributor_id`, `brand_id`, `commissions_group_id`, `balance_min_amount`, `developer_mode`, `webhook_url`, `giros`, `created_at`, `updated_at`) VALUES
(1, 'Administrador General Fintech', 'admin@example.com', 'Administrator', '3001234567', 0, 0, NULL, 'CC', '1018456789', 'Bogota', 'Carrera 7 # 71-52 Torre B Oficina 801', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', NULL, 1, NULL, 0, 1, 'https://api.example.com/v1/webhooks/audit', 1, NOW(), NOW()),
(2, 'Distribuidora Bogota Capital S.A.S.', 'distribuidor.bogota@example.com', 'Distributor', '3104567890', 18500000, 680000, 20, 'NIT', '901234567-1', 'Bogota', 'Avenida Calle 26 # 69D-91 Oficina 402', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', NULL, 1, 3, 1000000, 0, NULL, 1, NOW(), NOW()),
(3, 'Red Antioquia Express Distribuciones', 'distribuidor.medellin@example.com', 'Distributor', '3157891234', 14200000, 510000, 20, 'NIT', '901876543-2', 'Medellin', 'Carrera 43A # 1-50 San Fernando Plaza', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', NULL, 1, 3, 1000000, 0, NULL, 1, NOW(), NOW()),
(4, 'Miscelanea y Papeleria El Exito Chapinero', 'miscelanea.exito@example.com', 'Shopkeeper', '3112223344', 3450000, 185000, 5, 'CC', '52345678', 'Bogota', 'Calle 59 # 13-35 Local 102', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', 2, 1, 1, 200000, 1, 'https://webhook.site/test-merchant-chapinero', 1, NOW(), NOW()),
(5, 'Drogueria y Variedades Santa Maria', 'drogueria.santamaria@example.com', 'Shopkeeper', '3123334455', 2150000, 142000, 5, 'CC', '1020456123', 'Bogota', 'Carrera 15 # 119-48 Usaquen', 2, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', 2, 1, 1, 150000, 0, NULL, 1, NOW(), NOW()),
(6, 'Minimarket y Corresponsal La Floresta', 'minimarket.lafloresta@example.com', 'Shopkeeper', '3145556677', 4800000, 275000, 5, 'CC', '71234987', 'Medellin', 'Carrera 80 # 47D-20 La Floresta', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', 3, 1, 2, 300000, 1, 'https://webhook.site/test-merchant-floresta', 1, NOW(), NOW()),
(7, 'Tienda de Barrio y Multiservicios Sultana', 'tienda.lasultana@example.com', 'Shopkeeper', '3167778899', 1950000, 95000, 5, 'CC', '1144098234', 'Cali', 'Calle 5 # 38-12 Barrio San Fernando', 2, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', 2, 1, 1, 100000, 0, NULL, 1, NOW(), NOW()),
(8, 'Liquidity Master Provider Bancolombia', 'supplier.bancolombia@example.com', 'Supplier', '3189990011', 65000000, 0, 50, 'NIT', '900998877-3', 'Bogota', 'Carrera 48 # 26-85 Centro Financiero', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', NULL, 1, NULL, 5000000, 1, 'https://api.example.com/v1/supplier/bancolombia/notify', 0, NOW(), NOW()),
(9, 'Liquidity Master Provider Wallets Nequi/Daviplata', 'supplier.wallets@example.com', 'Supplier', '3191112233', 52000000, 0, 50, 'NIT', '900554433-4', 'Bogota', 'Calle 100 # 19-61 Edificio Trade Center', 1, 1, 1, NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JBSWY3DPEHPK3PXP', NULL, 1, NULL, 5000000, 1, 'https://api.example.com/v1/supplier/wallets/notify', 0, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 5. Cards (Disbursement Accounts & Settlement Balances)
-- ----------------------------------------------------------------------------
INSERT INTO `cards` (`id`, `cardIMG`, `cardPDF`, `bank`, `qr_img`, `min_amount`, `penalty`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, '/cards/bancolombia_master.png', '/cards/cert_bancolombia.pdf', 'Bancolombia', '/qr/qr_bancolombia_settlement.png', 50000, 0, 0, NOW(), NOW()),
(2, '/cards/davivienda_master.png', '/cards/cert_davivienda.pdf', 'Davivienda', '/qr/qr_davivienda_settlement.png', 50000, 0, 0, NOW(), NOW()),
(3, '/cards/banco_bogota_master.png', '/cards/cert_bogota.pdf', 'Banco de Bogota', '/qr/qr_bogota_settlement.png', 50000, 0, 0, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 6. User Banks
-- ----------------------------------------------------------------------------
INSERT INTO `user_banks` (`id`, `user_id`, `card_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NOW(), NOW()),
(2, 5, 2, NOW(), NOW()),
(3, 6, 1, NOW(), NOW()),
(4, 7, 3, NOW(), NOW()),
(5, 8, 1, NOW(), NOW()),
(6, 9, 2, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 7. Supplier Product Routing (Liquidity Providers)
-- ----------------------------------------------------------------------------
INSERT INTO `supplier_products` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, NOW(), NOW()), -- Supplier Wallets -> Nequi
(2, 9, 2, NOW(), NOW()), -- Supplier Wallets -> Daviplata
(3, 8, 3, NOW(), NOW()), -- Supplier Bancolombia -> Bancolombia Deposito
(4, 8, 4, NOW(), NOW()), -- Supplier Bancolombia -> ALM
(5, 8, 5, NOW(), NOW()), -- Supplier Bancolombia -> Banco Bogota
(6, 9, 6, NOW(), NOW()), -- Supplier Wallets -> Retiro Nequi
(7, 9, 7, NOW(), NOW()), -- Supplier Wallets -> Retiro Daviplata
(8, 8, 8, NOW(), NOW()), -- Supplier Bancolombia -> Facturas
(9, 9, 9, NOW(), NOW()), -- Supplier Wallets -> Recargas
(10, 8, 10, NOW(), NOW()); -- Supplier Bancolombia -> Giros

-- ----------------------------------------------------------------------------
-- 8. General Commissions & Group Pivots
-- ----------------------------------------------------------------------------
INSERT INTO `general_commissions` (`id`, `product_id`, `amount_dis`, `amount_shop`, `created_at`, `updated_at`) VALUES
(1, 1, 250, 450, NOW(), NOW()),
(2, 2, 300, 500, NOW(), NOW()),
(3, 3, 400, 700, NOW(), NOW()),
(4, 4, 250, 450, NOW(), NOW()),
(5, 5, 400, 650, NOW(), NOW()),
(6, 6, 450, 900, NOW(), NOW()),
(7, 7, 450, 900, NOW(), NOW()),
(8, 8, 300, 550, NOW(), NOW()),
(9, 9, 150, 300, NOW(), NOW()),
(10, 10, 500, 1000, NOW(), NOW());

INSERT INTO `commissions_group_general_commissions` (`id`, `comm_group_id`, `gen_comm_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NOW(), NOW()),
(2, 1, 2, NOW(), NOW()),
(3, 1, 3, NOW(), NOW()),
(4, 1, 4, NOW(), NOW()),
(5, 1, 5, NOW(), NOW()),
(6, 1, 6, NOW(), NOW()),
(7, 1, 7, NOW(), NOW()),
(8, 1, 8, NOW(), NOW()),
(9, 1, 9, NOW(), NOW()),
(10, 1, 10, NOW(), NOW()),
(11, 2, 1, NOW(), NOW()),
(12, 2, 2, NOW(), NOW()),
(13, 2, 3, NOW(), NOW()),
(14, 2, 6, NOW(), NOW()),
(15, 2, 7, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 9. User Transaction Limits (Anti-Smurfing & Anti-Jineteo Guardrails)
-- ----------------------------------------------------------------------------
INSERT INTO `user_transaction_limits` (`id`, `user_id`, `product_id`, `lower_limit`, `upper_limit`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 5000.00, 2000000.00, NOW(), NOW()),
(2, 4, 2, 10000.00, 2000000.00, NOW(), NOW()),
(3, 4, 3, 10000.00, 3000000.00, NOW(), NOW()),
(4, 5, 1, 5000.00, 1500000.00, NOW(), NOW()),
(5, 5, 2, 10000.00, 1500000.00, NOW(), NOW()),
(6, 6, 1, 5000.00, 2500000.00, NOW(), NOW()),
(7, 6, 3, 10000.00, 3500000.00, NOW(), NOW()),
(8, 7, 1, 5000.00, 1000000.00, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 10. Balances (Top-Up Consignments & Authorizations)
-- ----------------------------------------------------------------------------
INSERT INTO `balances` (`id`, `user_id`, `amount`, `date`, `admin_date`, `is_valid`, `type`, `boucher`, `comment`, `bank_id`, `card_id`, `administrator_id`, `payment_code`, `is_assigned`, `indirect`, `product_name`, `created_at`, `updated_at`) VALUES
(1, 4, 5000000, '2024-11-20', '2024-11-20 09:30:00', 1, 'Consignacion Bancaria', 'BOUCH-BOG-20241120-001', 'Recarga aprobada via transferencia Bancolombia Corresponsal', 1, 1, 1, 'PAY-89123-BOG', 1, 0, 'Recarga Saldo Operativo', NOW(), NOW()),
(2, 5, 3000000, '2024-11-20', '2024-11-20 10:15:00', 1, 'Consignacion Bancaria', 'BOUCH-BOG-20241120-002', 'Aprobado soporte consignacion Davivienda', 2, 2, 1, 'PAY-45129-BOG', 1, 0, 'Recarga Saldo Operativo', NOW(), NOW()),
(3, 6, 8000000, '2024-11-21', '2024-11-21 08:45:00', 1, 'Transferencia Directa', 'BOUCH-MED-20241121-001', 'Aprobado distribuidor regional Antioquia', 1, 1, 1, 'PAY-77182-MED', 1, 0, 'Recarga Saldo Operativo', NOW(), NOW()),
(4, 7, 2500000, '2024-11-21', '2024-11-21 11:20:00', 1, 'Consignacion Bancaria', 'BOUCH-CAL-20241121-001', 'Soporte Banco de Bogota verificado', 3, 3, 1, 'PAY-11029-CAL', 1, 0, 'Recarga Saldo Operativo', NOW(), NOW()),
(5, 4, 2000000, '2024-11-22', NULL, NULL, 'Consignacion Bancaria', 'BOUCH-BOG-20241122-005', 'Pendiente revision comprobante Bancolombia', 1, 1, NULL, 'PAY-99120-BOG', 0, 0, 'Recarga Saldo Operativo', NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 11. Transactions (Financial Ledger of Operations)
-- Statuses: completed, hold, assigned, cancelled
-- ----------------------------------------------------------------------------
INSERT INTO `transactions` (`id`, `shopkeeper_id`, `distributor_id`, `supplier_id`, `admin_id`, `product_id`, `account_number`, `amount`, `type`, `status`, `detail`, `date`, `voucher`, `comment`, `com_adm`, `com_dis`, `com_sup`, `com_shp`, `userIP`, `first_transaction`, `own_commission`, `observation`, `giros`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 9, 1, 1, '3119876543', 150000, 'Recarga', 'completed', 'Recarga Nequi autorizada y confirmada por proveedor', '2024-11-21', 'TX-NEQ-1002931', 'Operacion exitosa', 150, 250, 150, 450, '186.84.90.12', 1, 450, 'Aprobada sin novedades', 0, '2024-11-21 10:14:22', '2024-11-21 10:15:05'),
(2, 4, 2, 9, 1, 2, '3142233445', 280000, 'Deposito', 'completed', 'Deposito Daviplata verificado en linea', '2024-11-21', 'TX-DAV-2009182', 'Acreditado a cuenta de ahorro', 200, 300, 200, 500, '186.84.90.12', 1, 500, 'Aprobada por proveedor', 0, '2024-11-21 11:22:10', '2024-11-21 11:23:01'),
(3, 5, 2, 8, 1, 3, '24100918273', 500000, 'Deposito', 'completed', 'Consignacion corresponsal Bancolombia Ahorros', '2024-11-21', 'TX-BAN-3091827', 'Soporte bancario validado', 250, 400, 250, 700, '190.158.12.44', 1, 700, 'Transaccion liquidada', 0, '2024-11-21 12:45:00', '2024-11-21 12:46:15'),
(4, 6, 3, 9, 1, 6, '3187654321', 100000, 'Retiro', 'completed', 'Retiro de efectivo en miscelanea codigo Nequi', '2024-11-21', 'TX-RET-4091823', 'Efectivo entregado a cliente tras validar OTP', 200, 450, 200, 900, '181.137.89.5', 1, 900, 'PIN OTP validado', 0, '2024-11-21 14:10:00', '2024-11-21 14:11:12'),
(5, 6, 3, 8, 1, 8, '8892019283-1', 125000, 'Pago', 'completed', 'Pago de factura energia EPM Colombia', '2024-11-21', 'TX-PAG-5019283', 'Recaudo aplicado a empresa de servicios', 200, 300, 200, 550, '181.137.89.5', 1, 550, 'Factura al dia', 0, '2024-11-21 15:30:45', '2024-11-21 15:32:00'),
(6, 4, 2, 9, 1, 1, '3119876543', 200000, 'Recarga', 'completed', 'Segunda recarga Nequi a mismo numero en ventana de control', '2024-11-21', 'TX-NEQ-1002955', 'Segunda transaccion permitida por anti-jineteo', 150, 250, 150, 450, '186.84.90.12', 0, 450, 'Control anti-jineteo: intento 2 de 3', 0, '2024-11-21 16:05:12', '2024-11-21 16:06:00'),
(7, 5, 2, 9, 1, 1, '3009988776', 350000, 'Recarga', 'assigned', 'Recarga Nequi en proceso de dispersion por proveedor', '2024-11-22', NULL, 'Asignado a Liquidity Wallets Provider', 150, 250, 150, 450, '190.158.12.44', 1, 450, 'En cola de procesamiento', 0, '2024-11-22 08:15:30', '2024-11-22 08:15:45'),
(8, 6, 3, 8, 1, 10, '3156677889', 400000, 'Giro', 'hold', 'Giro nacional en espera de verificacion de cedula', '2024-11-22', NULL, 'En espera de liquidacion', 300, 500, 300, 1000, '181.137.89.5', 1, 1000, 'Esperando autorizacion central', 1, '2024-11-22 08:45:00', '2024-11-22 08:45:00'),
(9, 7, 2, 9, 1, 2, '3171239876', 500000, 'Deposito', 'cancelled', 'Rechazado por exceder saldo de billetera destino', '2024-11-22', NULL, 'Cancelado por sistema: limite legal de topes mensuales Nequi', 0, 0, 0, 0, '186.84.90.12', 1, 0, 'Cancelado: cuenta receptora bloqueada', 0, '2024-11-22 09:10:00', '2024-11-22 09:12:15');

-- ----------------------------------------------------------------------------
-- 12. Summaries (Double-entry Ledger Audit Trail)
-- ----------------------------------------------------------------------------
INSERT INTO `summaries` (`id`, `movement_id`, `user_id`, `movement_type`, `amount`, `previous_balance`, `next_balance`, `bank`, `fixed_commission`, `product_name`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Recarga Saldo Operativo', 5000000, 0, 5000000, 'Bancolombia', 0, 'Abono Saldo Bancario', NOW(), NOW()),
(2, 1, 4, 'Transaccion Debito', 150000, 5000000, 4850000, 'Nequi', 450, 'Recarga Nequi', NOW(), NOW()),
(3, 2, 4, 'Transaccion Debito', 280000, 4850000, 4570000, 'Daviplata', 500, 'Deposito Daviplata', NOW(), NOW()),
(4, 6, 4, 'Transaccion Debito', 200000, 4570000, 4370000, 'Nequi', 450, 'Recarga Nequi', NOW(), NOW()),
(5, 3, 5, 'Transaccion Debito', 500000, 3000000, 2500000, 'Bancolombia', 700, 'Deposito Bancolombia Ahorros', NOW(), NOW()),
(6, 4, 6, 'Transaccion Debito', 100000, 8000000, 7900000, 'Nequi', 900, 'Retiro Nequi con Pin', NOW(), NOW()),
(7, 5, 6, 'Transaccion Debito', 125000, 7900000, 7775000, 'EPM', 550, 'Pago Factura Servicios Publicos', NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 13. Platforms
-- ----------------------------------------------------------------------------
INSERT INTO `platforms` (`id`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 1, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 14. Answers (Preloaded Knowledge Base for Merchants)
-- ----------------------------------------------------------------------------
INSERT INTO `answers` (`id`, `answer`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Si una recarga a Nequi figura en estado hold por mas de 3 minutos, el sistema reasignara automaticamente la operacion al proveedor de respaldo sin descontar doble saldo de la cuenta de la miscelanea.', 0, NOW(), NOW()),
(2, 'Los retiros con codigo OTP de Daviplata tienen una vigencia de 45 minutos desde el momento de generacion en la app del cliente antes de expirar.', 0, NOW(), NOW()),
(3, 'El control anti-jineteo bloquea transferencias consecutivas al mismo numero de cuenta una vez alcanzado el tope parametrizado para evitar requerimientos fiscales por 4x1000.', 0, NOW(), NOW());

-- ----------------------------------------------------------------------------
-- 15. Spatie Permissions & Roles
-- ----------------------------------------------------------------------------
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'web', NOW(), NOW()),
(2, 'Distributor', 'web', NOW(), NOW()),
(3, 'Shopkeeper', 'web', NOW(), NOW()),
(4, 'Supplier', 'web', NOW(), NOW());

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Ver top tenderos', 'web', NOW(), NOW()),
(2, 'Ver roles y permisos', 'web', NOW(), NOW()),
(3, 'Ver configuracion', 'web', NOW(), NOW()),
(4, 'Ver usuarios', 'web', NOW(), NOW()),
(5, 'Ver grupo de productos', 'web', NOW(), NOW()),
(6, 'Ver comisiones', 'web', NOW(), NOW()),
(7, 'Ver transacciones', 'web', NOW(), NOW()),
(8, 'Ver saldos', 'web', NOW(), NOW()),
(9, 'Ver ganancias', 'web', NOW(), NOW()),
(10, 'Ver footer proveedor', 'web', NOW(), NOW()),
(11, 'Ver footer administador', 'web', NOW(), NOW()),
(12, 'Ver tenderos de distribuidor', 'web', NOW(), NOW()),
(13, 'Ver todos los tenderos', 'web', NOW(), NOW()),
(14, 'Ver comisiones desplegable', 'web', NOW(), NOW()),
(15, 'Ver contactar distribuidor', 'web', NOW(), NOW()),
(16, 'Ver ultimas transacciones', 'web', NOW(), NOW()),
(17, 'Ver todas las transacciones', 'web', NOW(), NOW()),
(18, 'Ver nueva transaccion', 'web', NOW(), NOW()),
(19, 'Ver nuevo giro', 'web', NOW(), NOW()),
(20, 'Ver mis transacciones', 'web', NOW(), NOW()),
(21, 'Ver transacciones en espera', 'web', NOW(), NOW()),
(22, 'Ver historial de transacciones', 'web', NOW(), NOW()),
(23, 'Ver recargar saldo', 'web', NOW(), NOW()),
(24, 'Ver historial de saldos', 'web', NOW(), NOW()),
(25, 'Ver historial de solicitudes de saldos', 'web', NOW(), NOW()),
(26, 'Ver solicitudes de saldo', 'web', NOW(), NOW()),
(27, 'Ver saldo por usuario', 'web', NOW(), NOW()),
(28, 'Ver solicitudes de ganancias', 'web', NOW(), NOW()),
(29, 'Ver retirar ganancias', 'web', NOW(), NOW()),
(30, 'Ver historial retiros ganancia', 'web', NOW(), NOW()),
(31, 'Ver grupos de comisiones', 'web', NOW(), NOW());

-- Assign all permissions to Administrator
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (17, 1), (21, 1), (22, 1), (26, 1), (27, 1), (28, 1), (31, 1),
-- Permissions for Distributor
(12, 2), (14, 2), (17, 2), (22, 2), (23, 2), (24, 2), (26, 2), (29, 2), (30, 2),
-- Permissions for Shopkeeper
(15, 3), (16, 3), (18, 3), (19, 3), (20, 3), (22, 3), (23, 3), (24, 3), (29, 3), (30, 3),
-- Permissions for Supplier
(10, 4), (21, 4), (22, 4);

-- Assign Model Roles
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9);

SET FOREIGN_KEY_CHECKS = 1;
