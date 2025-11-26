SET TIMEZONE = 'UTC';

DROP TABLE IF EXISTS container_size;
CREATE TABLE IF NOT EXISTS container_size(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    container_size_id uuid primary key DEFAULT gen_random_uuid(),
    container_size_code varchar(36) unique,

    container_size_title varchar(120),
    load_weight double precision,
    load_cbm double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO container_size(container_size_id, container_size_code, container_size_title) VALUES
('2ce4a675-b333-4924-ba61-87c6e9a623c8', '20GP', '20''GP'),
('d2c95a26-122e-405d-9bd6-95d2c431bc5c', '40GP', '40''GP'),
('3e9cefbb-8d87-4066-93dd-f683e88e7f87', '40HC', '40''HC'),
('d62abf81-d68e-40f5-8cc6-31f3cd474fa3', '45HC', '45''HC');

DROP TABLE IF EXISTS chargeable_option;
CREATE TABLE IF NOT EXISTS chargeable_option(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    chargeable_option_id uuid primary key DEFAULT gen_random_uuid(),
    chargeable_option_code varchar(36) unique,

    chargeable_option_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO chargeable_option(chargeable_option_id, chargeable_option_code, chargeable_option_title) VALUES
('d381efab-b1b5-45d4-a6f8-d1d8a00ab6d9', 'CNT', 'CONTAINER'),
('c1ce59e7-39a3-4421-9d9f-bbad2356922b', 'CBM', 'CBM'),
('797decba-90d4-4e32-9243-a9fef4463261', 'KGS', 'KGS'),
('7501ed2d-70a1-4e00-abfc-16b48c976cb5', 'SET', 'SET'),
('8a0d55ac-ffdd-4881-905c-1b445fd874fc', 'UNT', 'UNIT'),
('1b38b656-1531-45fd-9ce7-d4ff4f1dce1a', 'TRP', 'TRIP'),
('d2183ec9-ad36-4e99-8aec-6eacc1327b1f', 'PKG', 'PER PACKAGE'),
('010f2fe1-c60f-4623-be21-f48162c19f8e', 'PCS', 'PER PIECE'),
('a71b181c-6da1-449a-a3fd-53307b493bce', 'SHT', 'PER SHIPMENT');

DROP TABLE IF EXISTS chargeable_option_title;
CREATE TABLE IF NOT EXISTS chargeable_option_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    chargeable_option_id uuid,
    chargeable_option_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (chargeable_option_id, lang)
);

DROP TABLE IF EXISTS uom;
CREATE TABLE IF NOT EXISTS uom(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    uom_id uuid primary key DEFAULT gen_random_uuid(),
    uom_code varchar(36) unique,

    uom_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO uom(uom_id, uom_code, uom_title) VALUES
('3668e46b-86cd-4cff-94c5-c5f0cdb98c60', 'CTN', 'Carton'),
('eb62901d-4f2d-4af0-9816-98945c09023f', 'PKG', 'Package');

DROP TABLE IF EXISTS uom_title;
CREATE TABLE IF NOT EXISTS uom_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    uom_id uuid,
    uom_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (uom_id, lang)
);

DROP TABLE IF EXISTS item_charge_type;
CREATE TABLE IF NOT EXISTS item_charge_type(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    item_charge_type_id uuid primary key DEFAULT gen_random_uuid(),
    item_charge_type_code varchar(36) unique,

    company_id uuid,
    item_charge_type_title varchar(120),
    order_level int,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO item_charge_type(item_charge_type_id, company_id, item_charge_type_code, item_charge_type_title, order_level) VALUES
('94626e9c-68aa-487e-a270-59becbe54b5b', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'INV', 'INVOICE', 1),
('a646bda3-6f12-40a0-8013-1251319ac81a', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'REM', 'REIMBURSEMENT', 2),
('a6721e9b-21dd-4ad6-b451-846b87c233de', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'EXP', 'EXPENSE', 3),
('f5e0347b-de8e-4762-ac10-2936c056d6aa', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'BIL', 'BILL', 4);

DROP TABLE IF EXISTS item_charge_type_title;
CREATE TABLE IF NOT EXISTS item_charge_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    item_charge_type_id uuid,
    item_charge_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (item_charge_type_id, lang)
);

DROP TABLE IF EXISTS item_charge_category;
CREATE TABLE IF NOT EXISTS item_charge_category(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    item_charge_category_id uuid primary key DEFAULT gen_random_uuid(),
    item_charge_category_code varchar(36) unique,

    company_id uuid,
    item_charge_category_title varchar(120),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO item_charge_category(item_charge_category_id, company_id, item_charge_category_code, item_charge_category_title) VALUES
('e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'LOC', 'LOCAL CHARGE'),
('e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'CST', 'CUSTOMS CHARGE'),
('9f3abb27-2cef-4fe3-810d-92dfca1572b1', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'HND', 'HANDLING CHARGE'),
('1823637d-120d-4096-ad8b-59b870d04736', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'FRE', 'FREIGHT CHARGE'),
('2237372e-ec66-41ec-b9c8-138328029c67', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'OVS', 'OVERSEAS CHARGE'),
('78361f0b-92f2-40dc-8758-b412670be0a2', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'POT', 'PORT CHARGE'),
('9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'TRK', 'TRUCKING CHARGE'),
('946f11f3-d8d9-449f-9160-0327c025ce48', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'OTH', 'OTHER');

DROP TABLE IF EXISTS item_charge_category_title;
CREATE TABLE IF NOT EXISTS item_charge_category_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    item_charge_category_id uuid,
    item_charge_category_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (item_charge_category_id, lang)
);

DROP TABLE IF EXISTS item_charge;
CREATE TABLE IF NOT EXISTS item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    item_charge_code varchar(36) unique,

    company_id uuid,
    item_charge_title varchar(120),
    vat_rate double precision,
    item_charge_type_id uuid not null,
    item_charge_category_id uuid not null,
    if_any_status int,
    description varchar(250),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO item_charge(item_charge_id, company_id, item_charge_code, vat_rate, item_charge_type_id, item_charge_category_id, if_any_status, item_charge_title) VALUES
('37dcfade-fa6a-438b-8b30-8900964e93aa', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25001', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'ACYCUDA APPLICATION'),
('8ff249a6-ab3e-493d-ba3f-aaab9bf051e5', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25002', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CDC APPROVAL'),
('af820aba-8344-48ef-8b41-d396499af5d1', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25003', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CO APPROVAL'),
('cd5239f9-3fab-414c-b3b5-64e2267432ff', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25004', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CO ENDORSMENT'),
('77a7b27b-797d-4c63-99f3-460000f8a4d5', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25005', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CROSS BORDER FEE'),
('646165aa-a770-4ab5-9038-9c6e02dc1c29', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25006', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS APPROVAL'),
('bf10363e-7f47-4f75-87a6-af8319ad44ad', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25007', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS CLEARANCE'),
('25de5b79-42f1-4e17-a79d-bb6dae5cc501', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25008', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS EXPLAINATORY LETTER '),
('17726b48-d81b-4159-a100-4e0905eff099', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25009', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS FACILITATION'),
('282b86bf-59f1-4566-8786-eb94a30488f5', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25010', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS INSPECTION FEE'),
('49285747-6e15-45ed-9564-94d160670474', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25011', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS PERMIT'),
('366948bc-611a-484a-8dc5-ca3f8a51af16', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25012', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS VALUATION'),
('09cd19db-ce49-4ad8-aecd-6450facef599', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25013', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUT SEAL AND REPORT'),
('fa179e1a-5741-4d44-a50b-2dfa76802a49', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25014', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'EXPRESS CUSTOMS PERMIT​'),
('a5a172eb-077e-47e0-895a-fc9e6555aab2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25015', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'EXPRESS CUSTOMS VALUATION'),
('87310b65-4cab-4641-8fe0-dbd34a94a012', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25016', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'EXPRESS RED DOCUMENT'),
('cbf8afcc-70c6-429a-8d22-b0e9a4c78ddd', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25017', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'EXTRA DECLARATION'),
('d4f4ea3f-6d4e-472c-8749-9f2d3760cbdd', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25018', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'EXTRA FOR CUSTOMS'' GASOLINE'),
('61a7a271-fdb0-421e-a8da-a17829176609', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25019', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'EXTRA SECURITY CHARGE FEE'),
('ad7634bd-a741-4d6c-bb01-a39c451bf245', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25020', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'LATE PERMIT'),
('d0bf949a-f4f4-4219-80f9-e9b9e7c7429e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25021', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'NEW TRADER APPLICATION'),
('e17cc7e5-ad41-4249-8852-8d7ca34bad6b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25022', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'NON INSURANCE DOCUMENT'),
('fa023a7e-b351-4e9b-b983-a8e12a6c4f5a', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25023', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'OTHER FACILITATION'),
('929b7c9f-33a9-4921-9cd4-7659fbc49638', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25024', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'OVER TIME CUSTOMS'),
('d9b90356-0944-4220-aeb8-f207e569fcb7', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25025', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'OVER TIME INSPECTION'),
('53d5ff8c-1b18-49da-9645-32e6fd27b373', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25026', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'OVER TIME DOCUMENT'),
('4e005d44-730b-4431-94d3-38fdca98abcc', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25027', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'OWE IMPORT PERMIT'),
('99965f6b-60a8-4605-9e83-8d9810190ff1', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25028', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'PERMIT OWE CDC BY DEPOSIT TAX '),
('ef3a8f4a-7d33-43c4-9747-5bd3d9aa06da', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25029', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'PERMIT OWE CDC BY NON-DEPOSIT TAX '),
('7b7983d5-609e-43ff-bd05-24394a9e1dba', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25030', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'RED DECLARATION'),
('5be4cf3c-c2cf-4906-b085-e8870eae334c', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25031', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'RE-EXPORT PERMIT'),
('b2707449-8b09-4af7-9eee-90bfc1c5dacc', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25032', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'RE-IMPORT PERMIT'),
('4ef514d5-4400-4118-8132-6d179e919552', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25033', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 1, 'SKIP INSPECTION CHARGE'),
('63ee0afd-1b0d-4856-aac9-d72050223137', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25034', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'TAX COUNTING FEE'),
('8bf17e54-7ba5-4b94-9604-1f1bb898140e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25035', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'TAX WITHDRAWAL APPROVAL'),
('16d13642-051d-4fdb-90f4-349559735fb8', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25036', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'TEMPORARY IMPORT PERMIT'),
('78b6f0f4-ac77-4588-99a5-49ca5f3ff885', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25037', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'TRANSIT CLEARANCE'),
('ade0cdea-5862-4acd-a11f-3308b0601a50', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25038', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'ADDITIONAL TAX'),
('c023be38-47cb-4af3-9863-88d9135b8817', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25039', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CONTAINER INSPECTION IN OFFICE HOUR'),
('7db4b021-e621-4d0c-8636-875a2bfab444', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25040', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CONTAINER INSPECTION OUT OFFICE OF HOUR'),
('205d8f20-2276-4880-80e6-1eaa71630868', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25041', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS DECLARATION FEE'),
('4ba5eeeb-53ac-420b-ad25-d5dae4bba4a1', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25042', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS PROCESSING FEE'),
('963c2b0b-7eee-448e-825d-886b8a0f988e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25043', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS SCANNING FEE'),
('71014486-ae5e-4a34-ab0f-0c5445bd3b71', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25044', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'CUSTOMS SEAL FEE'),
('df2fd7c3-25b5-47ed-98d1-0052ff6a0b69', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25045', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'IMPORT TAX'),
('60e195e3-874c-41e8-a63d-4dcf0b7de84b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25046', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'OVER STOCK CUSTOMS'),
('b99d0b55-4996-49f5-b212-6f91d6d9d841', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25047', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'TAX DEPOSIT'),
('8b847f1e-ee42-4103-a8b0-0ae86b16b506', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25048', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e77bce12-8466-4d98-9bc4-1ea29e97c4ab', 0, 'VIHECLE RECEIPT'),
('61c5071d-f1d3-4e6e-b545-5940e8ecf9fd', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25049', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '1823637d-120d-4096-ad8b-59b870d04736', 0, 'AIR FREIGHT CHARGE'),
('b063d7ba-70d4-4de8-9d75-2f679955221e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25050', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '1823637d-120d-4096-ad8b-59b870d04736', 0, 'BUNKER ADJUSTMENT FACTOR'),
('380bbfc8-5732-432b-a94c-89bd042b3c66', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25051', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '1823637d-120d-4096-ad8b-59b870d04736', 0, 'OCEAN FREIGHT'),
('f6ea2707-d89d-4db9-b5a9-8f23d125e90b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25052', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9f3abb27-2cef-4fe3-810d-92dfca1572b1', 0, 'AGENCY FEE'),
('fa3aff61-8783-4b89-84d6-bb8a77e79449', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25053', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9f3abb27-2cef-4fe3-810d-92dfca1572b1', 0, 'CUT, TAG & HANDLING FEE'),
('7dcc8768-fd5a-4e72-8699-3415a97c09e0', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25054', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9f3abb27-2cef-4fe3-810d-92dfca1572b1', 0, 'HANDLING FEE'),
('82b228e8-d1f5-44d2-a992-055a4af7b0e3', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25055', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'ACI FILLING FEE'),
('a8d2aa65-f464-4843-851b-1273d902a8ec', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25056', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'AFR FILLING FEE'),
('b1aa09db-6a27-4458-8836-c6ae8f177b25', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25057', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 1, 'ALCOHOL''S  SPRAY'),
('8bde689d-89ac-46b0-80e5-002eb85605cb', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25058', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'AMS FILLING FEE'),
('0898a076-3245-458d-a57c-c21b63a35af2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25059', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'AWB FEE'),
('dcb69851-106c-4d39-81bb-c5e267c88d59', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25060', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'BL AMENMEND FEE'),
('5b6bb48e-f0d2-4544-b5c9-ed35404ca46f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25061', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'CANCEL BOOKING CHARGE'),
('f39b4d95-6dd0-4580-a571-c003045f563a', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25062', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'CARGO TRANSLOADING '),
('a085ab91-a874-4dad-a93d-c82582b436b3', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25063', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'CFS CHARGES'),
('11219949-d9ee-4866-be33-64b3aaea17ff', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25064', null, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'CONTAINER CLEANING FEE'),
('14ad2f06-788d-41bf-a22c-de7f3e272b65', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25065', null, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'CONTAINER IMBALANCE CHARGE (CIC)'),
('d327b53e-1884-4636-9387-798417d6717a', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25066', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'DELIVERY ORDER FEE'),
('73c9e71f-83c5-4839-9c4f-26195af6970b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25067', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'DOCUMENT FEE'),
('ba068bd7-23fc-47dc-ab06-1f958670cf7e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25068', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'EIB FEE'),
('5b55b805-9bd6-4a8b-a17e-04c493f2555b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25069', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'EMS FEE'),
('e3cf1094-0467-4770-a28e-0b86f004de8e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25070', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'ENS FILLING FEE'),
('00a79757-336a-49c1-9ab5-fc771a98ed2d', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25071', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'FUEL SURCHARGE'),
('56bcc85d-35ac-4fa3-9193-1d00e89dff79', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25072', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'HBL FEE'),
('161b7cb8-1ba6-4332-be9d-65e703b54a04', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25073', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'LCL FEE'),
('c48e46d7-e366-4f9e-beb0-92694130547c', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25074', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'LIFT ON/LIFT OFF '),
('d0c14b91-b704-4676-8561-2010293c325b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25075', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'LOADING FEE'),
('f2662563-a915-490a-b643-caa74a107fa0', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25076', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'LOCAL CHARGE'),
('85de7954-88e3-4bb6-b5ea-c17d6de881e2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25077', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'LOCAL EMPTY CONTAINER RENTAL FEE'),
('aed2916f-6c8d-4138-b6fa-26343d86efbe', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25078', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'MAWB FEE'),
('54dbdc42-01c2-45b4-83da-4822a28e72c0', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25079', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'MINISTRY PERMIT'),
('6ccc5eb2-53be-45c4-b4eb-6079b6a6164c', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25080', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'SCANNING FEE'),
('bde625ea-12f5-4b89-ab67-7203e6dcdd7b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25081', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'SEAL FEE'),
('8b42627b-a812-4413-a376-c7798c739a18', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25082', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'STUFFING FEE'),
('34c7e55e-8daf-49ff-b575-7aef453183cd', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25083', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'SURRENDER FEE'),
('b6eeb325-c153-49ec-842b-032287346683', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25084', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'TERMINAL HANDLING CHARGE 20'''),
('cad69ab8-488a-405c-a786-1851faaa0f09', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25085', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'TERMINAL HANDLING CHARGE 40'''),
('a3078786-0a64-4b4f-9b07-0b8487f1287f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25086', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'TERMINAL HANDLING CHARGE 45'''),
('97ced0da-dad3-4472-83c3-e450df9239c2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25087', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'UNLOADING FEE'),
('3b35bbd1-6be0-45e1-b35b-8f75a703c0a7', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25088', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'UN-STUFFING FEE'),
('a58f74a7-82dd-47e8-9767-33e336fc39b8', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25089', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'WORKER FEE'),
('ca493f87-60e7-469d-a1f8-2136db7834f0', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25090', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'CARTON FEE'),
('fedebcc2-dac4-4036-8665-f796593a5ee2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25091', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'DEMURRAGE CHARGE'),
('41c60af8-505a-4ae3-a7cc-86457223211c', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25092', null, 'a646bda3-6f12-40a0-8013-1251319ac81a', 'e1e0769b-7cc4-4f1a-8eb9-8f8792af63db', 0, 'DETENTION CHARGE'),
('c768ee46-3589-4120-b75c-078d1ae83406', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25093', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'CARGO PICK UP FROM HCM TO TMS CFS '),
('0e57c098-cff3-443d-b4df-184e3d32afc8', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25094', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'CARGO PICK UP-OVERSEAS'),
('ff65383e-0cc3-4d84-a5f5-48c568a7e05f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25095', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'EXPORT CUSTOMS CLEARANCE AT HCM'),
('daab7c2d-9de8-4a88-998d-e9c0b9195a0f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25096', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'EXPORT CUSTOMS CLEARANCE AT VSIP1'),
('59af58c2-31e0-4b5a-9774-10a4d94e93d0', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25097', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'EXPORT HANDLING CHARGE '),
('99793478-38ec-4b13-a58f-22b66c8715bb', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25098', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'EXWORK CHARGE '),
('1b546c86-1eeb-4088-a163-827aae3553a3', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25099', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'OVERSEAS CUSTOMS CLEARANCE'),
('727c7140-47e5-4454-9129-416e9fa71f4a', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25100', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'OVERSEAS CUSTOMS CFS CHARGE'),
('d61e6cae-affd-4634-91da-656eb716f1cb', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25101', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'OVERSEAS EMPTY CONTAINER RENTAL FEE'),
('74d88aa2-72c4-422d-afce-189551b33ad2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25102', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'OVERSEAS STANDBY TRUCK FEE'),
('737577c8-50a0-418f-882c-b7ec6e7d7522', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25103', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'OVERSEAS TRUCKING FEE'),
('72fb6205-1b95-4ded-911f-6d6067bb80d2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25104', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'PACKAGE FEE'),
('c2d33710-c09a-4e21-b83e-dd7d555b097b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25105', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'TRUCKING FROM CFS TO MOC BAI'),
('338af0d9-af9e-465c-8009-0b10197b86bd', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25106', 0, '94626e9c-68aa-487e-a270-59becbe54b5b', '2237372e-ec66-41ec-b9c8-138328029c67', 0, 'TRUCKING FROM VSIP1 TO MOC BAI'),
('c4dfb51d-ce6b-49db-9260-ca2fe5df007f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25107', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'LATE GET CHARGE'),
('1a76fb9b-df49-4bae-bd44-810932663e61', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25108', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'OVERTIME AT PORT'),
('0e9924cb-e056-4aa2-8882-ceece7672744', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25109', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'AIRPORT STORAGE CHARGE'),
('1e68b1b5-2cad-4eeb-a1e1-71621d8751b3', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25110', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'ELECTRICITY CHARGE'),
('7ea5fb43-373c-4062-b7f8-ebc23e635d7e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25111', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'LO/LO EMPTY'),
('c3c5bdc9-3cb3-4b27-a006-78dd669af41e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25112', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'LO/LO FEE AT PORT'),
('0cca108f-4cac-48e1-9fdc-46ee3d3f5992', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25113', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'PORT CHARGE'),
('74978387-8290-411d-8b90-bee2bbe7edb1', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25114', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'PORT GATE FE'),
('2d09e59e-69e5-4ec5-912d-5567c7f17d74', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25115', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'PORT STORAGE CHARGE'),
('bf39839b-bbfc-4d06-bc51-6a48f5b7b895', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25116', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'WAREHOUSE CHARCE'),
('e857aebc-f7d1-4fb8-933d-9817af46e2df', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25117', 10, 'a646bda3-6f12-40a0-8013-1251319ac81a', '78361f0b-92f2-40dc-8758-b412670be0a2', 0, 'WRONG WIEGHT'),
('b89ac835-bb76-4c09-92c1-48fea3e9121f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25118', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'LOCAL STANDBY TRUCK FEE​'),
('60996389-fa83-43dc-9bc6-6795bb7cab08', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25119', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'OVER WEIGHT CHARGE'),
('1d922aae-789b-4751-a6e3-b0c881284b52', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25120', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'RETURN EMPTY CONTAINER'),
('74433be0-4000-4e1e-97b7-0b42da049eff', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25121', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCK CANCELLATION CHARGE'),
('af537f91-5cdf-4365-a3e7-9d1be66994dc', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25122', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 1.5T'),
('6435c1c0-7d94-4b31-b704-b64a1527768b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25123', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 2.5T'),
('d6b61575-a715-4b25-9ea5-04007052fd94', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25124', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 3.5T'),
('f798601c-30d6-486c-943c-2d2a882d7d85', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25125', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 5T'''),
('6000c04a-be70-4177-9708-7360cd77e990', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25126', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 20'''),
('108ca164-a3ea-4b8f-a628-b19e55c03471', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25127', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 40'''),
('cf80612e-2b1b-4f3c-a1cb-2b1408e19196', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25128', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '9a3c1611-6d1c-47d7-a32b-14289fdb3ba6', 0, 'TRUCKING FEE 45'''),
('314d6e01-a483-4502-b81a-3192bfad2e60', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25129', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '946f11f3-d8d9-449f-9160-0327c025ce48', 0, 'LATE GATE FEE IN WAREHOUSE'),
('089a40a3-3f76-469e-9352-086b6558d8d7', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25130', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '946f11f3-d8d9-449f-9160-0327c025ce48', 0, 'MEDICAL EQUIPMENT FEE'),
('03bd1753-3288-4c6b-96a1-dcb4db59bc31', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25131', 10, '94626e9c-68aa-487e-a270-59becbe54b5b', '946f11f3-d8d9-449f-9160-0327c025ce48', 0, 'QUANTITY CERTIFICATE'),
('35babb7d-2a48-4dbc-bea2-ed845529599d', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25132', null, 'a6721e9b-21dd-4ad6-b451-846b87c233de', '946f11f3-d8d9-449f-9160-0327c025ce48', 0, 'OTHER EXPENSE'),

-- Data test for bill item (Agent bill)
('d0b58570-5d6d-4a0f-b617-67a1f66be8fc', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25133', null, 'f5e0347b-de8e-4762-ac10-2936c056d6aa', '946f11f3-d8d9-449f-9160-0327c025ce48', 0, 'AGENT ITEM CHARGE 1'),
('882d2897-76d0-4389-9d4a-fddec19ab84a', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25134', null, 'f5e0347b-de8e-4762-ac10-2936c056d6aa', '946f11f3-d8d9-449f-9160-0327c025ce48', 0, 'AGENT ITEM CHARGE 2');

DROP TABLE IF EXISTS item_charge_title;
CREATE TABLE IF NOT EXISTS item_charge_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    item_charge_id uuid,
    item_charge_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (item_charge_id, lang)
);

DROP TABLE IF EXISTS shipping_method;
CREATE TABLE IF NOT EXISTS shipping_method(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_method_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_method_code varchar(36) unique,

    shipping_method_title varchar(120),
    order_level int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO shipping_method(shipping_method_id, shipping_method_code, shipping_method_title, order_level) VALUES
('3215ce7c-8f99-47dd-996a-2414f10a0eab', 'AIR', 'Air', 1),
('617cb08a-540a-46b1-82b6-03d9ec55e340', 'LAN', 'Land', 2),
('87739499-8185-4fc2-8607-7f9950b4e412', 'SEA', 'Sea', 3);

DROP TABLE IF EXISTS shipping_method_title;
CREATE TABLE IF NOT EXISTS shipping_method_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_method_id uuid,
    shipping_method_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (shipping_method_id, lang)
);


DROP TABLE IF EXISTS shipping_type;
CREATE TABLE IF NOT EXISTS shipping_type(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_type_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_type_code varchar(36) unique,

    shipping_type_title varchar(120),
    order_level int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO shipping_type(shipping_type_id, shipping_type_code, shipping_type_title, order_level) VALUES
('b004cae7-1316-42df-a6ed-61b6d011d581', 'IMP', 'Import', 1),
('d275cde7-87a7-4d08-be0f-96d980bcd270', 'EXP', 'Export', 2),
('5ab60211-8e53-4c30-801b-fd73177bf6e4', 'DOM', 'Domestic', 3);

DROP TABLE IF EXISTS shipping_type_title;
CREATE TABLE IF NOT EXISTS shipping_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    logistics_service_id uuid,
    shipping_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (logistics_service_id, lang)
);

DROP TABLE IF EXISTS shipping_service;
CREATE TABLE IF NOT EXISTS shipping_service(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_service_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_service_code varchar(36) unique,

    shipping_service_title varchar(120) not null,
    shipping_type_id uuid not null,
    origin_country_id uuid not null,
    origin_province_id uuid,
    origin_district_id uuid,
    origin_commune_id uuid,
    origin_village_id uuid,
    destination_country_id uuid not null,
    destination_province_id uuid,
    destination_district_id uuid,
    destination_commune_id uuid,
    destination_village_id uuid,

    reviewed_status int default 0,
    reviewed_by uuid,
    reviewed_at timestamp,

    authorized_status int default 0,
    authorized_by uuid,
    authorized_at timestamp,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipping_service_title;
CREATE TABLE IF NOT EXISTS shipping_service_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_service_id uuid,
    shipping_service_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (shipping_service_id, lang)
);


DROP TABLE IF EXISTS shipping_service_method;
CREATE TABLE IF NOT EXISTS shipping_service_method(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_service_method_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_service_method_code varchar(36) unique,

    shipping_service_id uuid not null,
    shipping_method_id uuid not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipping_service_item_charge;
CREATE TABLE IF NOT EXISTS shipping_service_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_service_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_service_item_charge_code varchar(36) unique,

    shipping_service_id uuid not null,
    item_charge_id uuid not null,
    chargeable_option_id uuid not null,
    currency_id uuid not null,
    quantity double precision not null,
    costing double precision not null,
    efficiency_cost double precision not null,
    min_selling_rate double precision not null,
    selling_rate double precision not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipping_service_item_charge_modify;
CREATE TABLE IF NOT EXISTS shipping_service_item_charge_modify(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_service_item_charge_modify_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_service_item_charge_modify_code varchar(36) unique,

    shipping_service_item_charge_id uuid not null,
    shipping_service_id uuid not null,
    item_charge_id uuid not null,
    chargeable_option_id uuid not null,
    currency_id uuid not null,
    quantity double precision not null,
    costing double precision not null,
    efficiency_cost double precision not null,
    min_selling_rate double precision not null,
    selling_rate double precision not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS master_quote;
CREATE TABLE IF NOT EXISTS master_quote(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    master_quote_id uuid primary key DEFAULT gen_random_uuid(),
    master_quote_code varchar(36) unique,

    company_id uuid,
    master_quote_number varchar(20) unique not null,
    customer_id uuid,
    last_quote_id uuid,

    awarded_status int default 0,
    awarded_by uuid,
    awarded_at timestamp,
    awarded_reference_file_manager_id uuid,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS quote;
CREATE TABLE IF NOT EXISTS quote(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    quote_id uuid primary key DEFAULT gen_random_uuid(),
    quote_code varchar(36) unique,

    master_quote_id uuid,
    quote_number varchar(20) unique not null,
    shipping_service_id uuid,
    currency_id uuid,
    salesman_team_id uuid,
    customer_id uuid,
    customer_name varchar(100),
    customer_address varchar(250),
    customer_position varchar(100),
    contact_name varchar(100),
    contact_phone varchar(100),
    contact_email varchar(100),
    origin_country_id uuid,
    origin_province_id uuid,
    origin_district_id uuid,
    origin_commune_id uuid,
    origin_village_id uuid,
    destination_country_id uuid,
    destination_province_id uuid,
    destination_district_id uuid,
    destination_commune_id uuid,
    destination_village_id uuid,
    payment_term_second bigint,
    total_amount double precision,
    total_amount_usd double precision,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision,
    grand_total_amount_usd double precision,
    quote_remark varchar(500),
    issued_at timestamp,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS quote_section;
CREATE TABLE IF NOT EXISTS quote_section(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    quote_section_id uuid primary key DEFAULT gen_random_uuid(),
    quote_section_code varchar(36) unique,

    quote_id uuid not null,
    section_title varchar(100),
    section_order int,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS quote_item_charge;
CREATE TABLE IF NOT EXISTS quote_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    quote_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    quote_item_charge_code varchar(36) unique,

    quote_section_id uuid not null,
    quote_id uuid not null,
    item_charge_id uuid not null,
    item_charge_title varchar(120) not null,
    item_charge_type_id uuid,
    chargeable_option_id uuid not null,
    currency_id uuid not null,
    exchange_rate double precision not null,
    amount double precision not null,
    amount_usd double precision not null,
    quantity double precision not null,
    total_amount double precision not null,
    total_amount_usd double precision not null,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision not null,
    grand_total_amount_usd double precision not null,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS quote_commodity;
CREATE TABLE IF NOT EXISTS quote_commodity(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    quote_commodity_id uuid primary key DEFAULT gen_random_uuid(),
    quote_commodity_code varchar(36) unique,

    quote_id uuid not null,
    commodity_id uuid not null,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS config_seq_formatter;
CREATE TABLE IF NOT EXISTS config_seq_formatter(
    config_seq_formatter_id uuid primary key DEFAULT gen_random_uuid(),
    config_seq_formatter_code varchar(36) unique,
    module_code varchar(36) unique,
    module_title varchar(50),
    prefix_code varchar(10) unique,
    operation_date date,
    year_formatter varchar(4) CHECK (year_formatter IN ('YYYY', 'YY') OR year_formatter IS NULL),
    month_formatter varchar(4) CHECK (month_formatter IN ('MM', 'MON') OR month_formatter IS NULL),
    day_formatter varchar(4) CHECK (day_formatter IN ('DD') OR day_formatter IS NULL),
    seq_digit int,
    reset_seq_type varchar(20) CHECK (reset_seq_type IN ('YEARLY', 'MONTHLY', 'DAILY') OR reset_seq_type IS NULL),
    max_seq int,
    order_level smallint,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO config_seq_formatter(module_code, module_title, prefix_code, operation_date, year_formatter, month_formatter, day_formatter, seq_digit, reset_seq_type, max_seq, order_level) VALUES
('QUOTE', 'Quote Number', 'SQ', CURRENT_DATE, 'YY', 'MM', null, 3, 'MONTHLY', 0, 1),
('JOB_IMP', 'Import Job Number', 'IMP', CURRENT_DATE, 'YYYY', 'MM', null, 3, 'MONTHLY', 0, 2),
('JOB_EXP', 'Export Job Number', 'EXP', CURRENT_DATE, 'YYYY', 'MM', null, 3, 'MONTHLY', 0, 3),
('JOB_DOM', 'Domestic Job Number', 'DOM', CURRENT_DATE, 'YYYY', 'MM', null, 3, 'MONTHLY', 0, 4),
('TAX_INVOICE', 'Tax Invoice Number', 'TI', CURRENT_DATE, 'YYYY', null, null, 5, 'YEARLY', 0, 5),
('COMMERCIAL_INVOICE', 'Commercial Invoice Number', 'CI', CURRENT_DATE, 'YYYY', null, null, 5, 'YEARLY', 0, 6),
('DISBURSEMENT_INVOICE', 'Disbursement Invoice Number', 'DIS', CURRENT_DATE, 'YYYY', null, null, 5, 'YEARLY', 0, 7),
('CASH_ADVANCE_VOUCHER', 'Cash Advance Voucher Number', 'CAV', CURRENT_DATE, 'YY', 'MM', null, 4, 'YEARLY', 0, 8);

DROP TABLE IF EXISTS shipment;
CREATE TABLE IF NOT EXISTS  shipment(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_code varchar(36) unique,
    
    shipment_tracking_number varchar(20) unique not null,
    job_number varchar(30),
    mbl_number varchar(20),
    hbl_number varchar(20) unique,
    bl_code varchar(20) unique,
    invoice_packing_number varchar(20),

    company_id uuid,
    sub_company_id uuid,
    branch_id uuid,
    operation_branch_id uuid,

    customer_id uuid,
    logistics_service_id uuid,
    shipping_service_id uuid,
    shipping_type_id uuid,
    shipping_term_id uuid,
    shipping_term_status_id uuid,
    incoterm_id uuid,

    shipper varchar(300),
    shipper_name varchar(100),
    shipper_phone_number varchar(100),
    shipper_email varchar(100),
    shipper_country_id uuid,
    shipper_province_id uuid,
    shipper_district_id uuid,
    shipper_commune_id uuid,
    shipper_village_id uuid,
    shipper_address varchar(250),

    consignee varchar(300),
    consignee_name varchar(100),
    consignee_phone_number varchar(100),
    consignee_email varchar(100),
    consignee_country_id uuid,
    consignee_province_id uuid,
    consignee_district_id uuid,
    consignee_commune_id uuid,
    consignee_village_id uuid,
    consignee_address varchar(250),

    origin_etd_at timestamp,
    destination_eta_at timestamp,
    notify_party varchar(250),

    place_of_receipt_country_id uuid,
    place_of_receipt_province_id uuid,
    place_of_receipt_district_id uuid,
    place_of_receipt_commune_id uuid,
    place_of_receipt_village_id uuid,

    loading_site_id uuid,
    discharge_site_id uuid,

    place_of_delivery_country_id uuid,
    place_of_delivery_province_id uuid,
    place_of_delivery_district_id uuid,
    place_of_delivery_commune_id uuid,
    place_of_delivery_village_id uuid,

    pre_carriage_by varchar(100),
    total_package_amount int,
    uom_id uuid,
    total_piece_amount int,
    total_weight double precision,
    total_cbm double precision,
    freight_currency_id uuid,
    company_payment_method_id uuid,

    issued_bill_status int,
    issued_bill_branch_id uuid,
    issued_bill_by uuid,
    issued_bill_at timestamp,

    shipment_closed_status int default 0,
    shipment_closed_by uuid,
    shipment_closed_at timestamp,

    master_quote_id uuid,
    quote_id uuid,
    quote_generate_status int,

    authorization_to varchar(100),
    authorization_status int,
    authorization_branch_id uuid,
    authorization_by uuid,
    authorization_at timestamp,
    authorization_file_manager_id uuid,

    last_shipment_check_point_id uuid,
    shipping_mark varchar(500),
    shipment_remark varchar(500),
    description text,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_route;
CREATE TABLE IF NOT EXISTS shipment_route(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_route_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_route_code varchar(36) unique,
    
    shipment_route_tracking_number varchar(20) unique not null,
    shipment_id uuid not null,
    mbl_number varchar(20),
    hbl_number varchar(20) unique,
    agent_id uuid,
    agent_name varchar(100),
    agent_contact_name varchar(100),
    agent_contact_phone varchar(100),
    agent_contact_email varchar(100),
    agent_contact_fax_number varchar(100),
    agent_contact_fmc_number varchar(100),
    origin_country_id uuid,
    origin_province_id uuid,
    origin_district_id uuid,
    origin_commune_id uuid,
    origin_village_id uuid,
    destination_country_id uuid,
    destination_province_id uuid,
    destination_district_id uuid,
    destination_commune_id uuid,
    destination_village_id uuid,
    carrier_name varchar(100),
    vessel_name varchar(100),
    voyage_number varchar(100),
    shipping_method_id uuid,
    etd_at timestamp,
    eta_at timestamp,
    order_level int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_container;
CREATE TABLE IF NOT EXISTS shipment_container(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_container_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_container_code varchar(36) unique,
    
    shipment_container_tracking_number varchar(20) unique not null,
    shipment_id uuid not null,
    container_number varchar(50) unique,
    container_size_id uuid,
    container_seal_number varchar(50) unique,
    total_package_amount int,
    uom_id uuid,
    total_piece_amount int,
    dimension_length double precision,
    dimension_width double precision,
    dimension_height double precision,
    dimension_volume double precision,
    volume_cbm double precision,
    volume_weight double precision,
    total_weight double precision,
    total_cbm double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_container_detail;
CREATE TABLE IF NOT EXISTS shipment_container_detail(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_container_detail_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_container_detail_code varchar(36) unique,
    
    shipment_container_detail_tracking_number varchar(20) unique not null,
    shipment_container_id uuid not null,
    commodity_id uuid,
    commodity_remark varchar(100),
    hs_code varchar(100),
    package_amount int,
    uom_id uuid,
    piece_amount int,
    dimension_length double precision,
    dimension_width double precision,
    dimension_height double precision,
    dimension_volume double precision,
    volume_cbm double precision,
    volume_weight double precision,
    weight_value double precision,
    cbm_value double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_check_point;
CREATE TABLE IF NOT EXISTS shipment_check_point(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_check_point_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_check_point_code varchar(36) unique,

    shipment_id uuid not null,
    check_point_id uuid not null,

    branch_id uuid not null,

    site_id uuid,
    country_id uuid,
    province_id uuid,
    district_id uuid,
    commune_id uuid,
    village_id uuid,

    destination_site_id uuid,
    destination_country_id uuid,
    destination_province_id uuid,
    destination_district_id uuid,
    destination_commune_id uuid,
    destination_village_id uuid,

    contact_person varchar(100),
    contact_phone varchar(100),
    check_point_by uuid,
    check_point_at timestamp,

    check_point_map_lat double precision,
    check_point_map_long double precision,

    remark_description varchar(250),
    internal_remark_description varchar(250),

    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_item_charge;
CREATE TABLE IF NOT EXISTS shipment_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_item_charge_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,
    shipment_invoice_id uuid,
    quotation_id uuid,
    shipment_id uuid not null,
    item_charge_id uuid,
    item_charge_title varchar(120),
    item_charge_type_id uuid,
    chargeable_option_id uuid,
    company_payment_method_id uuid,
    currency_id uuid,
    exchange_rate double precision,
    khr_exchange_rate double precision,
    amount double precision,
    amount_usd double precision,
    quantity double precision,
    total_amount double precision,
    total_amount_usd double precision,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision,
    grand_total_amount_usd double precision,
    grand_total_amount_khr double precision,
    statement_remark varchar(250),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_reimbursement_item_charge;
CREATE TABLE IF NOT EXISTS shipment_reimbursement_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_reimbursement_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_reimbursement_item_charge_code varchar(36) unique,

    shipment_item_charge_id uuid,
    item_charge_id uuid,
    item_charge_title varchar(120),
    item_charge_type_id uuid,
    chargeable_option_id uuid,
    currency_id uuid,
    amount double precision,
    amount_usd double precision,
    quantity double precision,
    total_amount double precision,
    total_amount_usd double precision,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision,
    grand_total_amount_usd double precision,
    grand_total_amount_khr double precision,
    statement_remark varchar(250),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS shipment_expense_item_charge;
CREATE TABLE IF NOT EXISTS shipment_expense_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_expense_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_expense_item_charge_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,
    shipment_id uuid not null,
    item_charge_id uuid,
    item_charge_title varchar(120),
    item_charge_type_id uuid,
    chargeable_option_id uuid,
    company_payment_method_id uuid,
    currency_id uuid,
    exchange_rate double precision,
    khr_exchange_rate double precision,
    amount double precision,
    amount_usd double precision,
    quantity double precision,
    total_amount double precision,
    total_amount_usd double precision,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision,
    grand_total_amount_usd double precision,
    grand_total_amount_khr double precision,
    statement_remark varchar(250),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS invoice_type;
CREATE TABLE IF NOT EXISTS invoice_type(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    invoice_type_id uuid primary key DEFAULT gen_random_uuid(),
    invoice_type_code varchar(36) unique,

    company_id uuid,
    invoice_type_title varchar(120),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO invoice_type(invoice_type_id, invoice_type_code, company_id, invoice_type_title) VALUES
('114be8d3-329f-4c55-a756-784639f8db68', 'TAX', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'TAX INVOICE'),
('adca874d-c46a-4497-bad1-2a825d0c3305', 'COM', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'COMMERCIAL INVOICE'),
('aa90e90b-5305-424f-9504-cd9fb7afb72f', 'REM', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'REIMBURSEMENT');

DROP TABLE IF EXISTS invoice_type_title;
CREATE TABLE IF NOT EXISTS invoice_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    invoice_type_id uuid,
    invoice_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (invoice_type_id, lang)
);
INSERT INTO invoice_type_title(invoice_type_id, invoice_type_title, lang) VALUES
('114be8d3-329f-4c55-a756-784639f8db68', 'TAX INVOICE', 'en'),
('114be8d3-329f-4c55-a756-784639f8db68', 'វិក្កយបត្រអាករ', 'kh'),
('adca874d-c46a-4497-bad1-2a825d0c3305', 'COMMERCIAL INVOICE', 'en'),
('adca874d-c46a-4497-bad1-2a825d0c3305', 'វិក្កយបត្រធម្មតា', 'kh'),
('aa90e90b-5305-424f-9504-cd9fb7afb72f', 'REIMBURSEMENT', 'en'),
('aa90e90b-5305-424f-9504-cd9fb7afb72f', 'សំណង', 'kh');

DROP TABLE IF EXISTS shipment_invoice;
CREATE TABLE IF NOT EXISTS shipment_invoice(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_invoice_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_invoice_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,

    customer_id uuid not null,
    invoice_type_id uuid not null,
    invoice_number varchar(20) not null,
    customer_vat_tin varchar(30),
    customer_name_native varchar(100),
    customer_name_en varchar(100),
    telephone varchar(100),
    phone_number varchar(100),
    email varchar(100),
    address_native varchar(250),
    address_en varchar(250),
    khr_exchange_rate double precision,

    due_date date,

    issued_branch_id uuid,
    issued_by uuid,
    issued_at timestamp,

    paid_status int,
    paid_branch_id uuid,
    paid_by uuid,
    paid_at timestamp,

    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);


DROP TABLE IF EXISTS received_payment;
CREATE TABLE IF NOT EXISTS received_payment(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    received_payment_id uuid primary key DEFAULT gen_random_uuid(),
    received_payment_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,

    receipt_transaction_number varchar(36) unique not null,
    customer_id uuid not null,
    company_payment_gateway_id uuid not null,
    transaction_ref_number varchar(20) not null,
    transaction_ref_remark varchar(50),
    received_currency_id uuid not null,
    exchange_rate double precision not null,
    received_actual_amount double precision not null,
    received_amount double precision not null,
    received_amount_usd double precision not null,
    
    received_branch_id uuid not null,
    received_by uuid not null,
    received_at timestamp not null,
    
    reviewed_status int,
    reviewed_branch_id uuid,
    reviewed_by uuid,
    reviewed_at timestamp,

    authorized_status int,
    authorized_branch_id uuid,
    authorized_by uuid,
    authorized_at timestamp,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS received_payment_item_charge;
CREATE TABLE IF NOT EXISTS received_payment_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    received_payment_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    received_payment_item_charge_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,

    received_payment_id uuid not null,
    received_currency_id uuid not null,
    received_amount double precision not null,
    received_amount_usd double precision not null,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS received_payment_reimbursement_item_charge;
CREATE TABLE IF NOT EXISTS received_payment_reimbursement_item_charge(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    received_payment_reimbursement_item_charge_id uuid primary key DEFAULT gen_random_uuid(),
    received_payment_reimbursement_item_charge_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,

    received_payment_id uuid not null,
    received_currency_id uuid not null,
    received_amount double precision not null,
    received_amount_usd double precision not null,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);


DROP TABLE IF EXISTS shipment_item_charge_received_payment;
CREATE TABLE IF NOT EXISTS shipment_item_charge_received_payment(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipment_item_charge_received_payment_id uuid primary key DEFAULT gen_random_uuid(),
    shipment_item_charge_received_payment_code varchar(36) unique,

    received_payment_id uuid not null,
    shipment_invoice_id uuid,
    shipment_item_charge_id uuid,
    currency_id uuid,
    exchange_rate double precision,
    amount double precision,
    amount_usd double precision,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS cash_advance_voucher;
CREATE TABLE IF NOT EXISTS cash_advance_voucher(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    cash_advance_voucher_id uuid primary key DEFAULT gen_random_uuid(),
    cash_advance_voucher_code varchar(36) unique,

    cav_number varchar(20) unique not null,
    shipment_id uuid not null,
    customer_id uuid not null,
    advance_title varchar(120) not null,
    currency_id uuid not null,
    exchange_rate double precision not null,
    amount double precision not null,
    amount_usd double precision not null,
    site_id uuid,
    company_user_department_id uuid,
    company_payment_gateway_id uuid,

    request_branch_id uuid,
    request_by uuid,
    request_at timestamp,

    customs_clearance_at timestamp,

    remark varchar(255),

    checked_status int default 0,
    checked_branch_id uuid,
    checked_by uuid,
    checked_at timestamp,

    reviewed_status int default 0,
    reviewed_branch_id uuid,
    reviewed_by uuid,
    reviewed_at timestamp,

    approved_status int default 0,
    approved_branch_id uuid,
    approved_by uuid,
    approved_at timestamp,

    received_status int default 0,
    received_branch_id uuid,
    received_by uuid,
    received_at timestamp,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS cash_advance_clearance;
CREATE TABLE IF NOT EXISTS cash_advance_clearance(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    cash_advance_clearance_id uuid primary key DEFAULT gen_random_uuid(),
    cash_advance_clearance_code varchar(36) unique,

    cash_advance_voucher_id uuid unique not null,
    company_payment_gateway_id uuid,
    shipment_route_id uuid,

    currency_id uuid,
    exchange_rate double precision not null,
    amount double precision,
    amount_usd double precision,

    clearance_at timestamp not null,

    checked_status int default 0,
    checked_branch_id uuid,
    checked_by uuid,
    checked_at timestamp,

    reviewed_status int default 0,
    reviewed_branch_id uuid,
    reviewed_by uuid,
    reviewed_at timestamp,

    approved_status int default 0,
    approved_branch_id uuid,
    approved_by uuid,
    approved_at timestamp,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS cash_advance_clearance_section;
CREATE TABLE IF NOT EXISTS cash_advance_clearance_section(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    cash_advance_clearance_section_id uuid primary key DEFAULT gen_random_uuid(),
    cash_advance_clearance_section_code varchar(36) unique,

    cash_advance_clearance_id uuid,
    section_title varchar(120),
    order_level int,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS cash_advance_clearance_item;
CREATE TABLE IF NOT EXISTS cash_advance_clearance_item(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    cash_advance_clearance_item_id uuid primary key DEFAULT gen_random_uuid(),
    cash_advance_clearance_item_code varchar(36) unique,

    cash_advance_clearance_id uuid not null,
    cash_advance_clearance_section_id uuid not null, 
    item_charge_id uuid,
    item_charge_title varchar(120),
    item_charge_type_id uuid,
    currency_id uuid,
    amount double precision,
    amount_usd double precision,
    quantity double precision,
    total_amount double precision,
    total_amount_usd double precision,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision,
    grand_total_amount_usd double precision,
    remark varchar(255),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS cash_advance_refund;
CREATE TABLE IF NOT EXISTS cash_advance_refund(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    cash_advance_refund_id uuid primary key DEFAULT gen_random_uuid(),
    cash_advance_refund_code varchar(36) unique,

    cash_advance_voucher_id uuid not null,
    cash_advance_clearance_id uuid not null,
    company_payment_gateway_id uuid not null,
    transaction_ref_number varchar(20) not null,
    transaction_ref_remark varchar(50),
    currency_id uuid,
    amount double precision,
    amount_usd double precision,
    remark varchar(255),
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS agent;
CREATE TABLE IF NOT EXISTS agent(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    agent_id uuid primary key DEFAULT gen_random_uuid(),
    agent_code varchar(36) unique,

    agent_name varchar(120),
    vat_tin varchar(50),
    country_id uuid,
    province_id uuid,
    district_id uuid,
    commune_id uuid,
    village_id uuid,
    address varchar(250),
    company_logo_file_id uuid,
    company_title varchar(250),
    company_subtitle varchar(250),
    description varchar(500),
    format_bill_digit int,
    last_sequence int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS agent_contact_info;
CREATE TABLE IF NOT EXISTS agent_contact_info(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    agent_contact_info_id uuid primary key DEFAULT gen_random_uuid(),
    agent_contact_info_code varchar(36) unique,

    agent_id uuid not null,
    shipping_service_id uuid not null,
    contact_name varchar(120),
    contact_phone varchar(100),
    contact_email varchar(100),
    contact_fax_number varchar(100),
    contact_fmc_number varchar(50),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS agent_bill;
CREATE TABLE IF NOT EXISTS agent_bill(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    agent_bill_id uuid primary key DEFAULT gen_random_uuid(),
    agent_bill_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,

    agent_id uuid not null,
    bill_number varchar(20) unique not null,
    bill_number_ref varchar(20) not null,
    agent_name varchar(100),
    phone_number varchar(100),
    email varchar(100),
    address varchar(250),

    issued_at timestamp,

    paid_status int,
    paid_branch_id uuid,
    paid_by uuid,
    paid_at timestamp,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS agent_bill_item;
CREATE TABLE IF NOT EXISTS agent_bill_item(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    agent_bill_item_id uuid primary key DEFAULT gen_random_uuid(),
    agent_bill_item_code varchar(36) unique,

    agent_bill_id uuid,
    shipment_id uuid not null,
    item_charge_id uuid,
    item_charge_title varchar(120),
    item_charge_type_id uuid,
    chargeable_option_id uuid,
    currency_id uuid,
    exchange_rate double precision,
    amount double precision,
    amount_usd double precision,
    quantity double precision,
    total_amount double precision,
    total_amount_usd double precision,
    vat_rate double precision,
    vat_amount double precision,
    vat_amount_usd double precision,
    grand_total_amount double precision,
    grand_total_amount_usd double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS paid_bill;
CREATE TABLE IF NOT EXISTS paid_bill(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    paid_bill_id uuid primary key DEFAULT gen_random_uuid(),
    paid_bill_code varchar(36) unique,

    company_id uuid,
    branch_id uuid,

    paid_transaction_number varchar(36) unique not null,
    agent_id uuid,
    company_payment_gateway_id uuid not null,
    transaction_ref_number varchar(20) not null,
    transaction_ref_remark varchar(50),
    paid_currency_id uuid not null,
    exchange_rate double precision not null,
    paid_actual_amount double precision not null,
    paid_amount double precision not null,
    paid_amount_usd double precision not null,
    
    paid_branch_id uuid not null,
    paid_by uuid not null,
    paid_at timestamp not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS agent_paid_bill_item;
CREATE TABLE IF NOT EXISTS agent_paid_bill_item(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    agent_paid_bill_item_id uuid primary key DEFAULT gen_random_uuid(),
    agent_paid_bill_item_code varchar(36) unique,

    paid_bill_id uuid not null,
    agent_bill_id uuid not null,
    agent_bill_item_id uuid not null,
    currency_id uuid,
    exchange_rate double precision,
    amount double precision,
    amount_usd double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);