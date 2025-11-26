DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_id uuid primary key DEFAULT gen_random_uuid(),
    company_code varchar(36) unique,

    company_domain_name varchar(120),
    secure_code varchar(10) unique,

    system_company_type_id uuid,
    system_business_type_id uuid,

    company_title varchar(120),
    company_subtitle varchar(250),
    logo_file_manager_id uuid,
    description text,


    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company (company_id, company_code, secure_code, system_company_type_id, system_business_type_id, company_title, company_domain_name) VALUES
    ('b45c8a43-b247-4c75-b352-c6b4337186be', 'FWF', '121314', '36e9f34d-03bc-4e69-85c1-2f5a6e62c226', '0e0858c1-e255-471b-a6c4-af0bfd39b9bf', 'FWF Full Well and Nisshin Logistics', 'fullwell.biz');

DROP TABLE IF EXISTS company_title;
CREATE TABLE IF NOT EXISTS company_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_id uuid,
    company_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_id, lang)
);

DROP TABLE IF EXISTS language;
CREATE TABLE IF NOT EXISTS language(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    language_id uuid primary key DEFAULT gen_random_uuid(),
    language_code varchar(5) unique,

    language_title varchar(100),
    flag_icon_url varchar(100),
    order_level smallint,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO language(language_id, language_code, language_title, flag_icon_url, order_level) VALUES
('119566d2-ffd9-45f9-a6e5-b3451dc3b446', 'en', 'English', 'https://img.icons8.com/emoji/48/united-states-emoji.png', 1),
('1e4b89f8-98ce-401c-9e77-33cfbeddad66', 'kh', 'ខ្មែរ', 'https://img.icons8.com/emoji/48/cambodia-emoji.png', 2),
('92134867-0418-494d-8b07-cfba86055bef', 'cn', '中文', 'https://img.icons8.com/emoji/48/china-emoji.png', 3);

DROP TABLE IF EXISTS country;
CREATE TABLE IF NOT EXISTS country(
    id serial4, reference_id varchar(36), reference_code varchar(36),
    country_id uuid primary key DEFAULT gen_random_uuid(),
    country_code varchar(36) unique,
    country_short_code varchar(36) unique,
    country_title varchar(120),
    country_title_native varchar(120),
    country_title_google varchar(120),
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS country_title;
CREATE TABLE IF NOT EXISTS country_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    country_id uuid,
    country_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (country_id, lang)
);

DROP TABLE IF EXISTS province;
CREATE TABLE IF NOT EXISTS province(
    id serial4, reference_id varchar(36), reference_code varchar(36),
    province_id uuid primary key DEFAULT gen_random_uuid(),
    province_code varchar(36) unique,
    province_short_code varchar(36) unique,
    country_id uuid,
    province_title varchar(120),
    province_title_native varchar(120),
    province_title_google varchar(120),
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS province_title;
CREATE TABLE IF NOT EXISTS province_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    province_id uuid,
    province_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (province_id, lang)
);

DROP TABLE IF EXISTS district;
CREATE TABLE IF NOT EXISTS district(
                                       id serial4, reference_id varchar(36), reference_code varchar(36),

    district_id uuid primary key DEFAULT gen_random_uuid(),
    district_code varchar(36) unique,
    district_short_code varchar(36) unique,

    province_id uuid,

    district_title varchar(120),
    district_title_native varchar(120),
    district_title_google varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS district_title;
CREATE TABLE IF NOT EXISTS district_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    district_id uuid,
    district_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (district_id, lang)
);

DROP TABLE IF EXISTS commune;
CREATE TABLE IF NOT EXISTS commune(
                                      id serial4, reference_id varchar(36), reference_code varchar(36),

    district_id uuid,

    commune_id uuid primary key DEFAULT gen_random_uuid(),
    commune_code varchar(36) unique,
    commune_short_code varchar(36) unique,

    commune_title varchar(120),
    commune_title_native varchar(120),
    commune_title_google varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS commune_title;
CREATE TABLE IF NOT EXISTS commune_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    commune_id uuid,
    commune_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (commune_id, lang)
);

DROP TABLE IF EXISTS village;
CREATE TABLE IF NOT EXISTS village(
                                      id serial4, reference_id varchar(36), reference_code varchar(36),

    commune_id uuid,

    village_id uuid primary key DEFAULT gen_random_uuid(),
    village_code varchar(36) unique,
    village_short_code varchar(36) unique,

    village_title varchar(120),
    village_title_native varchar(120),
    village_title_google varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS village_title;
CREATE TABLE IF NOT EXISTS village_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    village_id uuid,
    village_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (village_id, lang)
);

DROP TABLE IF EXISTS nationality;
CREATE TABLE IF NOT EXISTS nationality(
                                            id serial4, reference_id varchar(36), reference_code varchar(36),

    nationality_id uuid primary key DEFAULT gen_random_uuid(),
    nationality_code varchar(36) unique,

    country_id uuid unique,

    nationality_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS nationality_title;
CREATE TABLE IF NOT EXISTS nationality_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    nationality_id uuid,
    nationality_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (nationality_id, lang)
);

DROP TABLE IF EXISTS currency;
CREATE TABLE IF NOT EXISTS currency(
                                       id serial4, reference_id varchar(36), reference_code varchar(36),

    currency_id uuid primary key DEFAULT gen_random_uuid(),
    currency_code varchar(36) unique,
    currency_symbol varchar(36),

    currency_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO currency (currency_id, currency_code, currency_symbol, currency_title) VALUES
                                                                                        ('b1fc53ab-a2b7-41a9-afca-0c6d6760c111', 'USD', '$', 'US Dollar'),
                                                                                        ('db33514c-6d12-4c53-80f1-1799f0f07fa4', 'KHR', '៛', 'Khmer Reil');

DROP TABLE IF EXISTS currency_title;
CREATE TABLE IF NOT EXISTS currency_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    currency_id uuid,
    currency_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (currency_id, lang)
);

DROP TABLE IF EXISTS system_company_type;
CREATE TABLE IF NOT EXISTS system_company_type(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    system_company_type_id uuid primary key DEFAULT gen_random_uuid(),
    system_company_type_code varchar(36) unique,

    company_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_company_type (system_company_type_id, system_company_type_code, company_type_title) VALUES
    ('36e9f34d-03bc-4e69-85c1-2f5a6e62c226', null, 'Private Company');

DROP TABLE IF EXISTS system_business_type;
CREATE TABLE IF NOT EXISTS system_business_type(
                                                   id serial4, reference_id varchar(36), reference_code varchar(36),

    system_business_type_id uuid primary key DEFAULT gen_random_uuid(),
    system_business_type_code varchar(36) unique,

    business_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_business_type (system_business_type_id, system_business_type_code, business_type_title) VALUES
    ('0e0858c1-e255-471b-a6c4-af0bfd39b9bf', null, 'Logistics & Express');

DROP TABLE IF EXISTS system_branch_type;
CREATE TABLE IF NOT EXISTS system_branch_type(
                                                 id serial4, reference_id varchar(36), reference_code varchar(36),

    system_branch_type_id uuid primary key DEFAULT gen_random_uuid(),
    system_branch_type_code varchar(36) unique,

    branch_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_branch_type (system_branch_type_id, system_branch_type_code, branch_type_title) VALUES
                                                                                                        ('670d4fc7-5c1a-4517-8650-dfc44bb26e91', 'HQ', 'Headquarters'),
                                                                                                        ('06b99e50-de23-4113-9134-68f63a86fb96', 'SD', 'Subsidiary'),
                                                                                                        ('3345d067-0a8f-4288-ad5d-c92dd045e9c2', 'BN', 'Branch');

DROP TABLE IF EXISTS system_user_position;
CREATE TABLE IF NOT EXISTS system_user_position(
                                                   id serial4, reference_id varchar(36), reference_code varchar(36),

    system_user_position_id uuid primary key DEFAULT gen_random_uuid(),
    system_user_position_code varchar(36) unique,

    user_position_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_user_position (system_user_position_id, system_user_position_code, user_position_title) VALUES
                                                                                                                ('799f188c-6f33-4cc6-a2c6-533d5aea4389', 'CEO', 'Chief Executive Officer'),
                                                                                                                ('5466cee1-1bc1-421c-95a5-2c8c4fafc80e', 'EXD', 'Executive Director'),
                                                                                                                ('70dbaa81-5eec-4791-ab3c-b207ca131e1c', 'BDD', 'Overseas Business Development Director'),
                                                                                                                ('7a57e106-e007-417e-b88f-b44107d8ed4f', 'ACM', 'Accountant Manager'),
                                                                                                                ('72ac39c2-9131-44e2-b94b-ff70f357fa7c', 'SEA', 'Senior Accountant'),
                                                                                                                ('0ec62e43-0070-4c51-a0cd-1e4c9c448d14', 'ASC', 'Assistant & Cashier'),
                                                                                                                ('4648342e-68e8-413e-89a0-cf8946cf24eb', 'JAC', 'Junior Accountant'),
                                                                                                                ('56e7de4c-fff1-44e6-ba70-fa6ffcf02cc8', 'SPM', 'Sale & Pricing Manager'),
                                                                                                                ('8df3f60d-e02c-4cfd-9d26-b5a6cd4c09fc', 'COM', 'Commercial Manager'),
                                                                                                                ('616257bc-8f60-456f-9e88-dc4ce5732198', 'SSO', 'Sale Support Officer'),
                                                                                                                ('ba387c59-2654-46e8-b552-d8daa94912ac', 'SLS', 'Sale Assistant'),
                                                                                                                ('79f0b0d5-16a4-4547-8136-6108d48e9dc3', 'OPM', 'Operation Manager'),
                                                                                                                ('9a310909-fbeb-4faf-ab30-8934ef3f35e0', 'IMM', 'Import Manager'),
                                                                                                                ('666d52c1-690b-40b5-8b3c-8dd354471a47', 'SIO', 'Senior Import Operation'),
                                                                                                                ('87fbb565-b104-45bf-a14b-23f667c3b96d', 'IMP', 'Import Operation'),
                                                                                                                ('ad723c78-1c34-414c-94e3-bed874b92348', 'SNO', 'Senior Operation'),
                                                                                                                ('3700262b-87d4-49d8-b11a-c053688a3916', 'EXM', 'Export Manager'),
                                                                                                                ('cf91d0b7-1af8-4865-85fa-3a1317a8502b', 'EXO', 'Export Operation'),
                                                                                                                ('8d29d51d-278d-44c3-93fc-9e89a8e16ade', 'SEO', 'Senior Export Operation'),
                                                                                                                ('7cfd1f5c-bacf-415f-92fa-c24320c1dd42', 'LSP', 'Logistics Suppervisor'),
                                                                                                                ('3323fc86-9716-4e87-a9f8-84db051fe3a0', 'CLO', 'Clearance Operation'),
                                                                                                                ('772bf9ff-d421-4be5-ad36-c339a9707a39', 'CLS', 'Clearance Supervisor'),
                                                                                                                ('d7e00412-66c6-4399-9467-3e7496813f90', 'ITO', 'IT Officer'),
                                                                                                                ('5c2e1d61-9c79-4f83-99fc-81ab8bd70b3c', 'OTO', 'Outside Team Officer'),
                                                                                                                ('2e65dcc1-2f41-4a85-94f5-725542b324f9', 'CLN', 'Cleaner'),
                                                                                                                ('f47caf54-cc5c-49ad-9e4b-d24d29e890b0', 'DRV', 'Driver'),
                                                                                                                ('49cdb4d9-df04-4654-8e6a-b9feda32dfe2', 'CWM', 'Cold Warehouse Manager');


DROP TABLE IF EXISTS system_user_department;
CREATE TABLE IF NOT EXISTS system_user_department(
                                                     id serial4, reference_id varchar(36), reference_code varchar(36),

    system_user_department_id uuid primary key DEFAULT gen_random_uuid(),
    system_user_department_code varchar(36) unique,

    user_department_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_user_department (system_user_department_id, system_user_department_code, user_department_title) VALUES
                                                                                                                        
                                                                                                                        ('ee881143-49a5-4ef4-9d91-0cf68e3a43fc', 'EX', 'Executive'),
                                                                                                                        ('08dd9c9a-4b3a-4dca-828d-33e903cb46e7', 'FA', 'Finance & Accounting'),
                                                                                                                        ('04625f8a-2f6b-40d2-b613-9151ba40f777', 'SL', 'Sale'),
                                                                                                                        ('ae01a1d9-a756-4940-af5b-e8cdc818816d', 'IM', 'Import'),
                                                                                                                        ('bf76e633-5676-4b12-b5b8-05d1f9985e44', 'EP', 'Export'),
                                                                                                                        ('3e730a6d-37be-49f9-b546-ed44fdc5b9e3', 'CC', 'Customs Clearance'),
                                                                                                                        ('87c62e56-cd69-49dc-b6e6-f77495ec84f1', 'IT', 'Information Technology'),
                                                                                                                        ('1519264e-e340-410a-96a1-ba9ff21e9b18', 'OT', 'Outside Team'),
                                                                                                                        ('6c77f67d-b0d9-454c-b829-07b05b2a4afd', 'HR', 'HR & Admin'),
                                                                                                                        ('a4c9f9f6-6031-4055-af39-d2f91f5fd9b4', 'WH', 'Warehouse');


DROP TABLE IF EXISTS system_customer_platform;
CREATE TABLE IF NOT EXISTS system_customer_platform(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    system_customer_platform_id uuid primary key DEFAULT gen_random_uuid(),
    system_customer_platform_code varchar(36) unique,

    customer_platform_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_customer_platform (system_customer_platform_id, system_customer_platform_code, customer_platform_title) VALUES
                                                                                                                                ('ba296073-fb73-4928-a184-7040b025791c', 'DCSM', 'Direct Customer'),
                                                                                                                                ('972c1e3d-9ea9-4daf-ae29-0f64146754aa', 'ICSM', 'In-Direct Customer');

DROP TABLE IF EXISTS system_customer_type;
CREATE TABLE IF NOT EXISTS system_customer_type(
                                                   id serial4, reference_id varchar(36), reference_code varchar(36),

    system_customer_type_id uuid primary key DEFAULT gen_random_uuid(),
    system_customer_type_code varchar(36) unique,

    customer_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_customer_type (system_customer_type_id, system_customer_type_code, customer_type_title) VALUES
                                                                                                                ('d3c785f3-d5e2-410b-a954-ddb343c6fb85', 'WLK', 'Walk-In Customer'),
                                                                                                                ('6a7702a2-9a40-4740-baaa-65a3e6ec6c87', 'GEN', 'General Customer'),
                                                                                                                ('28a1ebe8-5b15-43d0-8403-ba648cf155b8', 'OCE', 'OCEAN'),
                                                                                                                ('f14cbeaa-f05e-4d24-a65b-5012f1f9b196', 'AIR', 'AIR'),
                                                                                                                ('bf16cfb8-31bb-4efc-bf6a-3c79dcb90512', 'TRU', 'TRUCK');


DROP TABLE IF EXISTS system_module;
CREATE TABLE IF NOT EXISTS system_module(
                                            id serial4, reference_id varchar(36), reference_code varchar(36),

    system_module_id uuid primary key DEFAULT gen_random_uuid(),
    system_module_code varchar(36) unique,

    module_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_module (system_module_id, system_module_code, module_title) VALUES
('65622047-b7d4-4b1d-a466-e41cccce9c85', 'APPMOD', 'Application'),
('9d2fcd95-6a14-43cf-b0e4-e2a702c74e9c', 'ADMMOD', 'Administrator'),
('6bdb835b-3f32-45ba-ac7f-31b4a202ca13', 'MCLMOD', 'Miscellaneous'),
('c6116eb5-31b3-4ec6-a510-59de359d565f', 'SMKMOD', 'Sales & Marketing'),

('097f58b2-5310-4217-b6ff-3ec95e7c6cca', 'CSAMOD', 'Company System Authority'),
('e198e974-a81a-4fa6-be26-346690e23153', 'CUDMOD', 'Company User Department'),
('8cffc08a-acd6-4c78-b9f9-b48a0e212897', 'CUPMOD', 'Company User Position'),
('e86c2454-bee4-40c8-94e2-1ce626561c23', 'CSTMOD', 'Company Site Type'),

('02c97319-caa7-4700-9ccb-e83cde7abf46', 'CSMMOD', 'Customer'),
('ab74cafa-298e-40c2-b5e6-ad06493c151f', 'CADMOD', 'Customer Address'),
('034a6fc6-4496-48e3-85fa-06d62883fb14', 'CDCMOD', 'Customer Document'),
('88fa36e4-aff1-4246-8653-8db737d35ff1', 'QTTMOD', 'Quotation'),
('169ff585-7a91-4bb0-9953-2e12cc8fb8ea', 'AGNMOD', 'Agent'),
('0dc481b7-705b-4d35-b87b-d3d6e07ebc60', 'BRNMOD', 'Company Branch'),
('a526284e-93e0-41da-8a1e-16b75d832bdf', 'SITMOD', 'Site'),
('b3e49a1a-9b95-438f-80ad-f87a93c49147', 'UAUMOD', 'User Auth'),
('b890b3c3-c050-488c-90ee-54ab968c032c', 'ASRMOD', 'User Auth System Role'),
('3a303e69-5462-40b4-81c8-d0104dfb4623', 'SSRMOD', 'System Role'),
('34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', 'MBRMOD', 'Mobile Role'),

('c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', 'CMTMOD', 'Commodity Type'),
('1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', 'CMDMOD', 'Commodity'),
('26d852e1-f655-4b3a-ac9d-8aa556e26ba2', 'CHPMOD', 'Check Point'),
('0404b98f-f3c1-47e3-ac90-59f71b820254', 'SLGMOD', 'Sales Group'),
('4e43a40b-0e3d-464b-958c-274970aa4e32', 'SLTMOD', 'Sales Team'),
('ebedff4c-6f70-4cea-9ece-9eb300266d00', 'STMMOD', 'Sales Team Member'),
('2678cd4c-4569-44fc-ab24-410a2bfecee6', 'SLMMOD', 'Salesman'),
('12b55e47-495d-4795-88cd-9002a94c990f', 'ISTMOD', 'Invoice Statement Type'),

('7535b8b4-b445-41aa-a159-0876b56e8ebf', 'SHPMOD', 'Shipment'),
('f8c2210a-c44b-43ee-986f-62e6f8b7c068', 'SCPMOD', 'Shipment Check Point'),
('533539bd-2f8b-4969-ac22-8848bb0d7024', 'SISMOD', 'Shipment Invoice Statement'),
('e462f117-077c-4aef-8f7e-658d78707724', 'CSEMOD', 'Customer Sector'),

('25de2a5c-3163-42e7-8fff-25b19961b9ed', 'CTRMOD', 'Country'),
('36959a5a-f6a5-4b86-80ca-7feee689538d', 'PRVMOD', 'Province'),
('3dad1cc8-78a5-4a5e-b644-fd539742a4ca', 'DSTMOD', 'District'),
('22d92ec8-0529-4207-87a6-659a4261918a', 'COMMOD', 'Commune'),
('a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', 'VLGMOD', 'Village');


DROP TABLE IF EXISTS system_authority;
CREATE TABLE IF NOT EXISTS system_authority(
                                               id serial4, reference_id varchar(36), reference_code varchar(36),

    system_authority_id uuid primary key DEFAULT gen_random_uuid(),
    system_authority_code varchar(36) unique,

    system_module_id uuid,
    system_authority_status varchar(36),

    authority_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_authority (system_authority_id, system_authority_code, system_module_id, system_authority_status, authority_title) VALUES
('21efc347-316b-443b-b430-1e0216f0db44', 'APPLAYOUT', '65622047-b7d4-4b1d-a466-e41cccce9c85', null,'Application'),
('8a47d280-d29d-4b65-9e35-8ff438a12b6f', 'ADMLAYOUT', '9d2fcd95-6a14-43cf-b0e4-e2a702c74e9c', null, 'Administrator'),
('948cee17-2d9f-4e39-8fbf-afa01344b2c5', 'MCLLAYOUT', '6bdb835b-3f32-45ba-ac7f-31b4a202ca13', null, 'Miscellaneous'),
('a72880d3-fc59-4c54-96b3-ca253392a100', 'SMKLAYOUT', 'c6116eb5-31b3-4ec6-a510-59de359d565f', null, 'Sales & Marketing'),

('40e143f6-03f5-4ab8-bbf3-efe120c2fdbe', 'LSTCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', 'OPD', 'List Company System Authority'),
('1460e74e-c26b-4656-bc4b-7f55f5e43ad6', 'EXPCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Export List Company System Authority'),
('3f098151-a37a-4772-b87f-a2a5b12b8f4e', 'IMPCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Import Bulk Company System Authority'),
('cea1fe5f-3f06-42da-b48d-631c33132b79', 'VIWCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'View Company System Authority'),
('d19df77f-35a8-4128-9c31-b3e9d92788e3', 'DTLCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Detail Company System Authority'),
('a6f966a8-425a-458a-b145-29bfedc968cf', 'CRTCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Create Company System Authority'),
('4da961ec-2558-4e81-8459-aa4cddb4c337', 'UPDCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Update Company System Authority'),
('74269900-dd1c-4ddf-a80c-8822e0dee2b2', 'NEWCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'New Company System Authority'),
('05a353ba-343e-498a-9d4e-d55a2fecc3f4', 'CPYCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Copy Company System Authority'),
('359f3f5b-18fe-44a4-8d2b-41e7ad07b6b0', 'UNLCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Unlock Company System Authority'),
('276da955-97cc-425a-82de-714769faf27d', 'SAVCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Save Company System Authority'),
('106acd8f-9c8a-4545-98c3-d1e8357ae2bf', 'PRNCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Print Company System Authority'),
('9c612e25-e037-416f-805e-0d06ab1b18e8', 'DELCSA', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', null, 'Delete Company System Authority'),

('98a75e06-5eb4-4400-a125-ef41668db3f4', 'LSTCUD', 'e198e974-a81a-4fa6-be26-346690e23153', 'OPD', 'List Company User Department'),
('f1090c7e-05b6-48bc-80cf-5415ac3066c1', 'EXPCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Export List Company User Department'),
('77b5109f-9afd-4ba6-9af2-3cf005a4de26', 'IMPCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Import Bulk Company User Department'),
('f6539f19-8b18-445a-abdd-d9a3d9c7758d', 'VIWCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'View Company User Department'),
('fcf85d79-d84e-4de5-869c-e11326a98cc6', 'DTLCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Detail Company User Department'),
('849caba8-7e0f-48d8-9a14-bff10fd59322', 'CRTCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Create Company User Department'),
('0615d809-c58e-42a1-b1b4-9d592c6dd1da', 'UPDCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Update Company User Department'),
('2e817574-b61d-4d88-a42e-26ffbcaa6800', 'NEWCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'New Company User Department'),
('f4772eb3-2c9c-406c-8422-64251a52eccd', 'CPYCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Copy Company User Department'),
('1b57f713-bba3-4d00-8c65-c1b8332945a2', 'UNLCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Unlock Company User Department'),
('f31267ca-de9c-4d3e-9b54-d46817fb9b7a', 'SAVCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Save Company User Department'),
('3875281b-02ed-4241-949c-2686bcdcbe91', 'PRNCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Print Company User Department'),
('27214bf2-df5a-4379-897a-08a22646e888', 'DELCUD', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Delete Company User Department'),

('98a0375f-86af-40c2-8245-dd805fc7a2df', 'LSTCUP', 'e198e974-a81a-4fa6-be26-346690e23153', 'OPD', 'List Company User Position'),
('07a6e28b-fb65-4b4f-a582-3c3c8ed5bb0b', 'EXPCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Export List Company User Position'),
('e477a55a-4b36-477f-a3db-356b977fa82f', 'IMPCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Import Bulk Company User Position'),
('224df0ed-8d83-43a5-842e-25d44804c085', 'VIWCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'View Company User Position'),
('669fa1f4-73c9-469a-a644-661c33315de6', 'DTLCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Detail Company User Position'),
('55bdf8a7-4a33-460e-bf74-0dc6b24fde7c', 'CRTCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Create Company User Position'),
('c3bf591c-69a2-433d-9ab3-3d1c419bd90f', 'UPDCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Update Company User Position'),
('d37e8b9d-ddbb-4f8d-95af-d409f9982401', 'NEWCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'New Company User Position'),
('78c1b232-5f48-4301-acc0-00be628d16c8', 'CPYCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Copy Company User Position'),
('cbb61b22-091a-43a3-9bec-6f9eee60995a', 'UNLCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Unlock Company User Position'),
('4f723e0c-a32c-490f-a079-5317a82667e2', 'SAVCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Save Company User Position'),
('e0efc777-ad55-4fb3-be85-b317a88597db', 'PRNCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Print Company User Position'),
('2f28a2de-fa92-4a1d-ab8b-ab45c680b71d', 'DELCUP', 'e198e974-a81a-4fa6-be26-346690e23153', null, 'Delete Company User Position'),

('adfada80-a2be-46d1-8ab1-10df0e89df44', 'LSTCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', 'OPD', 'List Company Site Type'),
('bec8c6fa-e547-4702-8254-d7c11c3e6b5f', 'EXPCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Export List Company Site Type'),
('ab5aeeb8-8fcd-4fe5-a733-feeb5eb89dc2', 'IMPCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Import Bulk Company Site Type'),
('509f454a-e2bb-4ca6-aed0-f9ef8a8ded54', 'VIWCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'View Company Site Type'),
('0ab96b3a-169d-4c5c-9b64-ac00ed9bd771', 'DTLCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Detail Company Site Type'),
('1e3e4a52-40d7-42ab-8ec3-d5a1242153bb', 'CRTCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Create Company Site Type'),
('1aeec473-c24e-4911-91ca-9e8d236f8172', 'UPDCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Update Company Site Type'),
('6efbf548-66e7-4622-b707-2f9892586cda', 'NEWCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'New Company Site Type'),
('6198c16c-9f4b-4570-ba2c-7c06d88e149d', 'CPYCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Copy Company Site Type'),
('3a139c91-8f5b-4c71-8da1-be4cc00c2357', 'UNLCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Unlock Company Site Type'),
('4d28540e-02bc-4b8c-96e7-37a5ec08764e', 'SAVCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Save Company Site Type'),
('97eeeabf-e5fe-40ed-acd8-1a639a4e576d', 'PRNCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Print Company Site Type'),
('1b8645a7-bc42-46b3-b7b0-4d8e553f9f34', 'DELCST', 'e86c2454-bee4-40c8-94e2-1ce626561c23', null, 'Delete Company Site Type'),

('3ded270c-9077-4c48-9c99-bb8b55104e2e', 'LSTCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', 'OPD', 'List Customer'),
('2ddc1f8b-66fb-4fd5-96e4-e49bbbfb0938', 'EXPCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Export List Customer'),
('c2fa5c84-3246-405d-93d9-f6af6afc2ae5', 'IMPCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Import Bulk Customer'),
('4fe2dbf2-7ada-4155-9ed6-62e2440c2b30', 'VIWCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'View Customer'),
('c892d1de-8fa4-47c1-b05d-b5251af98fc0', 'DTLCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Detail Customer'),
('c4533ebf-0c31-43a0-851e-c5fbe9c96cf9', 'CRTCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Create Customer'),
('22990386-ecc7-4770-b0fd-ffc9be516961', 'UPDCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Update Customer'),
('3fa68520-407c-434c-bdfe-641f0f656237', 'NEWCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'New Customer'),
('562287e6-2edc-481b-a4c9-fe8641645a05', 'CPYCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Copy Customer'),
('854b4367-e116-4b4c-bb68-ffee70b9473c', 'UNLCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Unlock Customer'),
('17a2b176-3e96-454f-baa6-0858f12d5b6e', 'SAVCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Save Customer'),
('0c04ccaa-60e1-40ae-9a82-2e7bacc8571b', 'PRNCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Print Customer'),
('5a6c8d99-8f45-4774-9f61-214aa7e7b632', 'DELCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Delete Customer'),
('37ab8b66-d8e7-4fed-a57d-6905b5332505', 'ACSCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Assign Cross Salesman Team'),
('1e7c8145-abf4-4432-bc0c-725fd43772d7', 'APCCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Assign Parent Customer'),
('ec83c640-ec93-4b84-a659-016daaa7d504', 'VICCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'View Cross Customer'),
('c2a8a886-6db9-4454-a67e-7e63a0f2ca5a', 'UPCCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Update Cross Customer'),
('0a6a4756-0789-492f-8dd1-1a98438f6958', 'VCTCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'View Customer Under Team'),
('f1b1a6d2-17f6-42fc-bf6e-6b7dce29ccec', 'UCTCSM', '02c97319-caa7-4700-9ccb-e83cde7abf46', null, 'Update Customer Under Team'),

('c6f993f3-5e10-459d-a259-bae440c5cff3', 'LSTCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', 'OPD', 'List Customer Address'),
('53bf10b1-ff59-4e18-9d56-5387088f874d', 'EXPCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Export List Customer Address'),
('43bb63f6-b5ea-4193-82fb-2171102aa797', 'IMPCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Import Bulk Customer Address'),
('4667ca1e-1fd3-46bd-a6f1-7451899b2aa9', 'VIWCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'View Customer Address'),
('2591c566-efd4-45ef-af43-42c40d43d302', 'DTLCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Detail Customer Address'),
('db072901-cde1-4874-b7f2-acffae740fc9', 'CRTCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Create Customer Address'),
('f563f827-0f06-4a28-bbe1-b78dfd5d4bb0', 'UPDCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Update Customer Address'),
('0dd209bf-0c64-4f85-a5da-2f4f620daebe', 'NEWCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'New Customer Address'),
('1716322f-22dc-4fa6-b38b-28f6b0120153', 'CPYCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Copy Customer Address'),
('a6a40226-bf6f-45ba-a7e2-5c1915313d9c', 'UNLCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Unlock Customer Address'),
('65cc90f4-784e-4fcf-9611-e0e02a7d05bd', 'SAVCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Save Customer Address'),
('e44a2865-c62a-46ab-8d3c-cb3e061aaea8', 'PRNCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Print Customer Address'),
('cb2d79c5-1fab-4a8a-91da-a7501d6f091f', 'DELCAD', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', null, 'Delete Customer Address'),

('05588472-423f-493f-814b-5e0d51ea2ccd', 'LSTCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', 'OPD', 'List Customer Document'),
('66d32ed2-ade8-4162-af7a-a0fbe268f5b0', 'EXPCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Export List Customer Document'),
('0638cda3-8da2-4a5c-897a-8771a3a75180', 'IMPCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Import Bulk Customer Document'),
('72a9e353-9694-485d-a2ac-8fee7f3e7e0b', 'VIWCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'View Customer Document'),
('8be2573a-8b98-4964-aa12-e8341b99a19c', 'DTLCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Detail Customer Document'),
('8a72ac17-7e1c-4dd1-a5c7-372dc24f7253', 'CRTCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Create Customer Document'),
('1619a3f6-5fc2-4510-b600-3a3469e277e3', 'UPDCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Update Customer Document'),
('581c652b-44cc-4e39-ae63-d4f30ff432b4', 'NEWCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'New Customer Document'),
('5cc0a7f2-de94-44b0-a532-37e283694e1a', 'CPYCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Copy Customer Document'),
('03651912-b241-4dde-906b-ed1adf5f84fa', 'UNLCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Unlock Customer Document'),
('620e83c9-8426-44f8-95f7-f3b736c5d346', 'SAVCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Save Customer Document'),
('cf5cc17d-658a-4488-8880-a3944bb996f7', 'PRNCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Print Customer Document'),
('44a32e0d-2635-4a3b-8f3f-f40e224bd043', 'DELCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Delete Customer Document'),
('6f9be232-5e84-475b-8c1c-e451d0bd9852', 'DOWCDC', '034a6fc6-4496-48e3-85fa-06d62883fb14', null, 'Download Customer Document'),

('3a616e6d-9759-4cd7-bbb4-2fc9dfe1abd9', 'LSTQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', 'OPD', 'List Quotation'),
('1ea315b7-1e33-4747-a083-1231dfe59153', 'EXPQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Export List Quotation'),
('5d501d40-2098-4a7f-94a8-d23a0838f6bc', 'IMPQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Import Bulk Quotation'),
('f8b756a1-b7bf-4022-8441-79bfa9640216', 'VIWQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'View Quotation'),
('984f21cf-dff1-4f0f-a1ac-245b0886c1c3', 'DTLQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Detail Quotation'),
('19ce3092-9aef-4dfb-8ea4-c9f4971d3db3', 'CRTQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Create Quotation'),
('d31de19a-43f2-434f-be3e-0f69a7e7914b', 'UPDQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Update Quotation'),
('5952e1da-6a45-4ee5-9306-562a9d0d9bf0', 'NEWQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'New Quotation'),
('01534415-c787-464c-8b90-4f2aa18ac82e', 'CPYQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Copy Quotation'),
('d9298f4d-fed1-4a25-98f4-7ea14da33cd6', 'UNLQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Unlock Quotation'),
('48b38651-353c-4574-8532-7abb462703ac', 'SAVQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Save Quotation'),
('5cc092a6-5c53-4917-bbbc-432dd6635c40', 'PRNQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Print Quotation'),
('d6822b43-8687-4c3a-a7ef-9139255bed68', 'DELQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Delete Quotation'),
('1e5541be-955d-40e9-b0a2-a10f6c1e0e65', 'VICQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'View Cross Team'),
('e19fe23b-0ea7-45cc-8432-a26904399bce', 'UPCQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Update Cross Team'),
('0f92307a-b3c0-4a50-af1d-c5814e83e1e7', 'VIUQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'View Quotation Under Team'),
('e8ce204c-38dd-41af-95b7-6a617f200b9d', 'UPUQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Update Quotation Under Team'),
('f198e4a0-f300-42ff-978d-8d2759858aab', 'DECQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Delete Quotation Cross Team'),
('6eddd5f8-e327-4af6-961d-3c16e67dc7e0', 'DEUQTT', '88fa36e4-aff1-4246-8653-8db737d35ff1', null, 'Delete Quotation Under Team'),

('60f7d7d3-0b07-4b67-9d04-f4fdd4fa7732', 'LSTAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', 'OPD', 'List Agent'),
('71b035ac-ecbe-41fb-bdd8-e8d84fe83d60', 'EXPAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Export List Agent'),
('542a29eb-d1e4-4a9e-ad8e-9246cdbfa837', 'IMPAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Import Bulk Agent'),
('3cc33080-9344-4753-a87b-176834f2f170', 'VIWAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'View Agent'),
('68fa7f1d-5639-4938-a436-87faba5378db', 'DTLAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Detail Agent'),
('1c19ed9d-eb12-450a-babd-c705b2840c96', 'CRTAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Create Agent'),
('79f00d6f-eeb8-460c-9e06-8896918b31f0', 'UPDAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Update Agent'),
('b8756f32-9e71-4b6d-9515-06f21372836c', 'NEWAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'New Agent'),
('81a405ff-9bc6-479f-a446-3bdf7309ee13', 'CPYAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Copy Agent'),
('6cd46346-e72e-49f3-a5f4-cbe2432896a6', 'UNLAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Unlock Agent'),
('c699d89d-e02e-45b7-812c-4926833fb0ba', 'SAVAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Save Agent'),
('80a52aa6-837c-449b-9587-d9e91cc78a10', 'PRNAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Print Agent'),
('d7265f32-5743-465e-9cf6-a55199b32d2f', 'DELAGN', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', null, 'Delete Agent'),

('1db88e67-9896-488f-89b9-ab386e365e04', 'LSTBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', 'OPD', 'List Branch'),
('16351b18-5a7b-4924-8ad6-3349a900dda2', 'EXPBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Export List Branch'),
('7608ffa5-7cfc-4025-ab3e-53aaa94fe018', 'IMPBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Import Bulk Branch'),
('a5c45198-613b-47e4-a8c3-4b1599766c17', 'VIWBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'View Branch'),
('eab4a7ee-897a-47ee-9d1d-227885fde3ff', 'DTLBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Detail Branch'),
('d3d6f969-46f9-472a-963d-dda009d24c4d', 'CRTBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Create Branch'),
('0abd07d3-4ff9-4295-8323-3b493e58e20a', 'UPDBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Update Branch'),
('383545bc-5023-437a-b2a0-3d4653bf71fb', 'NEWBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'New Branch'),
('09e19441-1eb7-46f6-99cc-4ca9e5f574c9', 'CPYBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Copy Branch'),
('8e2c8567-bb3b-417c-b0af-f436214f20d1', 'UNLBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Unlock Branch'),
('b165b9f4-422c-4d71-9ad7-749d251adbec', 'SAVBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Save Branch'),
('c5d5f897-37c3-4070-8310-241c410240c6', 'PRNBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Print Branch'),
('2ca7e4c9-6912-47f7-9ed2-c7d36daf0ff3', 'DELBRN', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', null, 'Delete Branch'),

('3ab13d23-f1eb-4f11-9c89-935d15808159', 'LSTSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', 'OPD', 'List Site'),
('202c6a79-6dac-4459-b8f1-eaf4906a7b0c', 'EXPSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Export List Site'),
('1fe38e98-53dd-4687-84c9-c1e5d1b52910', 'IMPSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Import Bulk Site'),
('03349737-d910-49f2-afb4-1743e4d012c8', 'VIWSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'View Site'),
('fb3267ec-020f-4dc6-9fdb-421a50fa56d8', 'DTLSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Detail Site'),
('cb1fa58c-e090-48e4-9a67-2e79113961fa', 'CRTSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Create Site'),
('ea23e715-8a2d-46a4-a1b8-efa1c65d74ab', 'UPDSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Update Site'),
('6e8498f9-7d7a-43bc-b0e3-fa89bbd84193', 'NEWSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'New Site'),
('37abbc66-1f84-4df6-b7ca-198ac2992fa1', 'CPYSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Copy Site'),
('cb7e3a70-3f24-4286-b605-80bed262973b', 'UNLSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Unlock Site'),
('c038e6ac-7a25-45da-952a-a96c40d6a8ca', 'SAVSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Save Site'),
('2544c2bc-5daa-459e-b872-349774c6cd76', 'PRNSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Print Site'),
('18c55064-2631-4a29-a5c0-cf9cf83a3723', 'DELSIT', 'a526284e-93e0-41da-8a1e-16b75d832bdf', null, 'Delete Site'),

('e308f7dd-b1d4-4824-9f84-6f6d967f37ad', 'LSTUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', 'OPD', 'List User Auth'),
('29b81f04-248a-49d3-9174-30bc1578c963', 'EXPUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Export List User Auth'),
('f1ed1753-7c25-4adc-98ec-255c75706e8b', 'IMPUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Import Bulk User Auth'),
('8f8640a8-b8df-49c9-a7e7-c9819b9d120a', 'VIWUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'View User Auth'),
('6e031408-67f1-42aa-952c-0d834576c084', 'DTLUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Detail User Auth'),
('25a7d56c-1fa2-40c6-bd38-d933498e971e', 'CRTUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Create User Auth'),
('c7f1ccb8-2161-4c47-bf84-74bc09194a0b', 'UPDUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Update User Auth'),
('2f19e56f-4b7f-4ab3-b52c-cac664f67406', 'NEWUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'New User Auth'),
('dcc2f17d-1ba2-41aa-90f3-fe11e3bfb27b', 'CPYUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Copy User Auth'),
('d57bb27d-9026-44b5-8e55-90d0914c4f63', 'UNLUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Unlock User Auth'),
('156a62bd-1c95-45a9-ae88-072d70236977', 'SAVUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Save User Auth'),
('4926537a-2ff5-43d4-b3fc-228de3752837', 'PRNUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Print User Auth'),
('7f790e7c-3b44-45ca-9ee2-61e8ddf467e7', 'DELUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Delete User Auth'),
('e4c69488-fc26-4e9b-aded-056300a5bce0', 'OMDUAU', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', null, 'Own Modify'),

('daab270b-3f30-4b5a-9656-49bffe9c085a', 'LSTASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', 'OPD', 'List UAUSR'),
('9cf4de35-783e-4a52-aad9-be440ee827f2', 'EXPASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Export List UAUSR'),
('c7881201-1996-4b71-a581-59a71e42b18b', 'IMPASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Import Bulk UAUSR'),
('299a1838-af15-4b41-baf8-6455026f6c53', 'VIWASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'View UAUSR'),
('67efde89-f9d4-4d53-b6c4-6f0f3bea0a15', 'DTLASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Detail UAUSR'),
('2d61504c-6577-4b99-8800-42b7c16783cb', 'CRTASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Create UAUSR'),
('03ee79fb-dd95-483e-a8d7-cad2c0f94a7e', 'UPDASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Update UAUSR'),
('d7998c05-d909-4aa3-95fb-ab829f2265b4', 'NEWASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'New UAUSR'),
('b601dc3a-9715-44a1-b618-d38ee363cd8c', 'CPYASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Copy UAUSR'),
('8cb23591-39cf-44b2-9249-c169f9c37bc5', 'UNLASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Unlock UAUSR'),
('88ba66e1-d0e3-4e14-acbf-0aea38e5fc14', 'SAVASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Save UAUSR'),
('9870d3a9-3c8d-4623-a878-5ffd654d674e', 'PRNASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Print UAUSR'),
('06a9840c-a778-4457-a769-2b8b3b0a3e55', 'DELASR', 'b890b3c3-c050-488c-90ee-54ab968c032c', null, 'Delete UAUSR'),

('b5c5be04-5309-4482-a5fd-78559240c03d', 'LSTSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', 'OPD', 'List System Role'),
('c59603f9-9c7c-45a2-b8de-009496453eea', 'EXPSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Export List System Role'),
('35028f0d-92a9-4325-a6e2-844aa2da1cea', 'IMPSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Import Bulk System Role'),
('8ce2fcc7-e08a-4015-980b-30a9eef19121', 'VIWSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'View System Role'),
('6fd5788a-7169-4871-a384-f1a90481cf3f', 'DTLSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Detail System Role'),
('6335118a-5c6e-4105-8b9c-290a6584908a', 'CRTSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Create System Role'),
('168e409f-e0ec-4d8e-85fb-39b6349bca4e', 'UPDSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Update System Role'),
('f3c8efd6-0c35-40e2-ace7-0cc18d2cc9dd', 'NEWSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'New System Role'),
('261a9d2a-d6d4-4421-8830-10bfc6b7c38e', 'CPYSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Copy System Role'),
('07174047-e660-4b27-923f-ef172103089e', 'UNLSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Unlock System Role'),
('1839e63d-ea5d-4524-835a-36c677083fd7', 'SAVSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Save System Role'),
('f9f86140-4bb5-48bd-861e-f19f2faaabc8', 'PRNSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Print System Role'),
('928e7fb0-eb3b-4cbe-8024-6726ea434986', 'DELSSR', '3a303e69-5462-40b4-81c8-d0104dfb4623', null, 'Delete System Role'),

('0010c2c5-4ccb-4064-aca9-a42bc0a7ea0d', 'LSTMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', 'OPD', 'List Mobile Role'),
('ff5b595b-0e73-4779-8477-de489541cb2e', 'EXPMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Export List Mobile Role'),
('bff3c4e9-4c12-4d99-922a-4d84ec25518d', 'IMPMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Import Bulk Mobile Role'),
('42efb499-555f-43c8-98d9-fa76f2918258', 'VIWMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'View Mobile Role'),
('9890be4f-6fad-47e5-b55d-5021ded3dac2', 'DTLMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Detail Mobile Role'),
('0a198588-9487-4eca-a9db-1b3887038f34', 'CRTMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Create Mobile Role'),
('1c1b716a-c3b7-4699-8fea-1fe83edb3312', 'UPDMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Update Mobile Role'),
('0cef3e1b-30b3-4c68-9195-8acbe738caad', 'NEWMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'New Mobile Role'),
('526b136b-0892-4197-9765-262b800e3ee4', 'CPYMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Copy Mobile Role'),
('c5c39c54-eacc-4948-914b-81c37ac24008', 'UNLMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Unlock Mobile Role'),
('7e671756-e6f1-47a6-b050-93a0db7f2417', 'SAVMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Save Mobile Role'),
('b114daea-e716-4af1-8709-2a4c77cd06c9', 'PRNMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Print Mobile Role'),
('9e521605-cd87-4901-ab31-934b242b4698', 'DELMBR', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', null, 'Delete Mobile Role'),

('d66c0bd6-9d3e-447c-8162-e0387b95ef8e', 'LSTCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', 'OPD', 'List Commodity Type'),
('eff549f5-5811-4bec-bf6e-9aeaa58f55e1', 'EXPCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Export List Commodity Type'),
('9ad454a2-37c1-4e32-a689-9e6ebd963402', 'IMPCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Import Bulk Commodity Type'),
('ecec8aa3-c283-46af-8fb9-420d4769daa8', 'VIWCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'View Commodity Type'),
('f93ae249-dc7f-46dd-b120-0792a4428555', 'DTLCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Detail Commodity Type'),
('4f178e77-9c89-461a-8895-a81c1f0a15fa', 'CRTCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Create Commodity Type'),
('4418a409-81d9-4e00-906a-64d7983eda3e', 'UPDCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Update Commodity Type'),
('0ab1ad8a-b161-4e4b-a53a-3ec8b843fda6', 'NEWCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'New Commodity Type'),
('0e3aa73c-7615-4e65-a975-e6d5ff36b0fe', 'CPYCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Copy Commodity Type'),
('8c0b3d5e-6ba9-4efc-b04c-bc169b1c8a54', 'UNLCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Unlock Commodity Type'),
('695ca711-e31c-45bb-a8bc-1ec5c9149516', 'SAVCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Save Commodity Type'),
('22601d24-ee39-41fe-bc5e-bcfc1cf51786', 'PRNCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Print Commodity Type'),
('04ecdd90-3981-4b16-a274-66efa6d673e5', 'DELCMT', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', null, 'Delete Commodity Type'),

('24051b90-a23f-4a9d-85db-22b36559753a', 'LSTCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', 'OPD', 'List Commodity'),
('98e30ac2-4482-4c6d-ac91-161b118821ee', 'EXPCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Export List Commodity'),
('e4a2eea1-4b48-4f7f-832f-a5a74a1ad5c2', 'IMPCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Import Bulk Commodity'),
('52600580-fcae-4195-ba16-611d3bd503a9', 'VIWCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'View Commodity'),
('197fec56-2e11-4347-a568-be64b659b7b1', 'DTLCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Detail Commodity'),
('e99d0522-b1a0-4bbf-88f4-1afca20099ff', 'CRTCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Create Commodity'),
('7ed1ad14-f331-4208-902a-d3487e85e0cf', 'UPDCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Update Commodity'),
('89112afa-6b02-45fd-9066-881fc6e8ce7f', 'NEWCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'New Commodity'),
('307e5b67-5c09-490d-89c1-766a8215ba09', 'CPYCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Copy Commodity'),
('ce7d8a1d-a965-49a3-a7e5-58f32d198984', 'UNLCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Unlock Commodity'),
('4517c6f3-528d-4a9a-a820-7cf227c53a47', 'SAVCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Save Commodity'),
('e1ec0f60-d3b3-4c0c-936d-dd05974a3218', 'PRNCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Print Commodity'),
('622c302f-7631-4970-a14a-13d12684acc1', 'DELCMD', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', null, 'Delete Commodity'),

('04340ff2-48d1-4429-8af6-8f253846a051', 'LSTCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', 'OPD', 'List Check Point'),
('5b8d6d57-b7a1-491f-a10f-7caa4fd9a553', 'EXPCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Export List Check Point'),
('7bcd5a13-3282-4f48-8484-651904447016', 'IMPCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Import Bulk Check Point'),
('6625e5bb-c1ef-4ffd-827b-2fe34d2f1fd5', 'VIWCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'View Check Point'),
('cb1c02fb-2aa5-433b-b932-adf644f997bf', 'DTLCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Detail Check Point'),
('b9a0f27c-67fe-4988-b6b8-198ba22c9f2c', 'CRTCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Create Check Point'),
('d88482b9-3765-49df-aee3-6e0504a4b059', 'UPDCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Update Check Point'),
('cf090b9e-8fd9-482f-bf4c-65ff5c3e979c', 'NEWCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'New Check Point'),
('61a94746-447e-4e2f-b879-33f9f56f00f1', 'CPYCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Copy Check Point'),
('81b45921-8d72-42c1-8cae-64c1fde4bf36', 'UNLCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Unlock Check Point'),
('706d40ae-613a-4eec-ab28-0552c95524c7', 'SAVCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Save Check Point'),
('17c6a02e-2826-47da-9a96-42bdf5b531c5', 'PRNCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Print Check Point'),
('c8970ab9-1599-4f62-bdc6-7933b0237227', 'DELCHP', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', null, 'Delete Check Point'),

('71741f95-babd-48e1-8173-e6eae7c3f624', 'LSTSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', 'OPD', 'List Sales Group'),
('3450ac51-ab36-46c6-bef4-f758925a951b', 'EXPSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Export List Sales Group'),
('3efc8c73-ebd9-45f9-b730-78162aa4964d', 'IMPSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Import Bulk Sales Group'),
('4ec15ad9-5f38-4600-97b4-f34c0f0f3bdd', 'VIWSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'View Sales Group'),
('09ed6182-fdf0-4ab3-aeba-b8e2c405abaa', 'DTLSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Detail Sales Group'),
('8de50cd7-d582-4f25-b218-244414bd3d2a', 'CRTSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Create Sales Group'),
('e6331caf-18be-4187-b722-45dfb73de94c', 'UPDSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Update Sales Group'),
('c7162db3-3f67-4d39-a572-fd2846c456b5', 'NEWSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'New Sales Group'),
('0b3e5293-8c73-434b-b091-274435b67a7e', 'CPYSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Copy Sales Group'),
('31411fc9-1637-46e3-b251-805c71722800', 'UNLSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Unlock Sales Group'),
('c42ff67b-f5a7-4527-a71f-1495ab3bf3fd', 'SAVSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Save Sales Group'),
('66077517-9047-4db6-aeeb-ed83259b9676', 'PRNSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Print Sales Group'),
('094e16a4-4afa-47df-b098-54b0c0931db0', 'DELSLG', '0404b98f-f3c1-47e3-ac90-59f71b820254', null, 'Delete Sales Group'),

('5e4fef8e-4d80-4d4e-b8ce-2ff766a53211', 'LSTSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', 'OPD', 'List Sales Team'),
('121baef2-3ec4-4f99-b8b0-047f2d78457a', 'EXPSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Export List Sales Team'),
('d46b88bf-9ddb-4cb1-9707-ba7c7a1981cc', 'IMPSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Import Bulk Sales Team'),
('5cad7ef0-fc85-4580-af92-76c9655f7a3b', 'VIWSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'View Sales Team'),
('80ab8544-dd83-4659-a670-5ca5200fb8b6', 'DTLSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Detail Sales Team'),
('f4e89c69-4489-4b10-bfb3-84d34d998f60', 'CRTSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Create Sales Team'),
('7ca7bae8-7cb7-495d-a4d6-c7f7bc902e7b', 'UPDSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Update Sales Team'),
('dba14f82-a529-4ca1-9299-69c497f891e0', 'NEWSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'New Sales Team'),
('7e9df6c6-9228-4b88-b2c1-d246dce602e1', 'CPYSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Copy Sales Team'),
('0c58722c-ff41-4205-b37f-495a498159ea', 'UNLSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Unlock Sales Team'),
('0c03cbcf-65e3-4376-aefe-4bb1aaf1d263', 'SAVSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Save Sales Team'),
('44b960b3-eb1f-4f73-80a0-7dcb8496d811', 'PRNSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Print Sales Team'),
('7ddc066a-f450-4790-8d57-69eae54332a1', 'DELSLT', '4e43a40b-0e3d-464b-958c-274970aa4e32', null, 'Delete Sales Team'),

('8e9ff2ee-a2cd-4f4b-b50f-aa7797dee766', 'LSTSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', 'OPD', 'List Sales Team Member'),
('dcf71fde-4d0d-4b09-8eb4-2ca214792178', 'EXPSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Export List Sales Team Member'),
('a3d0f841-de9c-4d4a-80e5-955d0567896a', 'IMPSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Import Bulk Sales Team Member'),
('668cd227-57b9-4f12-953e-382cce045562', 'VIWSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'View Sales Team Member'),
('ce7ee58b-fd9b-4705-936a-1103aadc3f21', 'DTLSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Detail Sales Team Member'),
('c0bab18e-66d0-4a19-9d02-a3ebc8bf3b96', 'CRTSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Create Sales Team Member'),
('959a4766-ea1b-4fed-b2f4-fdaf93388abe', 'UPDSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Update Sales Team Member'),
('a383133c-7836-431b-a1b9-0062ce158bdf', 'NEWSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'New Sales Team Member'),
('7171c2c9-3bc1-4d5e-8c52-cd4d0cc4714b', 'CPYSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Copy Sales Team Member'),
('4e037ff6-5b7c-4c1d-8512-ecc4021bd236', 'UNLSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Unlock Sales Team Member'),
('eb238a0f-7437-4c10-8063-a5e3e3c9a943', 'SAVSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Save Sales Team Member'),
('c77ce29d-2647-4b19-b655-612fb2903fa3', 'PRNSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Print Sales Team Member'),
('7324d22d-bdc1-4a47-8185-589ee702b2e9', 'DELSTM', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', null, 'Delete Sales Team Member'),

('a79bbf21-cb45-4a3a-bb79-dff07b44f91b', 'LSTSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', 'OPD', 'List Salesman'),
('771822cd-aea3-4dcd-8910-8708386b34a6', 'EXPSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Export List Salesman'),
('be63d9c4-679f-46e2-a753-24809144608f', 'IMPSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Import Bulk Salesman'),
('94d17fb3-362b-42a1-a58b-28588e4c42af', 'VIWSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'View Salesman'),
('98e1d3ef-6625-4213-813e-4d6145591a6b', 'DTLSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Detail Salesman'),
('ee162ba0-f3bc-4c80-ba31-80762abce6ab', 'CRTSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Create Salesman'),
('ce6c7609-1f9e-43f5-adf0-dc6fdf30936f', 'UPDSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Update Salesman'),
('b0b7088d-4f2f-4b29-954b-0fa53a449c21', 'NEWSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'New Salesman'),
('cefa8d35-c0d4-44f6-bb18-449b7b9f7e21', 'CPYSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Copy Salesman'),
('6865d669-4be3-4084-bb4e-f5f70cff2bb3', 'UNLSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Unlock Salesman'),
('76ed3228-84d7-438c-ab14-e694235d0516', 'SAVSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Save Salesman'),
('d48634d8-4527-4e99-acfe-51b060b8cd14', 'PRNSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Print Salesman'),
('6a23b62f-dedf-4698-ab35-f1a13f8e0e11', 'DELSLM', '2678cd4c-4569-44fc-ab24-410a2bfecee6', null, 'Delete Salesman'),

('e3ddae9f-b9a9-4682-af94-5ebbf0fd5be5', 'LSTIST', '12b55e47-495d-4795-88cd-9002a94c990f', 'OPD', 'List Invoice Statement Type'),
('9d40256e-40dd-440d-ac08-84c4ddafacdc', 'EXPIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Export List Invoice Statement Type'),
('9eaa2672-9ea3-4276-a105-9a3bb687ce0d', 'IMPIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Import Bulk Invoice Statement Type'),
('2da57682-6ca4-4e3e-a70f-9ee248baf135', 'VIWIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'View Invoice Statement Type'),
('c230e3ee-be08-487a-ad6d-a63d00023007', 'DTLIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Detail Invoice Statement Type'),
('4af21d66-50b7-4b33-82f3-b2e5b2eb0788', 'CRTIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Create Invoice Statement Type'),
('e31774a8-b21d-43f4-97c5-1819162bb58a', 'UPDIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Update Invoice Statement Type'),
('4a289ab2-9b96-402d-88d1-9b085b0bd76b', 'NEWIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'New Invoice Statement Type'),
('7dd90e99-a72f-41ba-a61a-44fae693a69b', 'CPYIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Copy Invoice Statement Type'),
('a17dba6d-e8b6-4576-95b7-a5b4a807d745', 'UNLIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Unlock Invoice Statement Type'),
('5d402e75-bfac-4d02-a6fa-629eaf23ee57', 'SAVIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Save Invoice Statement Type'),
('d7642905-58c5-4cfd-a7a0-11b3ca666ba4', 'PRNIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Print Invoice Statement Type'),
('4b77cee7-f69e-4fdb-8b98-24463712def5', 'DELIST', '12b55e47-495d-4795-88cd-9002a94c990f', null, 'Delete Invoice Statement Type'),

('183247e3-705a-48de-a748-116996be7b5a', 'LSTSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', 'OPD', 'List Shipment'),
('b2328e95-6ae4-40fb-becf-7a56bdb3ba74', 'EXPSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Export List Shipment'),
('8f5c7cdf-b7d5-48bc-a4e9-f026cb4e4149', 'IMPSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Import Bulk Shipment'),
('4b56fde2-4e18-4876-94d1-a3f9d0dfd490', 'VIWSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'View Shipment'),
('61121168-8e4f-4c2f-bc50-d3d6bd636d59', 'DTLSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Detail Shipment'),
('7fb40d33-bbb5-48dd-a7f1-af933e23fd00', 'CRTSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Create Shipment'),
('316fe6de-9771-4be3-8bf0-8c5214728c81', 'UPDSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Update Shipment'),
('fb6a021a-c7ef-4fbd-8fd4-542fe19dbb22', 'NEWSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'New Shipment'),
('34d2e10e-098c-4652-8181-6c2faa43ef65', 'CPYSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Copy Shipment'),
('84ae3cf4-0328-4641-84f4-7bc5666208de', 'UNLSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Unlock Shipment'),
('7d489ae3-43e2-4b25-9554-c140212e77c6', 'SAVSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Save Shipment'),
('ad331bc8-c137-4f96-b506-891d3e68aa87', 'PRNSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Print Shipment'),
('8496adc1-f08e-48e6-b3a7-75da6600e898', 'DELSHP', '7535b8b4-b445-41aa-a159-0876b56e8ebf', null, 'Delete Shipment'),

('e74d36f0-1472-4b1f-b754-13bf511377e1', 'LSTSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', 'OPD', 'List Shipment Check Point'),
('528c0b57-3c29-4559-9143-4d4254728f29', 'EXPSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Export List Shipment Check Point'),
('9422cc8a-bfb2-42c6-8fee-93e19edf01da', 'IMPSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Import Bulk Shipment Check Point'),
('cf9dc348-0a8f-4d4b-96f7-1e2c7d99dcd3', 'VIWSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'View Shipment Check Point'),
('58ef585a-b881-4cc4-a24a-6f0223031e63', 'DTLSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Detail Shipment Check Point'),
('5d70a7c9-61e8-4402-8f90-0d2ab9e682a3', 'CRTSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Create Shipment Check Point'),
('ae99c560-1b2e-421c-8354-cc1c899ef76d', 'UPDSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Update Shipment Check Point'),
('469092ac-65c5-46b5-84bb-a370a0abed57', 'NEWSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'New Shipment Check Point'),
('9d5218a9-ad89-457a-be77-295f53217c0e', 'CPYSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Copy Shipment Check Point'),
('5f255920-9476-4ae2-a8e3-8a3a4cb7eafe', 'UNLSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Unlock Shipment Check Point'),
('a102f7bc-deec-4ff4-a64a-d30a7fb25577', 'SAVSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Save Shipment Check Point'),
('a4b8c6b4-3c42-4469-85c1-c14b0b37d5a4', 'PRNSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Print Shipment Check Point'),
('b6681e9d-e573-4436-9f92-21ddd4f8befb', 'DELSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Delete Shipment Check Point'),
('2c39d0a5-afee-4d4f-9dc2-95c1e65c318b', 'CMDSCP', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', null, 'Customize Shipment Check Point Date'),

('7a5afc2d-8e0c-437d-881a-ee29a4325c01', 'LSTSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', 'OPD', 'List Shipment Invoice Statement'),
('a9f35ee3-b7fb-4c09-bda8-42e0ae19f512', 'EXPSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Export List Shipment Invoice Statement'),
('abf165e5-f6cc-485b-889f-60ed63f09bc7', 'IMPSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Import Bulk Shipment Invoice Statement'),
('0405dc35-a5b4-454a-9c3e-a574709e576b', 'VIWSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'View Shipment Invoice Statement'),
('2f3c837d-e61f-4545-9cb4-8f1f6f96c42a', 'DTLSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Detail Shipment Invoice Statement'),
('cab0c7af-1da7-4888-8429-53e673297267', 'CRTSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Create Shipment Invoice Statement'),
('7485fe27-262a-401f-9adc-698cec55d651', 'UPDSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Update Shipment Invoice Statement'),
('b7b0a010-3fc0-49cf-bb10-a162da5ad6af', 'NEWSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'New Shipment Invoice Statement'),
('a52883d2-2c3d-4eb5-98be-7d2438c35c0c', 'CPYSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Copy Shipment Invoice Statement'),
('b6b6b293-6c77-4829-9d6e-47ab8e5fe364', 'UNLSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Unlock Shipment Invoice Statement'),
('40b8f3e6-71ab-47ed-bf92-f1e3315bf7b5', 'SAVSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Save Shipment Invoice Statement'),
('25224652-9414-47dd-9fda-b5be0048f37a', 'PRNSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Print Shipment Invoice Statement'),
('dde5d799-3c30-4160-b31f-26863544892f', 'DELSIS', '533539bd-2f8b-4969-ac22-8848bb0d7024', null, 'Delete Shipment Invoice Statement'),

('409bb5a5-25fe-4c4f-9419-d7edc7dbadbb', 'LSTCSE', 'e462f117-077c-4aef-8f7e-658d78707724', 'OPD', 'List Customer Sector'),
('4997715d-ee25-4135-90db-82f433b50002', 'EXPCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Export List Customer Sector'),
('0942fba1-be4d-40ef-92ea-271b23132df9', 'IMPCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Import Bulk Customer Sector'),
('2ca887cc-ad45-4ce0-8d63-3729155e170b', 'VIWCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'View Customer Sector'),
('5a9efdbc-0950-40a9-9991-ab701d22f0dd', 'DTLCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Detail Customer Sector'),
('aca80f02-9052-43c9-8e05-2fc38e6b9800', 'CRTCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Create Customer Sector'),
('9bbc63fa-ae2e-4a92-8701-11c6f57f7e27', 'UPDCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Update Customer Sector'),
('70b3f3bb-1c0d-43d8-80e0-f9b32998ddbb', 'NEWCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'New Customer Sector'),
('b8ef81b3-6ea6-4184-ba4a-0bab1a7099ae', 'CPYCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Copy Customer Sector'),
('adb2b3f1-7c10-480a-87fe-1dd851abadab', 'UNLCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Unlock Customer Sector'),
('676870a6-c6bf-4ac1-b694-0ee9cdd0c12a', 'SAVCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Save Customer Sector'),
('4eef859d-f5e0-46f6-9010-057bb376f3ad', 'PRNCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Print Customer Sector'),
('b3f4aca5-29cd-48d0-b181-f7d5187f1582', 'DELCSE', 'e462f117-077c-4aef-8f7e-658d78707724', null, 'Delete Customer Sector'),

('567ad225-e53e-480e-ab24-c43e381a057a', 'LSTCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', 'OPD', 'List Country'),
('67c32584-ce56-4566-89ab-1a951bb97b0d', 'EXPCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Export List Country'),
('a51453c5-5d9b-402e-9a1d-ce13bcc4d75c', 'IMPCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Import Bulk Country'),
('64c322e5-7dc5-453e-883f-7514ec552d64', 'VIWCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'View Country'),
('c74ba13b-cb12-4ab4-ac7d-b909b3932522', 'DTLCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Detail Country'),
('a8f5ab4b-c376-4509-848b-9f8b6c727f85', 'CRTCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Create Country'),
('95048f03-66f5-4ece-a099-5cc8e9ceb1e8', 'UPDCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Update Country'),
('93d99445-d02b-46c5-9a3b-5103439c4b82', 'NEWCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'New Country'),
('3607570e-4c4b-45cf-b696-9914dd0c0a01', 'CPYCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Copy Country'),
('eef7fe31-2303-424b-97d4-72b733fe8f08', 'UNLCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Unlock Country'),
('1a809def-611d-4ec8-b620-e2ea40865dbb', 'SAVCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Save Country'),
('846b9b65-a129-4f82-9efc-4f3704477a64', 'PRNCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Print Country'),
('ce3ea218-0ded-4135-a878-f7b7fcd71036', 'DELCTR', '25de2a5c-3163-42e7-8fff-25b19961b9ed', null, 'Delete Country'),

('6e0f06a1-8e3b-457c-8e46-3d915dcd3800', 'LSTPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', 'OPD', 'List Province'),
('ae0ce75d-9d09-45c7-8b12-2b8f48c72dc3', 'EXPPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Export List Province'),
('94cd23c9-46ac-4dc1-a32e-49c83720ff4f', 'IMPPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Import Bulk Province'),
('77916d87-5570-4f7d-b186-0c48c44d393d', 'VIWPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'View Province'),
('5aae24ad-58cd-46a6-acd0-80ddd3c0178f', 'DTLPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Detail Province'),
('604958bd-d861-4f70-8200-27a2fc797a38', 'CRTPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Create Province'),
('fddfed0e-5b20-4060-94ef-7b100a755d12', 'UPDPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Update Province'),
('eac9490e-e174-47a6-b147-f9f37270d667', 'NEWPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'New Province'),
('4c29c2b8-aab2-4a44-b4c4-af9ecfbf7599', 'CPYPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Copy Province'),
('77a5ee9f-307b-4805-8892-b752637729c4', 'UNLPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Unlock Province'),
('c1bf4776-871c-4acb-b88d-46df8f84fbb8', 'SAVPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Save Province'),
('f6cf3e1e-6191-4baf-bf95-238e9eac6632', 'PRNPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Print Province'),
('a95a0794-dbef-4c09-8fe3-04c09bda9339', 'DELPRV', '36959a5a-f6a5-4b86-80ca-7feee689538d', null, 'Delete Province'),

('9447f06d-f376-43f2-a4a7-26ba1dc548d3', 'LSTDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', 'OPD', 'List District'),
('6d101e9b-e0ad-4ed7-806f-63915ab69eae', 'EXPDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Export List District'),
('5d35bdbd-1526-42f8-9efc-ec4612f8c8e4', 'IMPDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Import Bulk District'),
('d0710dde-7177-44b8-b01c-59f57373d8eb', 'VIWDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'View District'),
('0fa4aca1-1056-4276-9fdb-3ff8f7fb601e', 'DTLDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Detail District'),
('3ce9c036-7a8b-4348-8d72-d43a38e227be', 'CRTDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Create District'),
('39710341-3184-4520-a231-40b3cda1df3a', 'UPDDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Update District'),
('127512d7-6784-4fde-afc5-c1e1d6ba48a7', 'NEWDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'New District'),
('86a8898f-f833-4803-9678-692b33f0762c', 'CPYDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Copy District'),
('3ed71c22-ff7f-4a3d-9265-682460d1adcc', 'UNLDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Unlock District'),
('ecfd911b-92af-4f97-8ee4-7a271cb2edd6', 'SAVDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Save District'),
('59ad4fe6-a04f-45b2-8025-8fdaa40112e0', 'PRNDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Print District'),
('f08c02e6-ff47-411b-b302-53e61a45a42a', 'DELDST', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', null, 'Delete District'),

('4e256e36-11e1-43c7-be41-8cac5ac84b81', 'LSTCOM', '22d92ec8-0529-4207-87a6-659a4261918a', 'OPD', 'List Commune'),
('ed8c8dd7-8b47-4f55-886b-36d3395e006a', 'EXPCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Export List Commune'),
('3c23ee3e-0f59-4137-918f-0e224854316e', 'IMPCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Import Bulk Commune'),
('93b5b049-53d0-4b02-8ef0-56c9c6ecbd36', 'VIWCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'View Commune'),
('affb1fb4-4215-4ac2-a581-1abef0ee6a41', 'DTLCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Detail Commune'),
('529098ac-83a1-45dd-812f-158b6706bed7', 'CRTCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Create Commune'),
('8114b690-7d26-419e-a2cf-58ed7d508620', 'UPDCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Update Commune'),
('aefdb043-db2a-4044-9f5c-454e43e5a0b7', 'NEWCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'New Commune'),
('2883ef17-f71e-44e3-b06d-d2382e6b05bf', 'CPYCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Copy Commune'),
('f9962403-5318-4c77-925d-d50a15fc4360', 'UNLCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Unlock Commune'),
('4db475bd-722d-493a-aed5-0a16bd977943', 'SAVCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Save Commune'),
('354d132d-c7bb-4eb1-ad1d-b910f08c25b7', 'PRNCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Print Commune'),
('28d39238-d0b9-4064-84de-e147970e3254', 'DELCOM', '22d92ec8-0529-4207-87a6-659a4261918a', null, 'Delete Commune'),

('147cf491-0437-483d-b5e6-4d34f3bd49e0', 'LSTVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', 'OPD', 'List Village'),
('79855ab6-bbe9-4f8a-896d-d9c5fc4b0e36', 'EXPVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Export List Village'),
('c91de203-35f0-483c-ad15-7a79da4fe08d', 'IMPVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Import Bulk Village'),
('e51c8fe5-634a-405d-9fc8-fcd0058a9770', 'VIWVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'View Village'),
('522e2912-4aab-488a-8387-4c856668c193', 'DTLVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Detail Village'),
('3793907a-e635-41c9-a32a-0b9c4691bfeb', 'CRTVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Create Village'),
('74ebc809-27cb-4c97-b612-0752d2ebf755', 'UPDVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Update Village'),
('0e948b8a-f788-4311-a62d-4041434273d9', 'NEWVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'New Village'),
('bd641538-4b9e-4192-b668-dbb1e0b8b903', 'CPYVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Copy Village'),
('9bce4227-4b54-4922-b4bd-5d1f59fb2382', 'UNLVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Unlock Village'),
('b5cc3da7-f023-4ccc-aba9-85ad06103d3c', 'SAVVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Save Village'),
('5539e575-1aa3-4ec9-b915-f679686e52eb', 'PRNVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Print Village'),
('22de7d90-caf7-423d-9c70-2de80140c962', 'DELVLG', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', null, 'Delete Village');


DROP TABLE IF EXISTS company_system_module;
CREATE TABLE IF NOT EXISTS company_system_module(
                                                    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_module_id uuid primary key DEFAULT gen_random_uuid(),

    company_id uuid,
    system_module_id uuid,

    module_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_system_module (company_system_module_id, company_id, system_module_id, module_title) VALUES
('db13caf6-557e-4513-8e8e-02c6b618e112', 'b45c8a43-b247-4c75-b352-c6b4337186be', '65622047-b7d4-4b1d-a466-e41cccce9c85', 'Application Module'),
('ed17f080-009b-45b6-85e0-397de3b0451a', 'b45c8a43-b247-4c75-b352-c6b4337186be', '9d2fcd95-6a14-43cf-b0e4-e2a702c74e9c', 'Administrator Module'),
('dd3ac3e1-017d-4f6c-982a-589df910e007', 'b45c8a43-b247-4c75-b352-c6b4337186be', '6bdb835b-3f32-45ba-ac7f-31b4a202ca13', 'Miscellaneous Module'),
('5e1a64e8-2ef3-4ab3-9ab4-206e104b9444', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'c6116eb5-31b3-4ec6-a510-59de359d565f', 'Sales & Marketing Module'),

('ce8fc27c-5459-4019-b87b-c69ff48edeb7', 'b45c8a43-b247-4c75-b352-c6b4337186be', '097f58b2-5310-4217-b6ff-3ec95e7c6cca', 'Company System Authority Module'),
('4e19c417-9296-4ec0-8f39-a9e5e4e217c5', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'e198e974-a81a-4fa6-be26-346690e23153', 'Company User Department Module'),
('8286538b-aa75-4d0e-915b-1a73e0d4836d', 'b45c8a43-b247-4c75-b352-c6b4337186be', '8cffc08a-acd6-4c78-b9f9-b48a0e212897', 'Company User Position Module'),
('1568803e-de2d-4386-9d30-16159663e54c', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'e86c2454-bee4-40c8-94e2-1ce626561c23', 'Company Site Type Module'),

('b149bec6-447c-4728-9e87-6d1fa3879e32', 'b45c8a43-b247-4c75-b352-c6b4337186be', '02c97319-caa7-4700-9ccb-e83cde7abf46', 'Customer Module'),
('5b5375b9-224c-43ce-8e14-9b458a65453b', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ab74cafa-298e-40c2-b5e6-ad06493c151f', 'Customer Address Module'),
('00279497-75a7-4ff6-98b1-cd67796534d8', 'b45c8a43-b247-4c75-b352-c6b4337186be', '034a6fc6-4496-48e3-85fa-06d62883fb14', 'Customer Document Module'),

('0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'b45c8a43-b247-4c75-b352-c6b4337186be', '88fa36e4-aff1-4246-8653-8db737d35ff1', 'Quotation Module'),

('93e7244f-894d-426d-b01f-7553ebc8ab7d', 'b45c8a43-b247-4c75-b352-c6b4337186be', '169ff585-7a91-4bb0-9953-2e12cc8fb8ea', 'Agent Module'),

('7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', 'b45c8a43-b247-4c75-b352-c6b4337186be', '0dc481b7-705b-4d35-b87b-d3d6e07ebc60', 'Branch Module'),
('c4fdc346-3979-4027-b3ef-d3e75d6a344e', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'a526284e-93e0-41da-8a1e-16b75d832bdf', 'Site Module'),
('8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'b3e49a1a-9b95-438f-80ad-f87a93c49147', 'User Auth Module'),
('1df723f4-7e9f-498f-9995-13841e0f7ef4', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'b890b3c3-c050-488c-90ee-54ab968c032c', 'User Auth System Role Module'),
('4362a238-a956-4d73-b77b-4e149cd0ca7d', 'b45c8a43-b247-4c75-b352-c6b4337186be', '3a303e69-5462-40b4-81c8-d0104dfb4623', 'System Role Module'),
('b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', 'b45c8a43-b247-4c75-b352-c6b4337186be', '34b12ad8-a8ae-4a3b-bbb6-c7c4f21f8500', 'Mobile Role Module'),

('665d143a-9acf-4d9f-aa22-02eadb65afa7', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'c60a9cba-666a-4dd1-a84b-ed4e2f1bf99f', 'Commodity Type Module'),
('08f2f464-57e6-4054-ada2-3e619a0f0d28', 'b45c8a43-b247-4c75-b352-c6b4337186be', '1f0bd2c3-0904-4561-af5c-c6f6db0e8e9c', 'Commodity Module'),
('643f4163-a700-46ed-bd8e-cf5253c7c6aa', 'b45c8a43-b247-4c75-b352-c6b4337186be', '26d852e1-f655-4b3a-ac9d-8aa556e26ba2', 'Check Point Module'),
('7f0b7744-d87c-47d4-ae27-9713576a54fb', 'b45c8a43-b247-4c75-b352-c6b4337186be', '0404b98f-f3c1-47e3-ac90-59f71b820254', 'Sales Group Module'),
('bb1c9517-2eab-441b-b0e0-fcf35bdb547e', 'b45c8a43-b247-4c75-b352-c6b4337186be', '4e43a40b-0e3d-464b-958c-274970aa4e32', 'Sales Team Module'),
('b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ebedff4c-6f70-4cea-9ece-9eb300266d00', 'Sales Team Member Module'),
('c9669f27-75e6-46d0-9755-7655d6ca17f2', 'b45c8a43-b247-4c75-b352-c6b4337186be', '2678cd4c-4569-44fc-ab24-410a2bfecee6', 'Salesman Module'),
('66e8e090-a567-464e-85ea-ca0be2197ab3', 'b45c8a43-b247-4c75-b352-c6b4337186be', '12b55e47-495d-4795-88cd-9002a94c990f', 'Invoice Statement Type Module'),

('02fa8c17-851d-48b3-8df6-fd705f89312f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '7535b8b4-b445-41aa-a159-0876b56e8ebf', 'Shipment'),
('8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'f8c2210a-c44b-43ee-986f-62e6f8b7c068', 'Shipment Check Point'),
('ebd88222-c1ad-42af-acda-285c446326af', 'b45c8a43-b247-4c75-b352-c6b4337186be', '533539bd-2f8b-4969-ac22-8848bb0d7024', 'Shipment Invoice Statement'),
('d0f75ddc-d1f9-4f24-9451-d5c0c5181f70', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'e462f117-077c-4aef-8f7e-658d78707724', 'Customer Sector'),


('1b3d1cb5-fb96-416c-ba96-c3d6ad178790', 'b45c8a43-b247-4c75-b352-c6b4337186be', '25de2a5c-3163-42e7-8fff-25b19961b9ed', 'Country Module'),
('31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'b45c8a43-b247-4c75-b352-c6b4337186be', '36959a5a-f6a5-4b86-80ca-7feee689538d', 'Province Module'),
('b7aacb96-6c72-464d-8706-4ef14acab100', 'b45c8a43-b247-4c75-b352-c6b4337186be', '3dad1cc8-78a5-4a5e-b644-fd539742a4ca', 'District Module'),
('682bccc2-578e-45b5-b32a-4dfa9c057c5b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '22d92ec8-0529-4207-87a6-659a4261918a', 'Commune Module'),
('9d3a2dd9-d24e-45fb-9465-29e3032d141b', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'a86e22d3-e4f5-49aa-b6a7-641fe9c5dffe', 'Village Module');


DROP TABLE IF EXISTS company_system_module_title;
CREATE TABLE IF NOT EXISTS company_system_module_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_module_id uuid,
    module_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_system_module_id, lang)
);

DROP TABLE IF EXISTS company_system_authority;
CREATE TABLE IF NOT EXISTS company_system_authority(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_authority_id uuid primary key DEFAULT gen_random_uuid(),

    company_system_module_id uuid,
    system_authority_id uuid,

    authority_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_system_authority (company_system_authority_id, company_system_module_id, system_authority_id, authority_title) VALUES

    ('202d16a5-e903-46a6-82a4-badb06e08e81', 'db13caf6-557e-4513-8e8e-02c6b618e112', '21efc347-316b-443b-b430-1e0216f0db44', 'Application'),
    ('52f0eb1e-4350-45a3-9ebe-057284db4cf2', 'ed17f080-009b-45b6-85e0-397de3b0451a', '8a47d280-d29d-4b65-9e35-8ff438a12b6f', 'Administrator'),
    ('ea6c97cc-1399-4a9f-8d3f-d487ee2e0c27', 'dd3ac3e1-017d-4f6c-982a-589df910e007', '948cee17-2d9f-4e39-8fbf-afa01344b2c5', 'Miscellaneous'),
    ('697abd51-35c8-4315-8367-b4e91257dd25', '5e1a64e8-2ef3-4ab3-9ab4-206e104b9444', 'a72880d3-fc59-4c54-96b3-ca253392a100', 'Sales & Marketing'),

    ('7cb4ddc6-34cd-476e-bcbf-793c0a7cbab4', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '40e143f6-03f5-4ab8-bbf3-efe120c2fdbe', 'List Company System Authority'),
    ('9e2b2e66-32b2-47b6-8c09-1c95d0cceb4c', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '1460e74e-c26b-4656-bc4b-7f55f5e43ad6', 'Export List Company System Authority'),
    ('8508c6ef-e594-4dd7-89fc-004eb762bac6', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '3f098151-a37a-4772-b87f-a2a5b12b8f4e', 'Import Bulk Company System Authority'),
    ('4dc03c2f-2814-410d-827d-1212ecf0dcd4', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', 'cea1fe5f-3f06-42da-b48d-631c33132b79', 'View Company System Authority'),
    ('76529e07-35cb-47b4-ba66-6dd7973d1a57', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', 'd19df77f-35a8-4128-9c31-b3e9d92788e3', 'Detail Company System Authority'),
    ('914371bc-c654-4b45-9fcc-796bc7f7d41c', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', 'a6f966a8-425a-458a-b145-29bfedc968cf', 'Create Company System Authority'),
    ('f8dcecec-3edc-4563-9652-c6821288f00f', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '4da961ec-2558-4e81-8459-aa4cddb4c337', 'Update Company System Authority'),
    ('2d1fa7b1-c0e9-4a9b-bd8d-40bf6a3f8124', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '74269900-dd1c-4ddf-a80c-8822e0dee2b2', 'New Company System Authority'),
    ('9281a498-ef67-46a7-b17c-28ec4cea6995', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '05a353ba-343e-498a-9d4e-d55a2fecc3f4', 'Copy Company System Authority'),
    ('205b9740-2012-4905-88cf-8fe2adef04d9', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '359f3f5b-18fe-44a4-8d2b-41e7ad07b6b0', 'Unlock Company System Authority'),
    ('2699ff17-2cb1-4b45-aa90-551d391873d9', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '276da955-97cc-425a-82de-714769faf27d', 'Save Company System Authority'),
    ('03fd1601-1bb1-4d50-ace2-f316754f4173', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '106acd8f-9c8a-4545-98c3-d1e8357ae2bf', 'Print Company System Authority'),
    ('04833576-75a6-45f1-a177-ab69b69a270a', 'ce8fc27c-5459-4019-b87b-c69ff48edeb7', '9c612e25-e037-416f-805e-0d06ab1b18e8', 'Delete Company System Authority'),

    ('a0e5936c-3450-4089-8f46-2972f02e7163', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '98a75e06-5eb4-4400-a125-ef41668db3f4', 'List Company User Department'),
    ('ca5e0a55-3af1-466c-bb34-64aae751ba5c', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', 'f1090c7e-05b6-48bc-80cf-5415ac3066c1', 'Export List Company User Department'),
    ('79b4459d-277b-4550-b169-37214079d348', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '77b5109f-9afd-4ba6-9af2-3cf005a4de26', 'Import Bulk Company User Department'),
    ('5007f7b0-98b0-4c61-af84-a6a6b30ce9f2', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', 'f6539f19-8b18-445a-abdd-d9a3d9c7758d', 'View Company User Department'),
    ('21e639f2-7964-4963-a4ec-e7e0b370b1cf', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', 'fcf85d79-d84e-4de5-869c-e11326a98cc6', 'Detail Company User Department'),
    ('a5392b04-5f57-47fd-a28e-67f91c9458ce', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '849caba8-7e0f-48d8-9a14-bff10fd59322', 'Create Company User Department'),
    ('54546894-de86-41ec-8e7c-964958fa6879', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '0615d809-c58e-42a1-b1b4-9d592c6dd1da', 'Update Company User Department'),
    ('4af1c870-23b8-446b-a215-94f26affe44d', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '2e817574-b61d-4d88-a42e-26ffbcaa6800', 'New Company User Department'),
    ('963e4095-c717-4da0-b7b5-9122475615f6', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', 'f4772eb3-2c9c-406c-8422-64251a52eccd', 'Copy Company User Department'),
    ('e6a8b705-e6a7-448e-b0dc-6139eb2f4eed', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '1b57f713-bba3-4d00-8c65-c1b8332945a2', 'Unlock Company User Department'),
    ('f01f7d86-e1d4-4893-8a13-c4512d62bd28', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', 'f31267ca-de9c-4d3e-9b54-d46817fb9b7a', 'Save Company User Department'),
    ('13f50951-bcee-42cb-b228-04979d98b594', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '3875281b-02ed-4241-949c-2686bcdcbe91', 'Print Company User Department'),
    ('eac2f91d-798c-44f1-84a9-da9e09771e87', '4e19c417-9296-4ec0-8f39-a9e5e4e217c5', '27214bf2-df5a-4379-897a-08a22646e888', 'Delete Company User Department'),

    ('8a0f361b-dba2-4e01-82bb-f45aee6b2399', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '98a0375f-86af-40c2-8245-dd805fc7a2df', 'List Company User Position'),
    ('17f7f293-4a4d-4ae0-820b-74b96ad6c46e', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '07a6e28b-fb65-4b4f-a582-3c3c8ed5bb0b', 'Export List Company User Position'),
    ('aebaa7a6-bfd0-4b3e-8408-03333345f1df', '8286538b-aa75-4d0e-915b-1a73e0d4836d', 'e477a55a-4b36-477f-a3db-356b977fa82f', 'Import Bulk Company User Position'),
    ('3a7df816-aa0c-43e4-aad9-2cfe1454203b', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '224df0ed-8d83-43a5-842e-25d44804c085', 'View Company User Position'),
    ('cd473ed0-93f1-4878-b522-685b6d7c294f', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '669fa1f4-73c9-469a-a644-661c33315de6', 'Detail Company User Position'),
    ('2052301f-885f-444e-91f1-e788a6c8a63c', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '55bdf8a7-4a33-460e-bf74-0dc6b24fde7c', 'Create Company User Position'),
    ('8eec2261-dadb-4084-9517-20cce3ec5728', '8286538b-aa75-4d0e-915b-1a73e0d4836d', 'c3bf591c-69a2-433d-9ab3-3d1c419bd90f', 'Update Company User Position'),
    ('75de2bfe-3346-41b5-84f4-34face046eae', '8286538b-aa75-4d0e-915b-1a73e0d4836d', 'd37e8b9d-ddbb-4f8d-95af-d409f9982401', 'New Company User Position'),
    ('73ca45ab-a8a9-43f5-904d-9ab9e6c27d50', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '78c1b232-5f48-4301-acc0-00be628d16c8', 'Copy Company User Position'),
    ('1e84993c-75e9-4dc3-8b76-4cf9ef1ca5ec', '8286538b-aa75-4d0e-915b-1a73e0d4836d', 'cbb61b22-091a-43a3-9bec-6f9eee60995a', 'Unlock Company User Position'),
    ('13c2f224-6140-4113-9191-f363e6a38f16', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '4f723e0c-a32c-490f-a079-5317a82667e2', 'Save Company User Position'),
    ('72b2182b-7be9-4f1f-882c-6ea194739f43', '8286538b-aa75-4d0e-915b-1a73e0d4836d', 'e0efc777-ad55-4fb3-be85-b317a88597db', 'Print Company User Position'),
    ('2e2573a3-eb49-4cb4-9bbd-a12ff154c7df', '8286538b-aa75-4d0e-915b-1a73e0d4836d', '2f28a2de-fa92-4a1d-ab8b-ab45c680b71d', 'Delete Company User Position'),

    ('89672561-9b74-432b-be87-c497737a7020', '1568803e-de2d-4386-9d30-16159663e54c', 'adfada80-a2be-46d1-8ab1-10df0e89df44', 'List Company Site Type'),
    ('baeb455e-b25b-44e8-aec1-65398fd93f2b', '1568803e-de2d-4386-9d30-16159663e54c', 'bec8c6fa-e547-4702-8254-d7c11c3e6b5f', 'Export List Company Site Type'),
    ('0ff569fb-bf2f-40a8-bee3-f0987ed0c639', '1568803e-de2d-4386-9d30-16159663e54c', 'ab5aeeb8-8fcd-4fe5-a733-feeb5eb89dc2', 'Import Bulk Company Site Type'),
    ('2c0d24b2-2814-4e0c-9238-609b785737e3', '1568803e-de2d-4386-9d30-16159663e54c', '509f454a-e2bb-4ca6-aed0-f9ef8a8ded54', 'View Company Site Type'),
    ('680e676f-b38f-49ca-b5c4-2b55d859c7c4', '1568803e-de2d-4386-9d30-16159663e54c', '0ab96b3a-169d-4c5c-9b64-ac00ed9bd771', 'Detail Company Site Type'),
    ('be6c21dd-d619-4f19-bf31-af537d1d0c38', '1568803e-de2d-4386-9d30-16159663e54c', '1e3e4a52-40d7-42ab-8ec3-d5a1242153bb', 'Create Company Site Type'),
    ('3ef1472f-93d9-4962-a63a-6eecb5069fec', '1568803e-de2d-4386-9d30-16159663e54c', '1aeec473-c24e-4911-91ca-9e8d236f8172', 'Update Company Site Type'),
    ('e8416976-8a6f-4065-9c7f-4e67558cbaf7', '1568803e-de2d-4386-9d30-16159663e54c', '6efbf548-66e7-4622-b707-2f9892586cda', 'New Company Site Type'),
    ('61b98ffc-eb01-45f3-818e-44e92bce0cc7', '1568803e-de2d-4386-9d30-16159663e54c', '6198c16c-9f4b-4570-ba2c-7c06d88e149d', 'Copy Company Site Type'),
    ('5b19f56f-129d-4fc9-8648-658408bf82f6', '1568803e-de2d-4386-9d30-16159663e54c', '3a139c91-8f5b-4c71-8da1-be4cc00c2357', 'Unlock Company Site Type'),
    ('1778c561-9da0-42bb-86ce-98fa9e6e22ac', '1568803e-de2d-4386-9d30-16159663e54c', '4d28540e-02bc-4b8c-96e7-37a5ec08764e', 'Save Company Site Type'),
    ('9db1e26d-8625-4d1a-a8a5-684361dded16', '1568803e-de2d-4386-9d30-16159663e54c', '97eeeabf-e5fe-40ed-acd8-1a639a4e576d', 'Print Company Site Type'),
    ('c32e6508-d937-4adf-85c3-900140be3e62', '1568803e-de2d-4386-9d30-16159663e54c', '1b8645a7-bc42-46b3-b7b0-4d8e553f9f34', 'Delete Company Site Type'),

    ('45c78c6f-d010-4f91-bb67-3e5a606446b7', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '3ded270c-9077-4c48-9c99-bb8b55104e2e', 'List Customer'),
    ('b6c9e59e-baaf-4383-a828-32cf03545897', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '2ddc1f8b-66fb-4fd5-96e4-e49bbbfb0938', 'Export List Customer'),
    ('34865366-60f0-45ec-b7cd-ff2e122997df', 'b149bec6-447c-4728-9e87-6d1fa3879e32', 'c2fa5c84-3246-405d-93d9-f6af6afc2ae5', 'Import Bulk Customer'),
    ('e3ac4f60-97a6-4f76-baec-b763a7e314e4', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '4fe2dbf2-7ada-4155-9ed6-62e2440c2b30', 'View Customer'),
    ('e9f35caf-a793-40a4-af38-481732ed55ab', 'b149bec6-447c-4728-9e87-6d1fa3879e32', 'c892d1de-8fa4-47c1-b05d-b5251af98fc0', 'Detail Customer'),
    ('e7fa63ab-8e00-46a1-9d7f-0a7e6171942e', 'b149bec6-447c-4728-9e87-6d1fa3879e32', 'c4533ebf-0c31-43a0-851e-c5fbe9c96cf9', 'Create Customer'),
    ('a3875286-a1e6-486f-8e10-77f35af8c24f', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '22990386-ecc7-4770-b0fd-ffc9be516961', 'Update Customer'),
    ('7a77809d-24c7-4d14-a61a-13830e5c2de5', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '3fa68520-407c-434c-bdfe-641f0f656237', 'New Customer'),
    ('45886e2b-e1ea-4fa5-b7e4-ce954a1dd02c', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '562287e6-2edc-481b-a4c9-fe8641645a05', 'Copy Customer'),
    ('55416f5c-6331-4216-8cc8-8360a80ef4d4', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '854b4367-e116-4b4c-bb68-ffee70b9473c', 'Unlock Customer'),
    ('59c4cd56-3ef6-4fce-b6c0-2ba32a3e7510', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '17a2b176-3e96-454f-baa6-0858f12d5b6e', 'Save Customer'),
    ('908dbe55-5101-4308-aa88-53b613923243', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '0c04ccaa-60e1-40ae-9a82-2e7bacc8571b', 'Print Customer'),
    ('c58929e7-53ff-46fd-9616-3e79d775898b', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '5a6c8d99-8f45-4774-9f61-214aa7e7b632', 'Delete Customer'),
    ('bc7e551d-73d9-46f7-9c43-617256959b47', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '37ab8b66-d8e7-4fed-a57d-6905b5332505', 'Assign Cross Salesman Team'),
    ('0ba70544-7cd5-49c2-b43f-d7a63a5068c5', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '1e7c8145-abf4-4432-bc0c-725fd43772d7', 'Assign Parent Customer'),
    ('94c14607-2f43-48a3-9f5d-9e5e57067600', 'b149bec6-447c-4728-9e87-6d1fa3879e32', 'ec83c640-ec93-4b84-a659-016daaa7d504', 'View Cross Customer'),
    ('3d745375-cf7a-4938-a96b-3eb92da1a2b3', 'b149bec6-447c-4728-9e87-6d1fa3879e32', 'c2a8a886-6db9-4454-a67e-7e63a0f2ca5a', 'Update Cross Customer'),
    ('c47f13a6-38a4-40f9-8f3c-349967f6cfee', 'b149bec6-447c-4728-9e87-6d1fa3879e32', '0a6a4756-0789-492f-8dd1-1a98438f6958', 'View Customer Under Team'),
    ('f1358339-a348-4708-be3d-a57114a1d16e', 'b149bec6-447c-4728-9e87-6d1fa3879e32', 'f1b1a6d2-17f6-42fc-bf6e-6b7dce29ccec', 'Update Customer Under Team'),

    ('9fe9d6db-288d-4dd8-b41b-22b4663822fe', '5b5375b9-224c-43ce-8e14-9b458a65453b', 'c6f993f3-5e10-459d-a259-bae440c5cff3', 'List Customer Address'),
    ('b57a8dd7-92c6-4532-93ba-ea126aa6babb', '5b5375b9-224c-43ce-8e14-9b458a65453b', '53bf10b1-ff59-4e18-9d56-5387088f874d', 'Export List Customer Address'),
    ('2c58d781-f560-4e8e-b86e-6841dd12aeca', '5b5375b9-224c-43ce-8e14-9b458a65453b', '43bb63f6-b5ea-4193-82fb-2171102aa797', 'Import Bulk Customer Address'),
    ('ecee7084-3e87-4e5b-857d-5c3b807f7dfb', '5b5375b9-224c-43ce-8e14-9b458a65453b', '4667ca1e-1fd3-46bd-a6f1-7451899b2aa9', 'View Customer Address'),
    ('007dad7f-ab8f-4406-9af5-8689be0b4c74', '5b5375b9-224c-43ce-8e14-9b458a65453b', '2591c566-efd4-45ef-af43-42c40d43d302', 'Detail Customer Address'),
    ('e6e43ece-33db-491a-b43e-e507a74889f5', '5b5375b9-224c-43ce-8e14-9b458a65453b', 'db072901-cde1-4874-b7f2-acffae740fc9', 'Create Customer Address'),
    ('1b1448f4-ab02-4509-ae06-36a8c69b132e', '5b5375b9-224c-43ce-8e14-9b458a65453b', 'f563f827-0f06-4a28-bbe1-b78dfd5d4bb0', 'Update Customer Address'),
    ('e2e44446-b56b-4f54-8490-d2205a238f17', '5b5375b9-224c-43ce-8e14-9b458a65453b', '0dd209bf-0c64-4f85-a5da-2f4f620daebe', 'New Customer Address'),
    ('2509a15c-9bf1-48e1-9d18-1a2fc60ec0e7', '5b5375b9-224c-43ce-8e14-9b458a65453b', '1716322f-22dc-4fa6-b38b-28f6b0120153', 'Copy Customer Address'),
    ('b9ef7415-3dc1-48f1-87a2-26e6dd3f6746', '5b5375b9-224c-43ce-8e14-9b458a65453b', 'a6a40226-bf6f-45ba-a7e2-5c1915313d9c', 'Unlock Customer Address'),
    ('7f6dc788-154d-444c-a7fa-28a1301a86e5', '5b5375b9-224c-43ce-8e14-9b458a65453b', '65cc90f4-784e-4fcf-9611-e0e02a7d05bd', 'Save Customer Address'),
    ('4885c83a-5960-463a-ba8a-88e321e884e2', '5b5375b9-224c-43ce-8e14-9b458a65453b', 'e44a2865-c62a-46ab-8d3c-cb3e061aaea8', 'Print Customer Address'),
    ('02864cea-f214-4912-8e9e-0aff991484a0', '5b5375b9-224c-43ce-8e14-9b458a65453b', 'cb2d79c5-1fab-4a8a-91da-a7501d6f091f', 'Delete Customer Address'),

    ('d07be20f-53b4-49a9-ab0d-64508e14da0f', '00279497-75a7-4ff6-98b1-cd67796534d8', '05588472-423f-493f-814b-5e0d51ea2ccd', 'List Customer Document'),
    ('a9a2366b-300c-42d4-a457-1dda3f69e134', '00279497-75a7-4ff6-98b1-cd67796534d8', '66d32ed2-ade8-4162-af7a-a0fbe268f5b0', 'Export List Customer Document'),
    ('f9b6ca67-cbc3-4451-85af-c5e833b33145', '00279497-75a7-4ff6-98b1-cd67796534d8', '0638cda3-8da2-4a5c-897a-8771a3a75180', 'Import Bulk Customer Document'),
    ('36e0dd0d-99a8-41e9-ba32-9dff10df15bc', '00279497-75a7-4ff6-98b1-cd67796534d8', '72a9e353-9694-485d-a2ac-8fee7f3e7e0b', 'View Customer Document'),
    ('1f27b825-3304-4582-bf46-a38391deb499', '00279497-75a7-4ff6-98b1-cd67796534d8', '8be2573a-8b98-4964-aa12-e8341b99a19c', 'Detail Customer Document'),
    ('bde5d242-8309-4b9c-a863-0a2eb85bfc25', '00279497-75a7-4ff6-98b1-cd67796534d8', '8a72ac17-7e1c-4dd1-a5c7-372dc24f7253', 'Create Customer Document'),
    ('13ffde32-189e-45ae-8d3e-e95096542df2', '00279497-75a7-4ff6-98b1-cd67796534d8', '1619a3f6-5fc2-4510-b600-3a3469e277e3', 'Update Customer Document'),
    ('f2a1c37f-37ff-4901-89b2-1dc9c1a9876e', '00279497-75a7-4ff6-98b1-cd67796534d8', '581c652b-44cc-4e39-ae63-d4f30ff432b4', 'New Customer Document'),
    ('bac5d517-da90-4358-a8d8-dfe5751b52e7', '00279497-75a7-4ff6-98b1-cd67796534d8', '5cc0a7f2-de94-44b0-a532-37e283694e1a', 'Copy Customer Document'),
    ('dc33fc6c-c524-4b44-b011-a1a8c3a4bd99', '00279497-75a7-4ff6-98b1-cd67796534d8', '03651912-b241-4dde-906b-ed1adf5f84fa', 'Unlock Customer Document'),
    ('ca743ac4-d907-46fa-b4fd-3bf3b23bf7cb', '00279497-75a7-4ff6-98b1-cd67796534d8', '620e83c9-8426-44f8-95f7-f3b736c5d346', 'Save Customer Document'),
    ('79ccd2be-3d0e-481b-85ea-6ac3bba25a7f', '00279497-75a7-4ff6-98b1-cd67796534d8', 'cf5cc17d-658a-4488-8880-a3944bb996f7', 'Print Customer Document'),
    ('719b3afa-e344-4cee-b1f5-02a1b3bdc928', '00279497-75a7-4ff6-98b1-cd67796534d8', '44a32e0d-2635-4a3b-8f3f-f40e224bd043', 'Delete Customer Document'),
    ('203c452d-7e1c-4454-b3f6-a742547963ad', '00279497-75a7-4ff6-98b1-cd67796534d8', '6f9be232-5e84-475b-8c1c-e451d0bd9852', 'Download Customer Document'),

    ('d7fcd7a3-3015-4d9d-8963-071ca6eef397', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '3a616e6d-9759-4cd7-bbb4-2fc9dfe1abd9', 'List Quotation'),
    ('55453ce9-ba06-434f-a108-86c38f63afc4', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '1ea315b7-1e33-4747-a083-1231dfe59153', 'Export List Quotation'),
    ('adf93621-b0b8-4c5f-aacc-b8d884a9a441', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '5d501d40-2098-4a7f-94a8-d23a0838f6bc', 'Import Bulk Quotation'),
    ('49bf607a-b57c-4a7e-8657-384fdb72feef', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'f8b756a1-b7bf-4022-8441-79bfa9640216', 'View Quotation'),
    ('81b6be15-9ec4-434a-829f-27c3f0780eb6', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '984f21cf-dff1-4f0f-a1ac-245b0886c1c3', 'Detail Quotation'),
    ('81db508d-ab65-4e46-b24a-2deaf96fb9ac', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '19ce3092-9aef-4dfb-8ea4-c9f4971d3db3', 'Create Quotation'),
    ('cdb9c8bd-f151-4f92-b623-17072ff5bb05', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'd31de19a-43f2-434f-be3e-0f69a7e7914b', 'Update Quotation'),
    ('c5b857dc-aa15-480a-80d2-bed1c388866b', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '5952e1da-6a45-4ee5-9306-562a9d0d9bf0', 'New Quotation'),
    ('40182d53-0a7c-4c5e-96f8-cdc679920feb', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '01534415-c787-464c-8b90-4f2aa18ac82e', 'Copy Quotation'),
    ('b25735d8-778b-4fcf-bc32-11a443ad085e', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'd9298f4d-fed1-4a25-98f4-7ea14da33cd6', 'Unlock Quotation'),
    ('cf6c2065-9a7f-432c-92b0-d4217215804b', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '48b38651-353c-4574-8532-7abb462703ac', 'Save Quotation'),
    ('dddca731-4838-422c-850e-ad43c12d6be2', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '5cc092a6-5c53-4917-bbbc-432dd6635c40', 'Print Quotation'),
    ('25577e5f-20c3-4166-9158-3fdb910459ba', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'd6822b43-8687-4c3a-a7ef-9139255bed68', 'Delete Quotation'),
    ('711e9e81-9e76-48ae-9af2-de0ac4340bab', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '1e5541be-955d-40e9-b0a2-a10f6c1e0e65', 'View Cross Team'),
    ('3f478ff7-b20f-4c60-9d08-058e4c3ab833', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'e19fe23b-0ea7-45cc-8432-a26904399bce', 'Update Cross Team'),
    ('b409db22-c765-47b3-94ba-49f47bd8dd43', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '0f92307a-b3c0-4a50-af1d-c5814e83e1e7', 'View Quotation Under Team'),
    ('7f182d8f-d933-4725-9cac-c64a2d516d73', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'e8ce204c-38dd-41af-95b7-6a617f200b9d', 'Update Quotation Under Team'),
    ('a38d0bc7-cbe8-4203-8213-3a147dead399', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', 'f198e4a0-f300-42ff-978d-8d2759858aab', 'Delete Quotation Cross Team'),
    ('7395a84a-e9f0-455f-9c15-56662f0da76c', '0e1f5c5b-5215-4184-8adc-c636ed2f78de', '6eddd5f8-e327-4af6-961d-3c16e67dc7e0', 'Delete Quotation Under Team'),

    ('e572216d-6b58-4ec7-8565-0886513ddad1', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '60f7d7d3-0b07-4b67-9d04-f4fdd4fa7732', 'List Agent'),
    ('f549d350-ed34-492d-884a-f32012d092a6', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '71b035ac-ecbe-41fb-bdd8-e8d84fe83d60', 'Export List Agent'),
    ('79ec5982-301f-4184-80fa-2dc9e0897807', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '542a29eb-d1e4-4a9e-ad8e-9246cdbfa837', 'Import Bulk Agent'),
    ('d129da8e-28d1-45fb-88e9-96e12249f7c3', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '3cc33080-9344-4753-a87b-176834f2f170', 'View Agent'),
    ('d2aa50bb-389d-4a0c-887d-07b8f86fd0e8', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '68fa7f1d-5639-4938-a436-87faba5378db', 'Detail Agent'),
    ('68ed2fcf-0d3a-431f-9536-18afd936b192', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '1c19ed9d-eb12-450a-babd-c705b2840c96', 'Create Agent'),
    ('ca2d3b68-4092-4aa3-a4f0-26052e0325af', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '79f00d6f-eeb8-460c-9e06-8896918b31f0', 'Update Agent'),
    ('3e58b3c2-a053-4e1f-b01c-4c740361d914', '93e7244f-894d-426d-b01f-7553ebc8ab7d', 'b8756f32-9e71-4b6d-9515-06f21372836c', 'New Agent'),
    ('a1838f90-f7ac-48ad-8063-d918b82b14aa', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '81a405ff-9bc6-479f-a446-3bdf7309ee13', 'Copy Agent'),
    ('f6c1341d-6cf1-41e1-9a5f-152444847737', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '6cd46346-e72e-49f3-a5f4-cbe2432896a6', 'Unlock Agent'),
    ('1570640d-1ee4-4208-bc1d-9abc44eb197c', '93e7244f-894d-426d-b01f-7553ebc8ab7d', 'c699d89d-e02e-45b7-812c-4926833fb0ba', 'Save Agent'),
    ('4ed507f3-b8c0-49be-8c0a-7fadff29f452', '93e7244f-894d-426d-b01f-7553ebc8ab7d', '80a52aa6-837c-449b-9587-d9e91cc78a10', 'Print Agent'),
    ('e2549777-9ea1-4974-95c1-01bde60938b2', '93e7244f-894d-426d-b01f-7553ebc8ab7d', 'd7265f32-5743-465e-9cf6-a55199b32d2f', 'Delete Agent'),

    ('8ae4be38-c945-4a2d-b5f0-2c0c806488f1', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '1db88e67-9896-488f-89b9-ab386e365e04', 'List Branch'),
    ('c0069e74-32f7-4a54-9e2f-3c36f752cdc8', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '16351b18-5a7b-4924-8ad6-3349a900dda2', 'Export List Branch'),
    ('bb3c573e-81ee-43f5-bb8f-681f77a8b8fb', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '7608ffa5-7cfc-4025-ab3e-53aaa94fe018', 'Import Bulk Branch'),
    ('b52fae29-06ca-4a4e-9fe1-a88640d150a5', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', 'a5c45198-613b-47e4-a8c3-4b1599766c17', 'View Branch'),
    ('12972885-3859-4b3b-a673-0ba1fb38fa1a', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', 'eab4a7ee-897a-47ee-9d1d-227885fde3ff', 'Detail Branch'),
    ('e2d51f9f-d050-41b7-bfc2-0abe5fd786b4', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', 'd3d6f969-46f9-472a-963d-dda009d24c4d', 'Create Branch'),
    ('f83c9fa7-768a-48b7-948d-955411183335', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '0abd07d3-4ff9-4295-8323-3b493e58e20a', 'Update Branch'),
    ('83f60504-0194-446e-8a7c-fa93775d56b1', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '383545bc-5023-437a-b2a0-3d4653bf71fb', 'New Branch'),
    ('3187504c-7089-42f6-b865-6be6d7aa4144', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '09e19441-1eb7-46f6-99cc-4ca9e5f574c9', 'Copy Branch'),
    ('eab599aa-4bdc-44ad-85c8-4e0f5cc6fd7f', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '8e2c8567-bb3b-417c-b0af-f436214f20d1', 'Unlock Branch'),
    ('ab58b92d-e675-4c60-ae2e-9219d954f3df', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', 'b165b9f4-422c-4d71-9ad7-749d251adbec', 'Save Branch'),
    ('3e37a743-1f75-4579-95e6-e892351d300a', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', 'c5d5f897-37c3-4070-8310-241c410240c6', 'Print Branch'),
    ('5ff6f5c6-fd2e-4888-ad99-13ac6468099f', '7bb30f0f-4007-4f3c-a2e2-98c63c3823ef', '2ca7e4c9-6912-47f7-9ed2-c7d36daf0ff3', 'Delete Branch'),

    ('ee9ead9b-2c95-4647-9db0-36838a43d30a', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '3ab13d23-f1eb-4f11-9c89-935d15808159', 'List Site'),
    ('6b2fbc1e-b78b-44d7-a2ab-0936b6b3a68d', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '202c6a79-6dac-4459-b8f1-eaf4906a7b0c', 'Export List Site'),
    ('3ca10520-becc-45b7-b772-88c9435ac0d0', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '1fe38e98-53dd-4687-84c9-c1e5d1b52910', 'Import Bulk Site'),
    ('daf72508-db93-4bb1-89b3-ae40f6fff98d', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '03349737-d910-49f2-afb4-1743e4d012c8', 'View Site'),
    ('89b20bdf-6c59-4125-917b-b260b9ab4438', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', 'fb3267ec-020f-4dc6-9fdb-421a50fa56d8', 'Detail Site'),
    ('ad5f80be-9c61-4af1-830c-2e2f83d01853', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', 'cb1fa58c-e090-48e4-9a67-2e79113961fa', 'Create Site'),
    ('3cb6c0e6-18c4-4551-aba7-a13ee710b7ee', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', 'ea23e715-8a2d-46a4-a1b8-efa1c65d74ab', 'Update Site'),
    ('e24feffc-6b3e-48dc-8fab-b807422ce201', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '6e8498f9-7d7a-43bc-b0e3-fa89bbd84193', 'New Site'),
    ('945cd30e-8b1a-43e2-855d-dd49440d7955', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '37abbc66-1f84-4df6-b7ca-198ac2992fa1', 'Copy Site'),
    ('98baf984-3bdd-4b45-be9a-4798c0814332', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', 'cb7e3a70-3f24-4286-b605-80bed262973b', 'Unlock Site'),
    ('dc801dc4-c5ec-44db-bd85-7818d421f5db', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', 'c038e6ac-7a25-45da-952a-a96c40d6a8ca', 'Save Site'),
    ('5062f9d5-58c8-4f79-a615-1a0d8f480885', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '2544c2bc-5daa-459e-b872-349774c6cd76', 'Print Site'),
    ('e12b8e93-71d9-42a5-94ff-a1194958a03b', 'c4fdc346-3979-4027-b3ef-d3e75d6a344e', '18c55064-2631-4a29-a5c0-cf9cf83a3723', 'Delete Site'),

    ('2722cbd5-8c99-46ca-8ac2-6d6d3f7d71a7', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'e308f7dd-b1d4-4824-9f84-6f6d967f37ad', 'List User Auth'),
    ('eb7ce6f6-f66e-4cf5-84ce-779305069bd9', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '29b81f04-248a-49d3-9174-30bc1578c963', 'Export List User Auth'),
    ('83c33c28-9a72-4f00-bbbd-450fa645500a', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'f1ed1753-7c25-4adc-98ec-255c75706e8b', 'Import Bulk User Auth'),
    ('023bd783-5146-4616-8a45-8e9dd8c6850c', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '8f8640a8-b8df-49c9-a7e7-c9819b9d120a', 'View User Auth'),
    ('b50b8531-09ec-4fcc-be58-38c82f8ff6c2', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '6e031408-67f1-42aa-952c-0d834576c084', 'Detail User Auth'),
    ('466438b5-b6e9-41bd-9a4a-50598653bb28', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '25a7d56c-1fa2-40c6-bd38-d933498e971e', 'Create User Auth'),
    ('fa519b56-d949-4b7b-a995-0d705c98c3db', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'c7f1ccb8-2161-4c47-bf84-74bc09194a0b', 'Update User Auth'),
    ('019697da-d8d1-40dd-9d65-3585155323cf', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '2f19e56f-4b7f-4ab3-b52c-cac664f67406', 'New User Auth'),
    ('76293c50-796e-4690-b9fb-88ff32890de6', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'dcc2f17d-1ba2-41aa-90f3-fe11e3bfb27b', 'Copy User Auth'),
    ('0a27d273-9c0a-42c0-9065-2b5b5b6e6703', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'd57bb27d-9026-44b5-8e55-90d0914c4f63', 'Unlock User Auth'),
    ('86d0b7e6-04f2-4199-97cd-94a5ba4357d2', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '156a62bd-1c95-45a9-ae88-072d70236977', 'Save User Auth'),
    ('78966433-608d-4317-9d36-da8766bf43db', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '4926537a-2ff5-43d4-b3fc-228de3752837', 'Print User Auth'),
    ('427aa398-dfe7-4255-bb51-2e3aa8355b7f', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', '7f790e7c-3b44-45ca-9ee2-61e8ddf467e7', 'Delete User Auth'),
    ('e81f5dd2-8b4d-4bb2-b0be-1e62c924c5a0', '8e409b4f-06de-4e90-8bcd-b279bd0cbef7', 'e4c69488-fc26-4e9b-aded-056300a5bce0', 'Own Modify'),

    ('63f8059f-90a4-4a33-8ad2-f8a58804db55', '1df723f4-7e9f-498f-9995-13841e0f7ef4', 'daab270b-3f30-4b5a-9656-49bffe9c085a', 'List User Auth System Role'),
    ('d99911d8-62fb-493e-a47b-c0c6e3a22979', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '9cf4de35-783e-4a52-aad9-be440ee827f2', 'Export List User Auth System Role'),
    ('b43dbfe3-f0f4-48f0-a702-b9489a321de0', '1df723f4-7e9f-498f-9995-13841e0f7ef4', 'c7881201-1996-4b71-a581-59a71e42b18b', 'Import Bulk User Auth System Role'),
    ('717cc602-49ce-458d-9db6-d0ff3468e4d0', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '299a1838-af15-4b41-baf8-6455026f6c53', 'View User Auth System Role'),
    ('d920d7dd-51f9-467d-b508-fbcd1afef73d', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '67efde89-f9d4-4d53-b6c4-6f0f3bea0a15', 'Detail User Auth System Role'),
    ('8dac9233-b221-49ed-aa0c-c877ae5b1dc3', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '2d61504c-6577-4b99-8800-42b7c16783cb', 'Create User Auth System Role'),
    ('5e479d92-05a8-4750-80c3-71abdfc93d84', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '03ee79fb-dd95-483e-a8d7-cad2c0f94a7e', 'Update User Auth System Role'),
    ('00ede8db-6338-45f0-9ad7-463585d42c23', '1df723f4-7e9f-498f-9995-13841e0f7ef4', 'd7998c05-d909-4aa3-95fb-ab829f2265b4', 'New User Auth System Role'),
    ('1678de23-47a0-44eb-a8d0-f3b40fe4d647', '1df723f4-7e9f-498f-9995-13841e0f7ef4', 'b601dc3a-9715-44a1-b618-d38ee363cd8c', 'Copy User Auth System Role'),
    ('31a1f9e3-a3e1-4313-88fe-13f22da25477', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '8cb23591-39cf-44b2-9249-c169f9c37bc5', 'Unlock User Auth System Role'),
    ('e6689fe7-5694-4ae5-b131-ff746cf89cc2', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '88ba66e1-d0e3-4e14-acbf-0aea38e5fc14', 'Save User Auth System Role'),
    ('7957f366-3e4d-4432-94af-a2e4eaf994b6', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '9870d3a9-3c8d-4623-a878-5ffd654d674e', 'Print User Auth System Role'),
    ('c60df8a8-cb01-4a60-95c8-0010a056b0ef', '1df723f4-7e9f-498f-9995-13841e0f7ef4', '06a9840c-a778-4457-a769-2b8b3b0a3e55', 'Delete User Auth System Role'),

    ('5ac5d974-3456-4b87-a87a-8a34211b93ab', '4362a238-a956-4d73-b77b-4e149cd0ca7d', 'b5c5be04-5309-4482-a5fd-78559240c03d', 'List System Role'),
    ('b0a8828a-f58e-4564-b05f-3b9392c47b8e', '4362a238-a956-4d73-b77b-4e149cd0ca7d', 'c59603f9-9c7c-45a2-b8de-009496453eea', 'Export List System Role'),
    ('742b56f9-6c4e-4060-be61-0c48f3fc8275', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '35028f0d-92a9-4325-a6e2-844aa2da1cea', 'Import Bulk System Role'),
    ('65f7d3a3-c4da-49c8-9a2a-1b06b9a67b4d', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '8ce2fcc7-e08a-4015-980b-30a9eef19121', 'View System Role'),
    ('6d14db18-9b46-4c87-b33b-8d1fb4ce405f', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '6fd5788a-7169-4871-a384-f1a90481cf3f', 'Detail System Role'),
    ('c10c4502-045d-4680-a0e4-7a74520d94ec', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '6335118a-5c6e-4105-8b9c-290a6584908a', 'Create System Role'),
    ('66598ba7-3473-4591-9c23-86e639924c0c', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '168e409f-e0ec-4d8e-85fb-39b6349bca4e', 'Update System Role'),
    ('5827040a-6237-49d6-b473-f33e1e968e55', '4362a238-a956-4d73-b77b-4e149cd0ca7d', 'f3c8efd6-0c35-40e2-ace7-0cc18d2cc9dd', 'New System Role'),
    ('cf7805e5-b069-4140-9c52-6e5109d4cecb', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '261a9d2a-d6d4-4421-8830-10bfc6b7c38e', 'Copy System Role'),
    ('db86935a-6120-4823-8df6-dbe380c19c9a', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '07174047-e660-4b27-923f-ef172103089e', 'Unlock System Role'),
    ('44e76464-bf5e-41c7-ac8c-8a8ab26e448d', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '1839e63d-ea5d-4524-835a-36c677083fd7', 'Save System Role'),
    ('4e51973a-86c9-4c05-8341-135cdf208c31', '4362a238-a956-4d73-b77b-4e149cd0ca7d', 'f9f86140-4bb5-48bd-861e-f19f2faaabc8', 'Print System Role'),
    ('4e3b6914-25c6-4155-bde4-aba4793b68d5', '4362a238-a956-4d73-b77b-4e149cd0ca7d', '928e7fb0-eb3b-4cbe-8024-6726ea434986', 'Delete System Role'),

    ('e1a1662f-cf8b-4ac7-924d-6684d396d341', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '0010c2c5-4ccb-4064-aca9-a42bc0a7ea0d', 'List Mobile Role'),
    ('97d34455-e91d-43aa-ae1f-f72077c56825', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', 'ff5b595b-0e73-4779-8477-de489541cb2e', 'Export List Mobile Role'),
    ('f3858784-2999-43ad-8405-0d6d330cd298', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', 'bff3c4e9-4c12-4d99-922a-4d84ec25518d', 'Import Bulk Mobile Role'),
    ('257d4f0e-9309-4ab1-97ea-4c25f17da146', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '42efb499-555f-43c8-98d9-fa76f2918258', 'View Mobile Role'),
    ('e25cb596-f0b4-4e88-9adb-d615fad6c355', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '9890be4f-6fad-47e5-b55d-5021ded3dac2', 'Detail Mobile Role'),
    ('14e9a6a0-240c-456d-9494-54988f0b65c5', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '0a198588-9487-4eca-a9db-1b3887038f34', 'Create Mobile Role'),
    ('0293a14a-ed57-47d1-869a-346a85ed235a', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '1c1b716a-c3b7-4699-8fea-1fe83edb3312', 'Update Mobile Role'),
    ('99e5df7f-9b92-4a54-a2bc-0d4fcee5f307', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '0cef3e1b-30b3-4c68-9195-8acbe738caad', 'New Mobile Role'),
    ('7bc021a9-ce98-4b02-9712-8083115ad7fe', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '526b136b-0892-4197-9765-262b800e3ee4', 'Copy Mobile Role'),
    ('0fd891ee-28c0-4453-b088-539fd1cee3e8', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', 'c5c39c54-eacc-4948-914b-81c37ac24008', 'Unlock Mobile Role'),
    ('6ce2c478-04ad-422a-9d1d-5c8e59382ed6', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '7e671756-e6f1-47a6-b050-93a0db7f2417', 'Save Mobile Role'),
    ('0032ef2b-7673-47ff-845b-919bdc4ea321', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', 'b114daea-e716-4af1-8709-2a4c77cd06c9', 'Print Mobile Role'),
    ('3e25e84b-7643-4146-85bc-d74d21df5253', 'b7feedf6-4cbe-41ba-abf7-0963be8e7ea0', '9e521605-cd87-4901-ab31-934b242b4698', 'Delete Mobile Role'),

    ('4fa1ca2f-1cee-4d7f-b11e-ad76cb593ce3', '665d143a-9acf-4d9f-aa22-02eadb65afa7', 'd66c0bd6-9d3e-447c-8162-e0387b95ef8e', 'List Commodity Type'),
    ('ddb833aa-ec0f-456e-a26e-00aeb3561b66', '665d143a-9acf-4d9f-aa22-02eadb65afa7', 'eff549f5-5811-4bec-bf6e-9aeaa58f55e1', 'Export List Commodity Type'),
    ('94cabfe0-9f2b-478e-a84f-ede47c913e0f', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '9ad454a2-37c1-4e32-a689-9e6ebd963402', 'Import Bulk Commodity Type'),
    ('aab831d9-55f6-4a7e-86ee-522b16276aaf', '665d143a-9acf-4d9f-aa22-02eadb65afa7', 'ecec8aa3-c283-46af-8fb9-420d4769daa8', 'View Commodity Type'),
    ('8a9921ee-99fb-4e43-895e-88f564ddf544', '665d143a-9acf-4d9f-aa22-02eadb65afa7', 'f93ae249-dc7f-46dd-b120-0792a4428555', 'Detail Commodity Type'),
    ('5dfecb7a-0420-473f-b9ea-029d92c51dd1', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '4f178e77-9c89-461a-8895-a81c1f0a15fa', 'Create Commodity Type'),
    ('b5eba6b5-5bdd-4d2b-bd6b-0d1ce899450d', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '4418a409-81d9-4e00-906a-64d7983eda3e', 'Update Commodity Type'),
    ('6e5cf88f-250a-4c8b-94e2-3567da1c4461', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '0ab1ad8a-b161-4e4b-a53a-3ec8b843fda6', 'New Commodity Type'),
    ('af8a883d-6ec3-4f79-b051-d523d029b37a', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '0e3aa73c-7615-4e65-a975-e6d5ff36b0fe', 'Copy Commodity Type'),
    ('849c66a5-3d75-4042-a2aa-8502b89e871c', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '8c0b3d5e-6ba9-4efc-b04c-bc169b1c8a54', 'Unlock Commodity Type'),
    ('6b4ad269-2895-4ff3-bc67-b1649f290286', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '695ca711-e31c-45bb-a8bc-1ec5c9149516', 'Save Commodity Type'),
    ('62bdafdd-79cb-4879-9f4b-f26b6ac7ac09', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '22601d24-ee39-41fe-bc5e-bcfc1cf51786', 'Print Commodity Type'),
    ('a7f301fc-ae01-4b28-84f6-1309f3b940c1', '665d143a-9acf-4d9f-aa22-02eadb65afa7', '04ecdd90-3981-4b16-a274-66efa6d673e5', 'Delete Commodity Type'),

    ('f08d1544-d312-4bd8-a653-61775a9b8e3b', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '24051b90-a23f-4a9d-85db-22b36559753a', 'List Commodity'),
    ('fea6a834-f292-4bc4-bedf-7ddab3e9de10', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '98e30ac2-4482-4c6d-ac91-161b118821ee', 'Export List Commodity'),
    ('193d5a80-0268-491e-9539-86fa803f3752', '08f2f464-57e6-4054-ada2-3e619a0f0d28', 'e4a2eea1-4b48-4f7f-832f-a5a74a1ad5c2', 'Import Bulk Commodity'),
    ('59acd37a-a28c-43ad-818b-32fc18b4e636', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '52600580-fcae-4195-ba16-611d3bd503a9', 'View Commodity'),
    ('3ede8911-2674-4513-a682-f50df79220bb', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '197fec56-2e11-4347-a568-be64b659b7b1', 'Detail Commodity'),
    ('27209b9a-444d-46fc-b752-dd725145204d', '08f2f464-57e6-4054-ada2-3e619a0f0d28', 'e99d0522-b1a0-4bbf-88f4-1afca20099ff', 'Create Commodity'),
    ('6c89d76c-3e76-4873-8dd9-c559eab18a0d', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '7ed1ad14-f331-4208-902a-d3487e85e0cf', 'Update Commodity'),
    ('532a4b5a-e353-43ea-b82c-bcf2a979e916', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '89112afa-6b02-45fd-9066-881fc6e8ce7f', 'New Commodity'),
    ('414f399a-6053-48a6-bf75-e720358c9111', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '307e5b67-5c09-490d-89c1-766a8215ba09', 'Copy Commodity'),
    ('d981aed1-2342-44fe-b6e3-1e9aeb6ea5da', '08f2f464-57e6-4054-ada2-3e619a0f0d28', 'ce7d8a1d-a965-49a3-a7e5-58f32d198984', 'Unlock Commodity'),
    ('589b93ad-c781-4485-ac2f-a962b9cce5d5', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '4517c6f3-528d-4a9a-a820-7cf227c53a47', 'Save Commodity'),
    ('20ea9196-4ac7-4f8c-a79e-27275ec7bd35', '08f2f464-57e6-4054-ada2-3e619a0f0d28', 'e1ec0f60-d3b3-4c0c-936d-dd05974a3218', 'Print Commodity'),
    ('6f6f8225-e71f-4b26-8074-0963f262c84a', '08f2f464-57e6-4054-ada2-3e619a0f0d28', '622c302f-7631-4970-a14a-13d12684acc1', 'Delete Commodity'),

    ('8f8f5ead-904a-4869-9f60-c1b1f87ba1c4', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '04340ff2-48d1-4429-8af6-8f253846a051', 'List Check Point'),
    ('f6091ba1-3e9b-48bb-b788-1708bb4f82fd', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '5b8d6d57-b7a1-491f-a10f-7caa4fd9a553', 'Export List Check Point'),
    ('63ed4f2b-9711-449c-8500-2ef9f09e93aa', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '7bcd5a13-3282-4f48-8484-651904447016', 'Import Bulk Check Point'),
    ('4c1b7b6a-53b8-41ab-9b63-8a5ed50253c8', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '6625e5bb-c1ef-4ffd-827b-2fe34d2f1fd5', 'View Check Point'),
    ('6288af8c-7307-4304-a398-b1c156706e67', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', 'cb1c02fb-2aa5-433b-b932-adf644f997bf', 'Detail Check Point'),
    ('96eb1809-583e-44e7-9bba-0b1b9990ccb3', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', 'b9a0f27c-67fe-4988-b6b8-198ba22c9f2c', 'Create Check Point'),
    ('aeb9877e-1a5a-4321-a980-dd3c9fb73733', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', 'd88482b9-3765-49df-aee3-6e0504a4b059', 'Update Check Point'),
    ('0140d9c1-d1e7-44ce-ab55-cf2d87f3fac9', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', 'cf090b9e-8fd9-482f-bf4c-65ff5c3e979c', 'New Check Point'),
    ('3bf8d867-c713-4d4b-a45e-8cf0383b59c2', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '61a94746-447e-4e2f-b879-33f9f56f00f1', 'Copy Check Point'),
    ('51ecb3f4-c3ab-414f-8f99-3e512aefbadf', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '81b45921-8d72-42c1-8cae-64c1fde4bf36', 'Unlock Check Point'),
    ('3444d758-a2ba-4b2c-b223-76c9ac2826c7', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '706d40ae-613a-4eec-ab28-0552c95524c7', 'Save Check Point'),
    ('619d3866-0f08-4687-b7d5-683df419446f', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', '17c6a02e-2826-47da-9a96-42bdf5b531c5', 'Print Check Point'),
    ('eaf48439-7273-4ffb-aae1-8b11a8310ad0', '643f4163-a700-46ed-bd8e-cf5253c7c6aa', 'c8970ab9-1599-4f62-bdc6-7933b0237227', 'Delete Check Point'),

    ('fe67caf1-cccb-490e-a90d-9679765d91c4', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '71741f95-babd-48e1-8173-e6eae7c3f624', 'List Sales Group'),
    ('30afb409-9181-462d-8d81-f3e1afbcda6a', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '3450ac51-ab36-46c6-bef4-f758925a951b', 'Export List Sales Group'),
    ('7d96cb9a-5ded-4492-bb5d-fbe7cb9f3f00', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '3efc8c73-ebd9-45f9-b730-78162aa4964d', 'Import Bulk Sales Group'),
    ('df8a6621-277c-4102-8c5c-249a71d2f621', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '4ec15ad9-5f38-4600-97b4-f34c0f0f3bdd', 'View Sales Group'),
    ('591c839c-cec6-49dd-8025-50184d4f9e99', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '09ed6182-fdf0-4ab3-aeba-b8e2c405abaa', 'Detail Sales Group'),
    ('ababfadd-d3dc-4c05-bf08-a7710cdf94a0', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '8de50cd7-d582-4f25-b218-244414bd3d2a', 'Create Sales Group'),
    ('cb2dd057-a4df-43ef-a131-64ab847ea806', '7f0b7744-d87c-47d4-ae27-9713576a54fb', 'e6331caf-18be-4187-b722-45dfb73de94c', 'Update Sales Group'),
    ('2fc21755-8600-49a4-8f5f-d6d305830574', '7f0b7744-d87c-47d4-ae27-9713576a54fb', 'c7162db3-3f67-4d39-a572-fd2846c456b5', 'New Sales Group'),
    ('c2968762-675c-493c-b2db-1a6736a53c97', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '0b3e5293-8c73-434b-b091-274435b67a7e', 'Copy Sales Group'),
    ('4638ba5a-21b3-4d16-9828-69f8007e3782', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '31411fc9-1637-46e3-b251-805c71722800', 'Unlock Sales Group'),
    ('35f27203-9684-4b42-8f47-2a9298915aac', '7f0b7744-d87c-47d4-ae27-9713576a54fb', 'c42ff67b-f5a7-4527-a71f-1495ab3bf3fd', 'Save Sales Group'),
    ('c89172c5-9a6f-4df5-b7b6-157aa2072cf2', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '66077517-9047-4db6-aeeb-ed83259b9676', 'Print Sales Group'),
    ('5f35130d-a942-4c6e-aa41-17db93092f77', '7f0b7744-d87c-47d4-ae27-9713576a54fb', '094e16a4-4afa-47df-b098-54b0c0931db0', 'Delete Sales Group'),

    ('aa5f6fac-52aa-4663-85f3-69c230fc4f08', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '5e4fef8e-4d80-4d4e-b8ce-2ff766a53211', 'List Sales Team'),
    ('0101196d-c31e-4a91-877c-8f75ce2c776a', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '121baef2-3ec4-4f99-b8b0-047f2d78457a', 'Export List Sales Team'),
    ('4f34561f-f824-4890-b997-268f441ebc89', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', 'd46b88bf-9ddb-4cb1-9707-ba7c7a1981cc', 'Import Bulk Sales Team'),
    ('0353a77f-2d22-44b7-9b97-4ca69e77ddc4', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '5cad7ef0-fc85-4580-af92-76c9655f7a3b', 'View Sales Team'),
    ('c3ab75b4-7181-4ef8-95b8-7f952d0af288', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '80ab8544-dd83-4659-a670-5ca5200fb8b6', 'Detail Sales Team'),
    ('8c6cc4a7-989c-4b66-b163-5610d8e59455', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', 'f4e89c69-4489-4b10-bfb3-84d34d998f60', 'Create Sales Team'),
    ('967654cd-6499-47ff-be62-9a49d64d86e1', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '7ca7bae8-7cb7-495d-a4d6-c7f7bc902e7b', 'Update Sales Team'),
    ('613d3adc-1b7a-42e1-900d-f23c398e7fb0', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', 'dba14f82-a529-4ca1-9299-69c497f891e0', 'New Sales Team'),
    ('a34d96c4-c454-40eb-9b36-1171c1b085b2', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '7e9df6c6-9228-4b88-b2c1-d246dce602e1', 'Copy Sales Team'),
    ('e7f10186-cbbc-4c6f-b0b2-ca4199a764c5', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '0c58722c-ff41-4205-b37f-495a498159ea', 'Unlock Sales Team'),
    ('7ee748fc-fd4a-4564-89a7-e9ce366c0e18', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '0c03cbcf-65e3-4376-aefe-4bb1aaf1d263', 'Save Sales Team'),
    ('a1e1308a-2c72-4010-8dca-07844fb2f57f', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '44b960b3-eb1f-4f73-80a0-7dcb8496d811', 'Print Sales Team'),
    ('68d04ce1-4361-43c9-b566-2738ff2ad12a', 'bb1c9517-2eab-441b-b0e0-fcf35bdb547e', '7ddc066a-f450-4790-8d57-69eae54332a1', 'Delete Sales Team'),

    ('dd095717-7af6-4574-b27e-ace37ad10117', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', '8e9ff2ee-a2cd-4f4b-b50f-aa7797dee766', 'List Sales Team Member'),
    ('d9acc81f-650c-48df-a19b-3563b5c2cec5', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'dcf71fde-4d0d-4b09-8eb4-2ca214792178', 'Export List Sales Team Member'),
    ('43b21ea2-8711-435d-93a5-952f8bd0d8dd', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'a3d0f841-de9c-4d4a-80e5-955d0567896a', 'Import Bulk Sales Team Member'),
    ('1c26b3f0-db18-4430-9787-3a6a4b279d59', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', '668cd227-57b9-4f12-953e-382cce045562', 'View Sales Team Member'),
    ('feb61011-7197-4880-9c42-fc11150d446f', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'ce7ee58b-fd9b-4705-936a-1103aadc3f21', 'Detail Sales Team Member'),
    ('c91053cd-57c5-47d5-b240-cc6887db20c0', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'c0bab18e-66d0-4a19-9d02-a3ebc8bf3b96', 'Create Sales Team Member'),
    ('b346399d-3e20-4878-b72f-18b408342737', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', '959a4766-ea1b-4fed-b2f4-fdaf93388abe', 'Update Sales Team Member'),
    ('5e85024e-3d67-4b50-8026-91f96bc7b6b2', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'a383133c-7836-431b-a1b9-0062ce158bdf', 'New Sales Team Member'),
    ('c76bafe2-5d49-40e8-8059-1348be8da287', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', '7171c2c9-3bc1-4d5e-8c52-cd4d0cc4714b', 'Copy Sales Team Member'),
    ('c52e0f4f-3779-4818-9797-2591b3f62973', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', '4e037ff6-5b7c-4c1d-8512-ecc4021bd236', 'Unlock Sales Team Member'),
    ('7a922601-7e67-499c-9b5e-8162af21bb39', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'eb238a0f-7437-4c10-8063-a5e3e3c9a943', 'Save Sales Team Member'),
    ('b2123c7d-e5da-42c1-b66e-50a02b89a571', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', 'c77ce29d-2647-4b19-b655-612fb2903fa3', 'Print Sales Team Member'),
    ('71fb2f23-14f2-4ec5-a1e4-a62da6aa96a3', 'b7991c29-67b3-486f-b9a2-4fabb3d0b578', '7324d22d-bdc1-4a47-8185-589ee702b2e9', 'Delete Sales Team Member'),

    ('859a32b1-3da9-4bb0-bca5-5b50e1273851', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'a79bbf21-cb45-4a3a-bb79-dff07b44f91b', 'List Salesman'),
    ('f5e01625-4499-46ec-b3d3-4eacd7db39a8', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', '771822cd-aea3-4dcd-8910-8708386b34a6', 'Export List Salesman'),
    ('94985295-ba36-4734-b487-dc16f324cad9', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'be63d9c4-679f-46e2-a753-24809144608f', 'Import Bulk Salesman'),
    ('d3ff4410-4f9b-47b0-b5f5-5dea10a6f287', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', '94d17fb3-362b-42a1-a58b-28588e4c42af', 'View Salesman'),
    ('4173cce2-93b6-4d93-9f83-2972123cefc3', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', '98e1d3ef-6625-4213-813e-4d6145591a6b', 'Detail Salesman'),
    ('00701c69-08ff-45ec-81d2-1d100c8eec69', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'ee162ba0-f3bc-4c80-ba31-80762abce6ab', 'Create Salesman'),
    ('c3af023c-1866-4d76-8375-a4488675092a', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'ce6c7609-1f9e-43f5-adf0-dc6fdf30936f', 'Update Salesman'),
    ('fce89081-bc3e-4172-89d5-1681d93393d4', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'b0b7088d-4f2f-4b29-954b-0fa53a449c21', 'New Salesman'),
    ('89304021-edb2-404a-abcb-59502c4a3028', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'cefa8d35-c0d4-44f6-bb18-449b7b9f7e21', 'Copy Salesman'),
    ('7c4502bf-d30d-4c56-8aa3-63597390a5e5', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', '6865d669-4be3-4084-bb4e-f5f70cff2bb3', 'Unlock Salesman'),
    ('54f304ec-1a70-469f-b29f-e42a7e4963f4', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', '76ed3228-84d7-438c-ab14-e694235d0516', 'Save Salesman'),
    ('3aafb806-47ac-4e35-9a1d-50f8c3c3c719', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', 'd48634d8-4527-4e99-acfe-51b060b8cd14', 'Print Salesman'),
    ('27f86811-f722-4c85-a5c3-3a8547f6375a', 'c9669f27-75e6-46d0-9755-7655d6ca17f2', '6a23b62f-dedf-4698-ab35-f1a13f8e0e11', 'Delete Salesman'),

    ('ef7b2102-8207-4302-940f-5b86ee9a2b52', '66e8e090-a567-464e-85ea-ca0be2197ab3', 'e3ddae9f-b9a9-4682-af94-5ebbf0fd5be5', 'List Invoice Statement Type'),
    ('e37cf50e-420e-4e55-bc09-ebc904d37d8d', '66e8e090-a567-464e-85ea-ca0be2197ab3', '9d40256e-40dd-440d-ac08-84c4ddafacdc', 'Export List Invoice Statement Type'),
    ('bb8f8acc-55dc-4a8f-80fc-a45167a0ac55', '66e8e090-a567-464e-85ea-ca0be2197ab3', '9eaa2672-9ea3-4276-a105-9a3bb687ce0d', 'Import Bulk Invoice Statement Type'),
    ('d1a110c9-4ae9-477d-9355-390552ee4312', '66e8e090-a567-464e-85ea-ca0be2197ab3', '2da57682-6ca4-4e3e-a70f-9ee248baf135', 'View Invoice Statement Type'),
    ('4e69e2ec-ffdb-43a0-8907-2571e3c6e9a2', '66e8e090-a567-464e-85ea-ca0be2197ab3', 'c230e3ee-be08-487a-ad6d-a63d00023007', 'Detail Invoice Statement Type'),
    ('becfdc6c-c8bc-4876-b290-40598befcd99', '66e8e090-a567-464e-85ea-ca0be2197ab3', '4af21d66-50b7-4b33-82f3-b2e5b2eb0788', 'Create Invoice Statement Type'),
    ('d41dc5f1-502b-4e8f-b1fc-251da8170f5b', '66e8e090-a567-464e-85ea-ca0be2197ab3', 'e31774a8-b21d-43f4-97c5-1819162bb58a', 'Update Invoice Statement Type'),
    ('b6f9a0f5-e61c-49cf-91e9-bada78940968', '66e8e090-a567-464e-85ea-ca0be2197ab3', '4a289ab2-9b96-402d-88d1-9b085b0bd76b', 'New Invoice Statement Type'),
    ('2bec53ed-73bf-494d-90f4-4f10a05ceaae', '66e8e090-a567-464e-85ea-ca0be2197ab3', '7dd90e99-a72f-41ba-a61a-44fae693a69b', 'Copy Invoice Statement Type'),
    ('d8c189a1-bc30-46df-81ba-839145e33c57', '66e8e090-a567-464e-85ea-ca0be2197ab3', 'a17dba6d-e8b6-4576-95b7-a5b4a807d745', 'Unlock Invoice Statement Type'),
    ('f128d4fa-c458-4528-b375-a0adc47c5754', '66e8e090-a567-464e-85ea-ca0be2197ab3', '5d402e75-bfac-4d02-a6fa-629eaf23ee57', 'Save Invoice Statement Type'),
    ('fc60f677-dbad-4c6e-bf88-e5062d181c3e', '66e8e090-a567-464e-85ea-ca0be2197ab3', 'd7642905-58c5-4cfd-a7a0-11b3ca666ba4', 'Print Invoice Statement Type'),
    ('258445a1-2265-4366-a74f-1d34d98a5765', '66e8e090-a567-464e-85ea-ca0be2197ab3', '4b77cee7-f69e-4fdb-8b98-24463712def5', 'Delete Invoice Statement Type'),

    ('9fa72528-22ba-41f5-9591-1c8cbd0c8510', '02fa8c17-851d-48b3-8df6-fd705f89312f', '183247e3-705a-48de-a748-116996be7b5a', 'List Shipment'),
    ('bbc3ddab-16d5-4509-befc-cc8f1e9c5a96', '02fa8c17-851d-48b3-8df6-fd705f89312f', 'b2328e95-6ae4-40fb-becf-7a56bdb3ba74', 'Export List Shipment'),
    ('3ffacf6b-0d23-4ea7-8488-fc0e2fe8bc6a', '02fa8c17-851d-48b3-8df6-fd705f89312f', '8f5c7cdf-b7d5-48bc-a4e9-f026cb4e4149', 'Import Bulk Shipment'),
    ('6eeadf14-e539-4a96-8e93-0023dae255b6', '02fa8c17-851d-48b3-8df6-fd705f89312f', '4b56fde2-4e18-4876-94d1-a3f9d0dfd490', 'View Shipment'),
    ('9fd013d3-8a20-45bb-8471-0a66d6b8dc99', '02fa8c17-851d-48b3-8df6-fd705f89312f', '61121168-8e4f-4c2f-bc50-d3d6bd636d59', 'Detail Shipment'),
    ('c474c324-1ecd-481b-8444-bc803793e02a', '02fa8c17-851d-48b3-8df6-fd705f89312f', '7fb40d33-bbb5-48dd-a7f1-af933e23fd00', 'Create Shipment'),
    ('bba8d2fe-4b41-445e-b203-fcb146ed1d6a', '02fa8c17-851d-48b3-8df6-fd705f89312f', '316fe6de-9771-4be3-8bf0-8c5214728c81', 'Update Shipment'),
    ('ddc6a57d-1352-41b8-a421-50b9c0a1b6fd', '02fa8c17-851d-48b3-8df6-fd705f89312f', 'fb6a021a-c7ef-4fbd-8fd4-542fe19dbb22', 'New Shipment'),
    ('d686ddd9-15a3-4861-ab13-1d74c7cf95c9', '02fa8c17-851d-48b3-8df6-fd705f89312f', '34d2e10e-098c-4652-8181-6c2faa43ef65', 'Copy Shipment'),
    ('96fd89cd-c1eb-479c-a992-3ff366670928', '02fa8c17-851d-48b3-8df6-fd705f89312f', '84ae3cf4-0328-4641-84f4-7bc5666208de', 'Unlock Shipment'),
    ('405eaa02-517c-45b3-88e4-d1f520d3acbd', '02fa8c17-851d-48b3-8df6-fd705f89312f', '7d489ae3-43e2-4b25-9554-c140212e77c6', 'Save Shipment'),
    ('16f41390-b513-4fc0-a8db-2ccc12b91fc7', '02fa8c17-851d-48b3-8df6-fd705f89312f', 'ad331bc8-c137-4f96-b506-891d3e68aa87', 'Print Shipment'),
    ('91ffb659-d2e9-43a7-a23d-f71db2757c4b', '02fa8c17-851d-48b3-8df6-fd705f89312f', '8496adc1-f08e-48e6-b3a7-75da6600e898', 'Delete Shipment'),

    ('06531e3d-639c-4a7d-a9f2-eb6ac6907668', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'e74d36f0-1472-4b1f-b754-13bf511377e1', 'List Shipment Check Point'),
    ('581d03a1-aa8c-44b0-b878-16f025824ae9', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '528c0b57-3c29-4559-9143-4d4254728f29', 'Export List Shipment Check Point'),
    ('fd78f592-02b2-4f71-833e-770b107863eb', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '9422cc8a-bfb2-42c6-8fee-93e19edf01da', 'Import Bulk Shipment Check Point'),
    ('ef558895-8150-48bb-a1d5-e6e18f7f6498', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'cf9dc348-0a8f-4d4b-96f7-1e2c7d99dcd3', 'View Shipment Check Point'),
    ('bc70f1b1-1b1f-40d4-8429-3ab1574c9138', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '58ef585a-b881-4cc4-a24a-6f0223031e63', 'Detail Shipment Check Point'),
    ('a868a6f4-d5ab-4ca9-af2f-1ef2a09fd4ff', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '5d70a7c9-61e8-4402-8f90-0d2ab9e682a3', 'Create Shipment Check Point'),
    ('adefa814-3fe6-48a7-98d2-f409da6a5772', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'ae99c560-1b2e-421c-8354-cc1c899ef76d', 'Update Shipment Check Point'),
    ('b5914b8d-8eac-4793-960e-a6c4bc49fbc3', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '469092ac-65c5-46b5-84bb-a370a0abed57', 'New Shipment Check Point'),
    ('4bdf9f3b-8799-4f7f-98d2-4cb67812b566', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '9d5218a9-ad89-457a-be77-295f53217c0e', 'Copy Shipment Check Point'),
    ('7a5f54e9-972b-4326-a56e-0826d09daac8', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '5f255920-9476-4ae2-a8e3-8a3a4cb7eafe', 'Unlock Shipment Check Point'),
    ('c3673ce9-22cb-4ae9-8eb9-6b66a04cf791', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'a102f7bc-deec-4ff4-a64a-d30a7fb25577', 'Save Shipment Check Point'),
    ('fdde8e30-53fe-4563-a08f-7f59764bde6d', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'a4b8c6b4-3c42-4469-85c1-c14b0b37d5a4', 'Print Shipment Check Point'),
    ('6b8e12ee-a121-46a1-89a7-2bf634e71687', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', 'b6681e9d-e573-4436-9f92-21ddd4f8befb', 'Delete Shipment Check Point'),
    ('67d17713-7897-45f0-8392-cf8d6a68861a', '8ffcd098-ac2e-4b27-bda7-8bf1ddd098fd', '2c39d0a5-afee-4d4f-9dc2-95c1e65c318b', 'Customize Shipment Check Point Date'),

    ('1d8bd849-8ad3-44a4-9817-5aed29c90807', 'ebd88222-c1ad-42af-acda-285c446326af', '7a5afc2d-8e0c-437d-881a-ee29a4325c01', 'List Shipment Invoice Statement'),
    ('7f967f14-f08e-4506-930d-c20ff23e2a05', 'ebd88222-c1ad-42af-acda-285c446326af', 'a9f35ee3-b7fb-4c09-bda8-42e0ae19f512', 'Export List Shipment Invoice Statement'),
    ('65de1fc2-7a2c-4fcd-b72d-1518f5bd4b24', 'ebd88222-c1ad-42af-acda-285c446326af', 'abf165e5-f6cc-485b-889f-60ed63f09bc7', 'Import Bulk Shipment Invoice Statement'),
    ('3b4d085d-d7ae-4b0c-ae9e-42266f90beab', 'ebd88222-c1ad-42af-acda-285c446326af', '0405dc35-a5b4-454a-9c3e-a574709e576b', 'View Shipment Invoice Statement'),
    ('e39ecc30-570a-4539-aa56-c6b52ee5111e', 'ebd88222-c1ad-42af-acda-285c446326af', '2f3c837d-e61f-4545-9cb4-8f1f6f96c42a', 'Detail Shipment Invoice Statement'),
    ('4580617f-430f-4a5e-8262-c39de2141b7a', 'ebd88222-c1ad-42af-acda-285c446326af', 'cab0c7af-1da7-4888-8429-53e673297267', 'Create Shipment Invoice Statement'),
    ('e6877e3b-c0aa-4b34-bed1-41426b135173', 'ebd88222-c1ad-42af-acda-285c446326af', '7485fe27-262a-401f-9adc-698cec55d651', 'Update Shipment Invoice Statement'),
    ('89001654-e50c-4c3c-97e8-916f937a2bd6', 'ebd88222-c1ad-42af-acda-285c446326af', 'b7b0a010-3fc0-49cf-bb10-a162da5ad6af', 'New Shipment Invoice Statement'),
    ('6e649148-1ca7-4642-80b6-9e68baa43397', 'ebd88222-c1ad-42af-acda-285c446326af', 'a52883d2-2c3d-4eb5-98be-7d2438c35c0c', 'Copy Shipment Invoice Statement'),
    ('6fbf5d00-af30-4be8-b1a4-91bf11504efe', 'ebd88222-c1ad-42af-acda-285c446326af', 'b6b6b293-6c77-4829-9d6e-47ab8e5fe364', 'Unlock Shipment Invoice Statement'),
    ('ca472fdb-ae9e-4005-b400-9a927091a716', 'ebd88222-c1ad-42af-acda-285c446326af', '40b8f3e6-71ab-47ed-bf92-f1e3315bf7b5', 'Save Shipment Invoice Statement'),
    ('878c563e-de3e-49a3-a902-768e9602863b', 'ebd88222-c1ad-42af-acda-285c446326af', '25224652-9414-47dd-9fda-b5be0048f37a', 'Print Shipment Invoice Statement'),
    ('8866d3e8-5d99-439a-807b-152e574c754a', 'ebd88222-c1ad-42af-acda-285c446326af', 'dde5d799-3c30-4160-b31f-26863544892f', 'Delete Shipment Invoice Statement'),

    ('83dc87c5-c044-4995-9985-b81422c5ed34', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '409bb5a5-25fe-4c4f-9419-d7edc7dbadbb', 'List Customer Sector'),
    ('d3a41b1b-2f2b-4e51-aeb3-f4166a42dc5d', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '4997715d-ee25-4135-90db-82f433b50002', 'Export List Customer Sector'),
    ('82d46274-d279-4252-99b4-97fceef1976b', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '0942fba1-be4d-40ef-92ea-271b23132df9', 'Import Bulk Customer Sector'),
    ('de7b1178-99db-41de-8aad-a5ebbd7de232', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '2ca887cc-ad45-4ce0-8d63-3729155e170b', 'View Customer Sector'),
    ('cbe7fb81-b499-4a10-a6f5-986b1c03b9b8', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '5a9efdbc-0950-40a9-9991-ab701d22f0dd', 'Detail Customer Sector'),
    ('2921582f-7029-4c8e-a287-c942b723c7d8', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', 'aca80f02-9052-43c9-8e05-2fc38e6b9800', 'Create Customer Sector'),
    ('a5606081-fb2d-42d6-b55a-6c70056d36f2', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '9bbc63fa-ae2e-4a92-8701-11c6f57f7e27', 'Update Customer Sector'),
    ('ce0350f4-5256-4d3a-8740-6e2bb63e29d3', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '70b3f3bb-1c0d-43d8-80e0-f9b32998ddbb', 'New Customer Sector'),
    ('4d5bcfb8-4d63-4ea7-92ab-efadbd59eef2', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', 'b8ef81b3-6ea6-4184-ba4a-0bab1a7099ae', 'Copy Customer Sector'),
    ('8a470896-f782-44b0-8b13-f6942f721e30', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', 'adb2b3f1-7c10-480a-87fe-1dd851abadab', 'Unlock Customer Sector'),
    ('73d7f7eb-5af3-46ef-bb14-4dd4b4881e26', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '676870a6-c6bf-4ac1-b694-0ee9cdd0c12a', 'Save Customer Sector'),
    ('19f3ea1a-2fff-45b9-9d0c-45308ecafd35', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', '4eef859d-f5e0-46f6-9010-057bb376f3ad', 'Print Customer Sector'),
    ('70411fce-24a0-49e3-85dc-b8b3f8e82f80', 'd0f75ddc-d1f9-4f24-9451-d5c0c5181f70', 'b3f4aca5-29cd-48d0-b181-f7d5187f1582', 'Delete Customer Sector'),

    ('843a9c29-fa6a-4527-a3df-e385d5e52e71', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '567ad225-e53e-480e-ab24-c43e381a057a', 'List Country'),
    ('c2a62289-6dd0-4419-9bd4-3bd9821b9cc3', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '67c32584-ce56-4566-89ab-1a951bb97b0d', 'Export List Country'),
    ('7c2fe646-0f3e-4254-9c64-36b800eac25a', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', 'a51453c5-5d9b-402e-9a1d-ce13bcc4d75c', 'Import Bulk Country'),
    ('221b121f-920e-4211-a88f-d019a49df914', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '64c322e5-7dc5-453e-883f-7514ec552d64', 'View Country'),
    ('933e38b2-3f8c-45b8-8283-3bf6ff410e12', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', 'c74ba13b-cb12-4ab4-ac7d-b909b3932522', 'Detail Country'),
    ('25450f3c-8d05-4456-b96f-ede38322c006', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', 'a8f5ab4b-c376-4509-848b-9f8b6c727f85', 'Create Country'),
    ('41c1c2c3-8406-467d-b25e-73914d2a914a', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '95048f03-66f5-4ece-a099-5cc8e9ceb1e8', 'Update Country'),
    ('c1ee82c5-8b2f-47e6-904b-8c38e0c68d38', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '93d99445-d02b-46c5-9a3b-5103439c4b82', 'New Country'),
    ('722611df-f5c4-4e96-9810-314a291a8e0d', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '3607570e-4c4b-45cf-b696-9914dd0c0a01', 'Copy Country'),
    ('434f7b7f-526d-403d-8291-570f899fc1cf', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', 'eef7fe31-2303-424b-97d4-72b733fe8f08', 'Unlock Country'),
    ('2bcfa9b7-d8ba-4dad-8d53-cb6200539ab2', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '1a809def-611d-4ec8-b620-e2ea40865dbb', 'Save Country'),
    ('aaf8421c-0b0b-469d-9821-a6eed902c0fd', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', '846b9b65-a129-4f82-9efc-4f3704477a64', 'Print Country'),
    ('aa1a5614-f397-484c-971e-d59f604d4ba5', '1b3d1cb5-fb96-416c-ba96-c3d6ad178790', 'ce3ea218-0ded-4135-a878-f7b7fcd71036', 'Delete Country'),

    ('a26db79d-7c05-4d49-822a-6e37a0d7c9b2', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '6e0f06a1-8e3b-457c-8e46-3d915dcd3800', 'List Province'),
    ('5e2e4424-1854-491d-ac65-d3072a808b88', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'ae0ce75d-9d09-45c7-8b12-2b8f48c72dc3', 'Export List Province'),
    ('2eb0cc67-b2a2-4e11-8261-96d762848a33', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '94cd23c9-46ac-4dc1-a32e-49c83720ff4f', 'Import Bulk Province'),
    ('7eb83bf5-cf1a-455d-9f56-ecbbe11d8232', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '77916d87-5570-4f7d-b186-0c48c44d393d', 'View Province'),
    ('f59e0c8a-2c20-410f-8580-9a72a279b196', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '5aae24ad-58cd-46a6-acd0-80ddd3c0178f', 'Detail Province'),
    ('8080e301-0bf9-47c6-bced-4fc17896aa9e', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '604958bd-d861-4f70-8200-27a2fc797a38', 'Create Province'),
    ('f8df1e99-4d4e-4355-b0b6-4b4d9634fdf9', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'fddfed0e-5b20-4060-94ef-7b100a755d12', 'Update Province'),
    ('9c30946d-d0ed-4cf5-a9b2-485e74879b99', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'eac9490e-e174-47a6-b147-f9f37270d667', 'New Province'),
    ('8f25a3f3-2fb2-476b-8837-616753c0d4a4', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '4c29c2b8-aab2-4a44-b4c4-af9ecfbf7599', 'Copy Province'),
    ('e93a5570-6d38-43fa-95bb-fefe934c8fdf', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', '77a5ee9f-307b-4805-8892-b752637729c4', 'Unlock Province'),
    ('784694ee-7dfb-44be-a32a-ea2ce6ea16af', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'c1bf4776-871c-4acb-b88d-46df8f84fbb8', 'Save Province'),
    ('4558a5f0-75c2-4962-97ea-b1c7de7123f9', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'f6cf3e1e-6191-4baf-bf95-238e9eac6632', 'Print Province'),
    ('c2b14582-8d3a-4c4f-bdad-e8a1e7684183', '31aaec28-c8ec-4e43-9cdf-be295c3a1027', 'a95a0794-dbef-4c09-8fe3-04c09bda9339', 'Delete Province'),

    ('7fc7b0e6-5a24-4af9-b667-308b05e50cff', 'b7aacb96-6c72-464d-8706-4ef14acab100', '9447f06d-f376-43f2-a4a7-26ba1dc548d3', 'List District'),
    ('19cc3f99-8c07-4102-ba41-48b8e93a6baa', 'b7aacb96-6c72-464d-8706-4ef14acab100', '6d101e9b-e0ad-4ed7-806f-63915ab69eae', 'Export List District'),
    ('fac4225e-e00f-4187-8f1c-989a82b18e8e', 'b7aacb96-6c72-464d-8706-4ef14acab100', '5d35bdbd-1526-42f8-9efc-ec4612f8c8e4', 'Import Bulk District'),
    ('32b237f7-097b-4b31-a0c0-23c9f69b7b0a', 'b7aacb96-6c72-464d-8706-4ef14acab100', 'd0710dde-7177-44b8-b01c-59f57373d8eb', 'View District'),
    ('8e7a9383-41d5-4f9b-84c8-83557661d05b', 'b7aacb96-6c72-464d-8706-4ef14acab100', '0fa4aca1-1056-4276-9fdb-3ff8f7fb601e', 'Detail District'),
    ('1bf7fa28-ee67-4157-91e6-151db7147719', 'b7aacb96-6c72-464d-8706-4ef14acab100', '3ce9c036-7a8b-4348-8d72-d43a38e227be', 'Create District'),
    ('13f16971-b858-43de-97c7-7f8e3fd2bd52', 'b7aacb96-6c72-464d-8706-4ef14acab100', '39710341-3184-4520-a231-40b3cda1df3a', 'Update District'),
    ('4ca56b23-ed45-4319-bdc0-b17ccac13df5', 'b7aacb96-6c72-464d-8706-4ef14acab100', '127512d7-6784-4fde-afc5-c1e1d6ba48a7', 'New District'),
    ('b0fefa6e-6921-4432-bc56-a8f2889e1170', 'b7aacb96-6c72-464d-8706-4ef14acab100', '86a8898f-f833-4803-9678-692b33f0762c', 'Copy District'),
    ('d487831d-2c4b-4435-a6f1-23d36ac69813', 'b7aacb96-6c72-464d-8706-4ef14acab100', '3ed71c22-ff7f-4a3d-9265-682460d1adcc', 'Unlock District'),
    ('62e89099-4edc-45c0-a63b-ca15179f2022', 'b7aacb96-6c72-464d-8706-4ef14acab100', 'ecfd911b-92af-4f97-8ee4-7a271cb2edd6', 'Save District'),
    ('38bdb019-0d76-4071-8249-3e4b62210cc1', 'b7aacb96-6c72-464d-8706-4ef14acab100', '59ad4fe6-a04f-45b2-8025-8fdaa40112e0', 'Print District'),
    ('a932de02-1f6a-4615-82e3-f94bf848910c', 'b7aacb96-6c72-464d-8706-4ef14acab100', 'f08c02e6-ff47-411b-b302-53e61a45a42a', 'Delete District'),

    ('098fe4f7-85d5-42b9-a5ee-3644185f20d8', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '4e256e36-11e1-43c7-be41-8cac5ac84b81', 'List Commune'),
    ('9555b930-5338-4fd4-94c1-18b4df63d225', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', 'ed8c8dd7-8b47-4f55-886b-36d3395e006a', 'Export List Commune'),
    ('c1386218-f181-4863-a357-7d54dee93244', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '3c23ee3e-0f59-4137-918f-0e224854316e', 'Import Bulk Commune'),
    ('69f39a57-667d-498d-952a-0998acaa686c', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '93b5b049-53d0-4b02-8ef0-56c9c6ecbd36', 'View Commune'),
    ('280ca91c-0253-4cc6-a137-6384c41b1194', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', 'affb1fb4-4215-4ac2-a581-1abef0ee6a41', 'Detail Commune'),
    ('84e2f38f-b601-449c-beaf-bad65458087c', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '529098ac-83a1-45dd-812f-158b6706bed7', 'Create Commune'),
    ('015f1c92-81fb-46f5-86ce-234e8c6b6cd4', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '8114b690-7d26-419e-a2cf-58ed7d508620', 'Update Commune'),
    ('1f3a10d6-355c-46fa-a2ba-9f7615cbd866', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', 'aefdb043-db2a-4044-9f5c-454e43e5a0b7', 'New Commune'),
    ('5eb4e30a-3877-47b6-b360-d6144b0e294a', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '2883ef17-f71e-44e3-b06d-d2382e6b05bf', 'Copy Commune'),
    ('bf91952e-8901-4b7e-a99d-dbcdf13bf7dd', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', 'f9962403-5318-4c77-925d-d50a15fc4360', 'Unlock Commune'),
    ('c200b0af-baa9-4aa4-84c3-928e00cb5605', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '4db475bd-722d-493a-aed5-0a16bd977943', 'Save Commune'),
    ('4a27c435-c604-47df-b54f-83e0e7beb046', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '354d132d-c7bb-4eb1-ad1d-b910f08c25b7', 'Print Commune'),
    ('2ca25b2d-ddb8-4412-b2ea-e6b68dbd6ab6', '682bccc2-578e-45b5-b32a-4dfa9c057c5b', '28d39238-d0b9-4064-84de-e147970e3254', 'Delete Commune'),

    ('79933683-8e16-4827-9296-10f8cac0ceae', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '147cf491-0437-483d-b5e6-4d34f3bd49e0', 'List Village'),
    ('8784a325-22be-468c-869b-88473663ad02', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '79855ab6-bbe9-4f8a-896d-d9c5fc4b0e36', 'Export List Village'),
    ('5ed35dd2-3cc3-4ce6-996d-3b5e60ca88e9', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', 'c91de203-35f0-483c-ad15-7a79da4fe08d', 'Import Bulk Village'),
    ('081ae8ac-400e-4c9d-a930-1abe7f601571', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', 'e51c8fe5-634a-405d-9fc8-fcd0058a9770', 'View Village'),
    ('6180f6b8-fbe3-4d7f-9522-b39e1d4cf258', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '522e2912-4aab-488a-8387-4c856668c193', 'Detail Village'),
    ('caeb4860-ac31-4336-bf4d-05b2a28cd05e', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '3793907a-e635-41c9-a32a-0b9c4691bfeb', 'Create Village'),
    ('2fe71eab-b627-4f08-be13-01e80d1396ec', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '74ebc809-27cb-4c97-b612-0752d2ebf755', 'Update Village'),
    ('3814dec2-b0ff-4cd8-8a73-ba942fc32051', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '0e948b8a-f788-4311-a62d-4041434273d9', 'New Village'),
    ('1e7518b3-5ccd-4125-8925-dd7558dd8e7b', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', 'bd641538-4b9e-4192-b668-dbb1e0b8b903', 'Copy Village'),
    ('f64cee3f-b2da-4d53-85b7-e92f59397aa4', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '9bce4227-4b54-4922-b4bd-5d1f59fb2382', 'Unlock Village'),
    ('b4a1d1ba-ec42-45c9-b174-40ec3b424872', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', 'b5cc3da7-f023-4ccc-aba9-85ad06103d3c', 'Save Village'),
    ('18655b0b-77dc-484d-a765-02eae6bd921f', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '5539e575-1aa3-4ec9-b915-f679686e52eb', 'Print Village'),
    ('4646ca9e-ce38-4a6a-b9f2-257f5d13aca0', '9d3a2dd9-d24e-45fb-9465-29e3032d141b', '22de7d90-caf7-423d-9c70-2de80140c962', 'Delete Village');


DROP TABLE IF EXISTS company_system_authority_title;
CREATE TABLE IF NOT EXISTS company_system_authority_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_authority_id uuid,
    authority_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_system_authority_id, lang)
);


DROP TABLE IF EXISTS company_system_authority_platform;
CREATE TABLE IF NOT EXISTS company_system_authority_platform(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_authority_platform_id uuid primary key DEFAULT gen_random_uuid(),

    company_system_authority_id uuid,
    authority_platform_code varchar(36),

    icon varchar(120),
    icon_url varchar(800),

    image varchar(120),
    image_url varchar(800),

    title varchar(120),

    subtitle varchar(120),

    function_code varchar(250),
    function_data text,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_system_authority_platform (company_system_authority_platform_id, company_system_authority_id, authority_platform_code, icon, icon_url, image, image_url, title, subtitle, function_code, function_data) VALUES
    ('aa4b520a-e4d4-4605-8555-f8e2d0f552b5', '52f0eb1e-4350-45a3-9ebe-057284db4cf2', 'WEB', null, null, null, null, 'Administrator', null, null, null),
    ('a7e6f373-82c0-4978-b0b0-7d2cdc870738', 'ea6c97cc-1399-4a9f-8d3f-d487ee2e0c27', 'WEB', null, null, null, null, 'Miscellaneous', null, null, null),

    ('ec549b7f-d87c-48c8-b69c-53444a743cea', '8ae4be38-c945-4a2d-b5f0-2c0c806488f1', 'WEB', null, null, null, null, 'Branch', null, null, null),
    ('3a8f2535-8b2f-43e2-9945-c457cbb3b9f3', '8ae4be38-c945-4a2d-b5f0-2c0c806488f1', 'ANDROID', null, null, null, null, 'Branch', null, '120001', '{"submit": "1", "data": {"id": 1}}'),
    ('9b4970ca-58f7-449d-b30b-8d05b9ca4ce8', '8ae4be38-c945-4a2d-b5f0-2c0c806488f1', 'IOS', null, null, null, null, 'Branch', null, '120001', '{"submit": "1"}'),
    ('301b8234-da17-40c3-aacb-35486cdf35ab', '7cb4ddc6-34cd-476e-bcbf-793c0a7cbab4', 'WEB', null, null, null, null, 'System Authority', null, null, null),
    ('062dd053-1c20-4469-b1ea-57250230d4c2', '63f8059f-90a4-4a33-8ad2-f8a58804db55', 'WEB', null, null, null, null, 'System Role', null, null, null),
    ('b4d582ef-fc8e-4250-890c-4d4c2923a5c1', 'e1a1662f-cf8b-4ac7-924d-6684d396d341', 'WEB', null, null, null, null, 'Mobile Role', null, null, null),
    ('20791da1-3e3c-4774-9253-300dd5383814', '2722cbd5-8c99-46ca-8ac2-6d6d3f7d71a7', 'WEB', null, null, null, null, 'User', null, null, null),
    ('04592c37-01a9-4ac8-92bf-899f1536a136', '4fa1ca2f-1cee-4d7f-b11e-ad76cb593ce3', 'WEB', null, null, null, null, 'Commodity Type', null, null, null),
    ('5b16e9fa-b0c7-4014-a4a9-abf5ff40a1a5', 'f08d1544-d312-4bd8-a653-61775a9b8e3b', 'WEB', null, null, null, null, 'Commodity', null, null, null),
    ('0b4ba3db-a3ee-4c91-a1fd-104cf0efd359', '8f8f5ead-904a-4869-9f60-c1b1f87ba1c4', 'WEB', null, null, null, null, 'Check Point', null, null, null),
    ('f7882bbc-5a42-49b9-87e8-ad0468a74b1f', 'fe67caf1-cccb-490e-a90d-9679765d91c4', 'WEB', null, null, null, null, 'Sales Group', null, null, null),
    ('6532eee9-4fa1-42d1-8ffd-c1e0345dcfdd', 'aa5f6fac-52aa-4663-85f3-69c230fc4f08', 'WEB', null, null, null, null, 'Sales Team', null, null, null),
    ('fc4aeb53-a3d2-4c44-a6a1-39f871f39f62', 'dd095717-7af6-4574-b27e-ace37ad10117', 'WEB', null, null, null, null, 'Sales Team Member', null, null, null),
    ('91abdeeb-68cb-47e2-b4b8-67034660a8c2', '859a32b1-3da9-4bb0-bca5-5b50e1273851', 'WEB', null, null, null, null, 'Salesman', null, null, null);


DROP TABLE IF EXISTS company_system_authority_platform_title;
CREATE TABLE IF NOT EXISTS company_system_authority_platform_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_authority_platform_id uuid,
    title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_system_authority_platform_id, lang)
);

DROP TABLE IF EXISTS company_system_authority_platform_subtitle;
CREATE TABLE IF NOT EXISTS company_system_authority_platform_subtitle(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_authority_platform_id uuid,
    subtitle varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_system_authority_platform_id, lang)
);

DROP TABLE IF EXISTS company_system_role;
CREATE TABLE IF NOT EXISTS company_system_role(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_role_id uuid primary key DEFAULT gen_random_uuid(),
    company_system_role_code varchar(36) unique,

    company_id uuid,

    role_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_system_role (company_system_role_id, company_system_role_code, company_id, role_title) VALUES
                                                                                                                ('28e42b39-b375-4269-869f-4dd68c36ee2a', 'SUPUSR', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'Supper User'),
                                                                                                                ('7b072478-60a6-42a3-b24b-6c36d9a28b91', 'ADMIN', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'Admin');

DROP TABLE IF EXISTS company_system_role_title;
CREATE TABLE IF NOT EXISTS company_system_role_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_role_id uuid,
    role_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_system_role_id, lang)
);

DROP TABLE IF EXISTS company_system_role_authority;
CREATE TABLE IF NOT EXISTS company_system_role_authority(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_system_role_authority_id uuid primary key DEFAULT gen_random_uuid(),

    company_system_role_id uuid,
    company_system_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_system_role_authority (company_system_role_authority_id, company_system_role_id, company_system_authority_id) VALUES
('b6cc14b4-3f80-4ae3-9cf4-4d53a83bd3f2', '28e42b39-b375-4269-869f-4dd68c36ee2a', '202d16a5-e903-46a6-82a4-badb06e08e81'),
('fa696808-bcde-41b8-a6df-0de2c90213bd', '28e42b39-b375-4269-869f-4dd68c36ee2a', '52f0eb1e-4350-45a3-9ebe-057284db4cf2'),

('6362e572-9ab0-448a-95fa-6bc0dd23942d', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'd984ca8e-7cf0-4e07-bdbe-a35845df5c38'),
('9c252d3c-5659-495a-88d0-6bbc703afdc7', '28e42b39-b375-4269-869f-4dd68c36ee2a', '2fdd8790-62d4-41b1-a772-8e28478ac27e'),
('c877fa56-4616-4cfe-9e3d-151ec0406e76', '28e42b39-b375-4269-869f-4dd68c36ee2a', '31481db2-42f8-48af-93d0-d26fdca4eb3a'),
('47609c75-447a-43a2-8596-221b94624c55', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'a5d7e0af-4133-41be-a7e0-a7d40454d9dc'),
('3a1af2dc-3e4a-4e12-a40c-063cf24613b0', '28e42b39-b375-4269-869f-4dd68c36ee2a', '01ad0df5-c53f-4d94-8666-ebec45e38987'),
('7f70363b-7250-44b9-9c64-6416e506098d', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'ee3ced31-b020-4ddd-917f-5c7535880a7d'),
('0b5c698f-acea-4ae7-8459-6090e18a9f9d', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'dcbb920d-1787-4f67-bcfa-6006ed4a53ee'),
('dffa4d9d-42cd-4bf4-ab73-33d911fff2c9', '28e42b39-b375-4269-869f-4dd68c36ee2a', '5a946d98-8a39-4372-8f19-9dcf86293f99'),
('2416150f-6522-48c9-bf95-51eb809b326d', '28e42b39-b375-4269-869f-4dd68c36ee2a', '30a96f3d-51e8-421d-878a-6b44e25118c5'),
('6e9126f7-3364-4a4d-8c9d-92f9fca3de02', '28e42b39-b375-4269-869f-4dd68c36ee2a', '8a4e2be1-bad4-4179-ab9f-5fbf7fccc052'),
('82137d8a-3c0a-4fcc-b107-0afd4fc43032', '28e42b39-b375-4269-869f-4dd68c36ee2a', '5ff596a3-7d22-4156-a0dc-50b8bb3d5ddc'),
('0f3e3439-d76f-465e-9ff3-93b22419a102', '28e42b39-b375-4269-869f-4dd68c36ee2a', '95248223-9dc0-461b-8bdb-7ffad7cc1697'),
('a5997241-01a6-443b-822f-ccaf46dde3e7', '28e42b39-b375-4269-869f-4dd68c36ee2a', '4445e441-a88d-4ff5-95e5-7d1f4e6b3019'),

('7a0c46d9-76ce-4ee5-9d51-9ee559ce62f2', '28e42b39-b375-4269-869f-4dd68c36ee2a', '45c78c6f-d010-4f91-bb67-3e5a606446b7'),
('8629abad-73f4-46b0-8bf6-f565dd09ffff', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'b6c9e59e-baaf-4383-a828-32cf03545897'),
('f1248fd1-19b7-4a0d-a08b-c34f69491ec7', '28e42b39-b375-4269-869f-4dd68c36ee2a', '34865366-60f0-45ec-b7cd-ff2e122997df'),
('383fa87a-e070-4296-97ad-b7d9e5b5f37a', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e3ac4f60-97a6-4f76-baec-b763a7e314e4'),
('33513f90-1f7d-4cd7-bfa9-6cf9b2dff404', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e9f35caf-a793-40a4-af38-481732ed55ab'),
('971c4dd9-e5a5-4c6f-afb0-6896a21d24bc', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e7fa63ab-8e00-46a1-9d7f-0a7e6171942e'),
('5ba3f2b5-a23c-4f81-b17f-a54c5333528b', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'a3875286-a1e6-486f-8e10-77f35af8c24f'),
('562fbc0e-6789-4fb5-810e-6a788f44d776', '28e42b39-b375-4269-869f-4dd68c36ee2a', '7a77809d-24c7-4d14-a61a-13830e5c2de5'),
('35d2e7b4-9781-419a-a8f4-2003b117edb6', '28e42b39-b375-4269-869f-4dd68c36ee2a', '45886e2b-e1ea-4fa5-b7e4-ce954a1dd02c'),
('a3536ee1-c390-4779-8c76-188329f59053', '28e42b39-b375-4269-869f-4dd68c36ee2a', '55416f5c-6331-4216-8cc8-8360a80ef4d4'),
('548be803-83fb-4cdb-8b9c-5e43d1f0a5ab', '28e42b39-b375-4269-869f-4dd68c36ee2a', '59c4cd56-3ef6-4fce-b6c0-2ba32a3e7510'),
('c5c6af86-ad6f-4733-a98e-86e1bb7e5d6f', '28e42b39-b375-4269-869f-4dd68c36ee2a', '908dbe55-5101-4308-aa88-53b613923243'),
('d8acef3f-6358-4768-9bc9-5ac31c5346a7', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'c58929e7-53ff-46fd-9616-3e79d775898b'),

('5cdaa550-1d83-466a-935b-91fd788f2ec8', '28e42b39-b375-4269-869f-4dd68c36ee2a', '8ae4be38-c945-4a2d-b5f0-2c0c806488f1'),
('4abf49e8-f4f0-42e4-a70d-8a58bdcbe1a6', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'c0069e74-32f7-4a54-9e2f-3c36f752cdc8'),
('b561133f-2bbf-4318-b5e0-a1b80519755a', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'bb3c573e-81ee-43f5-bb8f-681f77a8b8fb'),
('004d97c0-f90a-4fdf-943e-d10a111a1f35', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'b52fae29-06ca-4a4e-9fe1-a88640d150a5'),
('b44c5cef-4d89-40d4-b340-98aaee8ad389', '28e42b39-b375-4269-869f-4dd68c36ee2a', '12972885-3859-4b3b-a673-0ba1fb38fa1a'),
('531226ef-c39b-446e-8d61-3ea1a10376ea', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e2d51f9f-d050-41b7-bfc2-0abe5fd786b4'),
('4b41bce1-8119-4c9f-b722-53870420a44f', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'f83c9fa7-768a-48b7-948d-955411183335'),
('8a94c06b-c776-447b-9691-1e5dec50a3f0', '28e42b39-b375-4269-869f-4dd68c36ee2a', '83f60504-0194-446e-8a7c-fa93775d56b1'),
('93135cbe-866c-4eb3-a540-2deb9505e1eb', '28e42b39-b375-4269-869f-4dd68c36ee2a', '3187504c-7089-42f6-b865-6be6d7aa4144'),
('f89ec777-b9ce-482a-9afe-4fc12759ff40', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'eab599aa-4bdc-44ad-85c8-4e0f5cc6fd7f'),
('c404eec3-f42a-4c8d-b3eb-8fe72fe7ee5a', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'ab58b92d-e675-4c60-ae2e-9219d954f3df'),
('450691d3-6f7f-41fe-b860-9bbee7885c6c', '28e42b39-b375-4269-869f-4dd68c36ee2a', '3e37a743-1f75-4579-95e6-e892351d300a'),
('4fb7c0e6-1b4f-4fec-acb5-c919a99be01c', '28e42b39-b375-4269-869f-4dd68c36ee2a', '5ff6f5c6-fd2e-4888-ad99-13ac6468099f'),

('1e4d8088-cd17-461a-aad0-6746b2dc7a1c', '28e42b39-b375-4269-869f-4dd68c36ee2a', '2722cbd5-8c99-46ca-8ac2-6d6d3f7d71a7'),
('0f7c0abe-51ba-428e-b996-1f9280c15ee7', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'eb7ce6f6-f66e-4cf5-84ce-779305069bd9'),
('e9a0dc3a-fced-4276-a7f8-9a181e035b05', '28e42b39-b375-4269-869f-4dd68c36ee2a', '83c33c28-9a72-4f00-bbbd-450fa645500a'),
('bc6bb057-56d7-4d94-a045-9bad10399e45', '28e42b39-b375-4269-869f-4dd68c36ee2a', '023bd783-5146-4616-8a45-8e9dd8c6850c'),
('8adfd305-531b-40ff-99d9-50877d14bff3', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'b50b8531-09ec-4fcc-be58-38c82f8ff6c2'),
('bedc1ae8-6644-477f-bd01-93c3724abb91', '28e42b39-b375-4269-869f-4dd68c36ee2a', '466438b5-b6e9-41bd-9a4a-50598653bb28'),
('ddd571bc-73e1-4e60-bd2e-99c8843b3aff', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'fa519b56-d949-4b7b-a995-0d705c98c3db'),
('61f654a4-dab3-46e8-9560-9a92d19bf21f', '28e42b39-b375-4269-869f-4dd68c36ee2a', '019697da-d8d1-40dd-9d65-3585155323cf'),
('e95c3806-136b-4104-a0ff-bf1886f1d508', '28e42b39-b375-4269-869f-4dd68c36ee2a', '76293c50-796e-4690-b9fb-88ff32890de6'),
('41af6893-3e4d-46c1-b089-801b5003784f', '28e42b39-b375-4269-869f-4dd68c36ee2a', '0a27d273-9c0a-42c0-9065-2b5b5b6e6703'),
('46c577af-6a3c-4e13-b1fd-2214ec17c6e5', '28e42b39-b375-4269-869f-4dd68c36ee2a', '86d0b7e6-04f2-4199-97cd-94a5ba4357d2'),
('e2cf044b-0da3-4a7f-9936-85c9c1df9b26', '28e42b39-b375-4269-869f-4dd68c36ee2a', '78966433-608d-4317-9d36-da8766bf43db'),
('a9a9b3a7-7afa-4c87-8aaf-100f158f078a', '28e42b39-b375-4269-869f-4dd68c36ee2a', '427aa398-dfe7-4255-bb51-2e3aa8355b7f'),

('83feebb5-84f5-43ef-8029-276511904a3a', '28e42b39-b375-4269-869f-4dd68c36ee2a', '63f8059f-90a4-4a33-8ad2-f8a58804db55'),
('59042f5f-2593-4364-86e7-53b77210ecda', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'd99911d8-62fb-493e-a47b-c0c6e3a22979'),
('83a3f89d-762d-4f16-98e0-b7f2d3f97559', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'b43dbfe3-f0f4-48f0-a702-b9489a321de0'),
('62d42c71-82a1-4492-a04e-7073da4290d5', '28e42b39-b375-4269-869f-4dd68c36ee2a', '717cc602-49ce-458d-9db6-d0ff3468e4d0'),
('df37f820-7d86-4a7e-a340-2c1bee996581', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'd920d7dd-51f9-467d-b508-fbcd1afef73d'),
('2945bd14-02b0-404d-8718-8088c8e52e9e', '28e42b39-b375-4269-869f-4dd68c36ee2a', '8dac9233-b221-49ed-aa0c-c877ae5b1dc3'),
('65276e43-06ae-40aa-b8ab-8dcd71a742e0', '28e42b39-b375-4269-869f-4dd68c36ee2a', '5e479d92-05a8-4750-80c3-71abdfc93d84'),
('569275d3-bf7f-4eb5-883a-9d24dad55ef5', '28e42b39-b375-4269-869f-4dd68c36ee2a', '00ede8db-6338-45f0-9ad7-463585d42c23'),
('1cf27a48-75da-4166-a8bc-0462fc8bceb7', '28e42b39-b375-4269-869f-4dd68c36ee2a', '1678de23-47a0-44eb-a8d0-f3b40fe4d647'),
('4eb0c81b-c231-473a-822c-02878a8fe983', '28e42b39-b375-4269-869f-4dd68c36ee2a', '31a1f9e3-a3e1-4313-88fe-13f22da25477'),
('ac08f9ef-842c-472b-9191-92b6e54c8793', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e6689fe7-5694-4ae5-b131-ff746cf89cc2'),
('88672a20-5a08-45c0-871b-00076e81e7d0', '28e42b39-b375-4269-869f-4dd68c36ee2a', '7957f366-3e4d-4432-94af-a2e4eaf994b6'),
('7835bfa1-806e-45cc-99a9-9524cac842c0', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'c60df8a8-cb01-4a60-95c8-0010a056b0ef'),

('192213c6-9db6-4735-855a-6d718ef9ebfe', '28e42b39-b375-4269-869f-4dd68c36ee2a', '5ac5d974-3456-4b87-a87a-8a34211b93ab'),
('3e193766-b0d4-4e55-a877-82268bdabc72', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'b0a8828a-f58e-4564-b05f-3b9392c47b8e'),
('f5488cd0-b32b-4e6d-a53c-7f9917762f9f', '28e42b39-b375-4269-869f-4dd68c36ee2a', '742b56f9-6c4e-4060-be61-0c48f3fc8275'),
('2d53b909-e15e-4783-9759-f1698a0ba706', '28e42b39-b375-4269-869f-4dd68c36ee2a', '65f7d3a3-c4da-49c8-9a2a-1b06b9a67b4d'),
('eccfa3be-6c27-4df9-9eca-8b0a11f21aac', '28e42b39-b375-4269-869f-4dd68c36ee2a', '6d14db18-9b46-4c87-b33b-8d1fb4ce405f'),
('642c51d6-2bd7-4416-b322-49e2332de87b', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'c10c4502-045d-4680-a0e4-7a74520d94ec'),
('50c92589-12b7-4ef6-a9e7-fe7be6169485', '28e42b39-b375-4269-869f-4dd68c36ee2a', '66598ba7-3473-4591-9c23-86e639924c0c'),
('f1726f8b-a569-4c3b-a778-cf06e615c2ae', '28e42b39-b375-4269-869f-4dd68c36ee2a', '5827040a-6237-49d6-b473-f33e1e968e55'),
('cfdd9900-1660-430a-aae3-78e035f51da4', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'cf7805e5-b069-4140-9c52-6e5109d4cecb'),
('f2f56130-6513-4f7d-9b48-d6391446a3e4', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'db86935a-6120-4823-8df6-dbe380c19c9a'),
('a4c81fc5-0243-4a41-a565-48e4cbecc753', '28e42b39-b375-4269-869f-4dd68c36ee2a', '44e76464-bf5e-41c7-ac8c-8a8ab26e448d'),
('a20c8012-38a0-410d-9cc3-5e0eb0f07b6e', '28e42b39-b375-4269-869f-4dd68c36ee2a', '4e51973a-86c9-4c05-8341-135cdf208c31'),
('25a1c866-6cfb-46e5-b811-57f20eee9e5b', '28e42b39-b375-4269-869f-4dd68c36ee2a', '4e3b6914-25c6-4155-bde4-aba4793b68d5'),

('74725aa6-b181-41ed-85eb-57ba763a02e2', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e1a1662f-cf8b-4ac7-924d-6684d396d341'),
('0e1e7bd2-ddaa-4127-b17d-b10bc0150616', '28e42b39-b375-4269-869f-4dd68c36ee2a', '97d34455-e91d-43aa-ae1f-f72077c56825'),
('14991e6d-b484-4cb7-bf13-2e6dc89d41fc', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'f3858784-2999-43ad-8405-0d6d330cd298'),
('39a1b025-99de-4a32-8b5b-67389a2fabda', '28e42b39-b375-4269-869f-4dd68c36ee2a', '257d4f0e-9309-4ab1-97ea-4c25f17da146'),
('b00dedfa-8102-42fa-ac41-4fac4dd2862c', '28e42b39-b375-4269-869f-4dd68c36ee2a', 'e25cb596-f0b4-4e88-9adb-d615fad6c355'),
('2f65f4ea-3603-41c2-a8fc-45e73ef20af5', '28e42b39-b375-4269-869f-4dd68c36ee2a', '14e9a6a0-240c-456d-9494-54988f0b65c5'),
('ba73d820-2d4e-4162-9327-06aafdef43ea', '28e42b39-b375-4269-869f-4dd68c36ee2a', '0293a14a-ed57-47d1-869a-346a85ed235a'),
('868bc1b6-829d-49cc-b230-d895c2efea73', '28e42b39-b375-4269-869f-4dd68c36ee2a', '99e5df7f-9b92-4a54-a2bc-0d4fcee5f307'),
('96e1e9c3-52c0-4973-9d9a-cdccce6059c0', '28e42b39-b375-4269-869f-4dd68c36ee2a', '7bc021a9-ce98-4b02-9712-8083115ad7fe'),
('90536cfe-f6aa-40be-9f87-60285b19584c', '28e42b39-b375-4269-869f-4dd68c36ee2a', '0fd891ee-28c0-4453-b088-539fd1cee3e8'),
('83c23794-53ae-408f-8d4c-f213bd967b90', '28e42b39-b375-4269-869f-4dd68c36ee2a', '6ce2c478-04ad-422a-9d1d-5c8e59382ed6'),
('55d4456e-de96-46c4-8008-fd94d72c4fd7', '28e42b39-b375-4269-869f-4dd68c36ee2a', '0032ef2b-7673-47ff-845b-919bdc4ea321'),
('73d3c982-91eb-4511-a100-3ae52cabd7ee', '28e42b39-b375-4269-869f-4dd68c36ee2a', '3e25e84b-7643-4146-85bc-d74d21df5253');


DROP TABLE IF EXISTS company_mobile_role;
CREATE TABLE IF NOT EXISTS company_mobile_role(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    company_mobile_role_id uuid primary key DEFAULT gen_random_uuid(),
    company_mobile_role_code varchar(36) unique,

    company_id uuid,

    role_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_mobile_role (company_mobile_role_id, company_mobile_role_code, company_id, role_title) VALUES
    ('47a2bff9-d3f1-45a9-a9e5-a359b528df92', 'M001', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'Mobile Role 1');

DROP TABLE IF EXISTS company_mobile_role_title;
CREATE TABLE IF NOT EXISTS company_mobile_role_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_mobile_role_id uuid,
    role_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_mobile_role_id, lang)
);

DROP TABLE IF EXISTS company_mobile_role_section;
CREATE TABLE IF NOT EXISTS company_mobile_role_section(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_mobile_role_section_id uuid primary key DEFAULT gen_random_uuid(),
    company_mobile_role_section_code varchar(36) unique,

    company_mobile_role_id uuid,

    section_title varchar(120),
    section_order integer,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );
INSERT INTO company_mobile_role_section (company_mobile_role_section_id, company_mobile_role_section_code, company_mobile_role_id, section_title, section_order) VALUES
    ('785cc024-7c20-416b-bc5a-a51423a60e02', 'MS001', '47a2bff9-d3f1-45a9-a9e5-a359b528df92', 'Section 1', 1);

DROP TABLE IF EXISTS company_mobile_role_section_title;
CREATE TABLE IF NOT EXISTS company_mobile_role_section_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_mobile_role_section_id uuid,
    section_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_mobile_role_section_id, lang)
);

DROP TABLE IF EXISTS company_mobile_role_authority;
CREATE TABLE IF NOT EXISTS company_mobile_role_authority(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_mobile_role_authority_id uuid primary key DEFAULT gen_random_uuid(),

    company_mobile_role_section_id uuid,
    company_system_authority_id uuid,
    main_authority_status integer,
    authority_order integer,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );
INSERT INTO company_mobile_role_authority (company_mobile_role_authority_id, company_mobile_role_section_id, company_system_authority_id, main_authority_status, authority_order) VALUES
    ('6559b426-cfe6-48ba-8e15-8a97834d0672', '785cc024-7c20-416b-bc5a-a51423a60e02', '8ae4be38-c945-4a2d-b5f0-2c0c806488f1', 0, 1);


DROP TABLE IF EXISTS company_customer_system_module;
CREATE TABLE IF NOT EXISTS company_customer_system_module(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_module_id uuid primary key DEFAULT gen_random_uuid(),

    company_id uuid,
    system_module_id uuid,

    module_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO company_customer_system_module (company_customer_system_module_id, company_id, system_module_id, module_title) VALUES
('a99463f8-3567-4071-b313-db4a46da3805', 'b45c8a43-b247-4c75-b352-c6b4337186be', '7535b8b4-b445-41aa-a159-0876b56e8ebf', 'Shipment Module');

DROP TABLE IF EXISTS company_customer_system_module_title;
CREATE TABLE IF NOT EXISTS company_customer_system_module_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_module_id uuid,
    module_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_system_module_id, lang)
);

DROP TABLE IF EXISTS company_customer_system_authority;
CREATE TABLE IF NOT EXISTS company_customer_system_authority(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_authority_id uuid primary key DEFAULT gen_random_uuid(),

    company_customer_system_module_id uuid,
    system_authority_id uuid,

    authority_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );
INSERT INTO company_customer_system_authority (company_customer_system_authority_id, company_customer_system_module_id, system_authority_id, authority_title) VALUES
('140acb24-502c-4df3-a8b1-df3fd5aadee1', 'a99463f8-3567-4071-b313-db4a46da3805', '183247e3-705a-48de-a748-116996be7b5a', 'List Shipment'),
('85996ff5-285c-449c-84b8-c17e31b4ad67', 'a99463f8-3567-4071-b313-db4a46da3805', 'b2328e95-6ae4-40fb-becf-7a56bdb3ba74', 'Export List Shipment'),
('9be45e23-c8a1-4883-b4da-a2d2c5eaa957', 'a99463f8-3567-4071-b313-db4a46da3805', '8f5c7cdf-b7d5-48bc-a4e9-f026cb4e4149', 'Import Bulk Shipment'),
('1ce945e6-cdd1-4f53-9cc1-592cf0d54fa5', 'a99463f8-3567-4071-b313-db4a46da3805', '4b56fde2-4e18-4876-94d1-a3f9d0dfd490', 'View Shipment'),
('add9eec3-20ff-4cb5-829b-b9d8e37b847a', 'a99463f8-3567-4071-b313-db4a46da3805', '61121168-8e4f-4c2f-bc50-d3d6bd636d59', 'Detail Shipment'),
('dd21eba5-c44c-4cc0-bb03-a4be7a25a177', 'a99463f8-3567-4071-b313-db4a46da3805', '7fb40d33-bbb5-48dd-a7f1-af933e23fd00', 'Create Shipment'),
('a20912d2-5d19-444e-ab0a-ee8504ab3b59', 'a99463f8-3567-4071-b313-db4a46da3805', '316fe6de-9771-4be3-8bf0-8c5214728c81', 'Update Shipment'),
('b4f19606-2df9-4939-8fbc-c03eb3d95002', 'a99463f8-3567-4071-b313-db4a46da3805', 'fb6a021a-c7ef-4fbd-8fd4-542fe19dbb22', 'New Shipment'),
('c70a7996-635a-4f18-b40e-550e73ab5906', 'a99463f8-3567-4071-b313-db4a46da3805', '34d2e10e-098c-4652-8181-6c2faa43ef65', 'Copy Shipment'),
('8692a2e3-86d2-4396-8973-c62603f545fa', 'a99463f8-3567-4071-b313-db4a46da3805', '84ae3cf4-0328-4641-84f4-7bc5666208de', 'Unlock Shipment'),
('96b56bdd-9191-4d41-87e7-0970d44bdafa', 'a99463f8-3567-4071-b313-db4a46da3805', '7d489ae3-43e2-4b25-9554-c140212e77c6', 'Save Shipment'),
('373dd559-514b-4436-b7fe-e4dce548a00a', 'a99463f8-3567-4071-b313-db4a46da3805', 'ad331bc8-c137-4f96-b506-891d3e68aa87', 'Print Shipment'),
('bf04755e-dcd5-4476-bbef-22c061d33823', 'a99463f8-3567-4071-b313-db4a46da3805', '8496adc1-f08e-48e6-b3a7-75da6600e898', 'Delete Shipment');

DROP TABLE IF EXISTS company_customer_system_authority_title;
CREATE TABLE IF NOT EXISTS company_customer_system_authority_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_authority_id uuid,
    authority_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_system_authority_id, lang)
);

DROP TABLE IF EXISTS company_customer_system_authority_platform;
CREATE TABLE IF NOT EXISTS company_customer_system_authority_platform(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_authority_platform_id uuid primary key DEFAULT gen_random_uuid(),

    company_customer_system_authority_id uuid,
    authority_platform_code varchar(36),

    icon varchar(120),
    icon_url varchar(800),

    image varchar(120),
    image_url varchar(800),

    title varchar(120),

    subtitle varchar(120),

    function_code varchar(250),
    function_data text,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_customer_system_authority_platform (company_customer_system_authority_platform_id, company_customer_system_authority_id, authority_platform_code, icon, icon_url, image, image_url, title, subtitle, function_code, function_data) VALUES
    ('3d1eff41-b1df-4e20-9ebf-a17c1416be34', '140acb24-502c-4df3-a8b1-df3fd5aadee1', 'WEB', null, null, null, null, 'Shipment', null, null, null),
    ('8f5f93cb-d7ed-40e4-83e6-1a4c458eb024', '140acb24-502c-4df3-a8b1-df3fd5aadee1', 'ANDROID', null, null, null, null, 'Shipment', null, '120001', '{"submit": "1", "data": {"id": 1}}'),
    ('392f9cf7-9412-472e-85c3-faae2992c3b9', '140acb24-502c-4df3-a8b1-df3fd5aadee1', 'IOS', null, null, null, null, 'Shipment', null, '120001', '{"submit": "1"}');


DROP TABLE IF EXISTS company_customer_system_authority_platform_title;
CREATE TABLE IF NOT EXISTS company_customer_system_authority_platform_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_authority_platform_id uuid,
    title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_system_authority_platform_id, lang)
);

DROP TABLE IF EXISTS company_customer_system_authority_platform_subtitle;
CREATE TABLE IF NOT EXISTS company_customer_system_authority_platform_subtitle(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_authority_platform_id uuid,
    subtitle varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_system_authority_platform_id, lang)
);

DROP TABLE IF EXISTS company_customer_system_role;
CREATE TABLE IF NOT EXISTS company_customer_system_role(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_role_id uuid primary key DEFAULT gen_random_uuid(),
    company_customer_system_role_code varchar(36) unique,

    company_id uuid,

    role_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_customer_system_role (company_customer_system_role_id, company_customer_system_role_code, company_id, role_title) VALUES
('9d25a3b7-b307-426a-995c-c62d862fcbb2', 'GENERAL', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'General');

DROP TABLE IF EXISTS company_customer_system_role_title;
CREATE TABLE IF NOT EXISTS company_customer_system_role_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_role_id uuid,
    role_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_system_role_id, lang)
);

DROP TABLE IF EXISTS company_customer_system_role_authority;
CREATE TABLE IF NOT EXISTS company_customer_system_role_authority(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_system_role_authority_id uuid primary key DEFAULT gen_random_uuid(),

    company_customer_system_role_id uuid,
    company_customer_system_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_customer_system_role_authority (company_customer_system_role_authority_id, company_customer_system_role_id, company_customer_system_authority_id) VALUES
('ef3396bb-06bf-4a7b-9b94-5b8d30d6d6eb', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '140acb24-502c-4df3-a8b1-df3fd5aadee1'),
('7f0be793-e4a8-45f8-9029-10aade100e70', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '85996ff5-285c-449c-84b8-c17e31b4ad67'),
('6ce5d090-3c0c-445f-9095-81cef33054bc', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '9be45e23-c8a1-4883-b4da-a2d2c5eaa957'),
('48048306-c780-4c1e-949c-b2087732756d', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '1ce945e6-cdd1-4f53-9cc1-592cf0d54fa5'),
('e4539b36-be6b-4305-af91-b482d1b133ff', '9d25a3b7-b307-426a-995c-c62d862fcbb2', 'add9eec3-20ff-4cb5-829b-b9d8e37b847a'),
('252e9284-bf4a-4db3-a094-5b4cb1477d27', '9d25a3b7-b307-426a-995c-c62d862fcbb2', 'dd21eba5-c44c-4cc0-bb03-a4be7a25a177'),
('652b005e-9058-4d64-a6cb-8d5e519618a3', '9d25a3b7-b307-426a-995c-c62d862fcbb2', 'a20912d2-5d19-444e-ab0a-ee8504ab3b59'),
('b084d432-4305-4a5e-8e6b-ad42edcaf70f', '9d25a3b7-b307-426a-995c-c62d862fcbb2', 'b4f19606-2df9-4939-8fbc-c03eb3d95002'),
('6f45374d-f310-43fe-86e4-41e0950b211e', '9d25a3b7-b307-426a-995c-c62d862fcbb2', 'c70a7996-635a-4f18-b40e-550e73ab5906'),
('1f061316-39f2-45bb-9c68-aa23558d9b77', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '8692a2e3-86d2-4396-8973-c62603f545fa'),
('4f78c9d6-daee-4781-a6b2-922cd0ac5ec0', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '96b56bdd-9191-4d41-87e7-0970d44bdafa'),
('e848920c-e85d-490a-a804-59ea259385ed', '9d25a3b7-b307-426a-995c-c62d862fcbb2', '373dd559-514b-4436-b7fe-e4dce548a00a'),
('eca7777b-5afc-4814-94b1-0e92dc303c4a', '9d25a3b7-b307-426a-995c-c62d862fcbb2', 'bf04755e-dcd5-4476-bbef-22c061d33823');

DROP TABLE IF EXISTS customer_system_role;
CREATE TABLE IF NOT EXISTS customer_system_role(
                                                    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_system_role_id uuid primary key DEFAULT gen_random_uuid(),

    customer_id uuid,
    company_customer_system_role_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS customer_system_role_authority_extend;
CREATE TABLE IF NOT EXISTS customer_system_role_authority_extend(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_system_role_extend_id uuid primary key DEFAULT gen_random_uuid(),

    customer_id uuid,
    company_customer_system_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS currency_rate;
CREATE TABLE IF NOT EXISTS currency_rate(
                                                    id serial4, reference_id varchar(36), reference_code varchar(36),

    currency_rate_id uuid primary key DEFAULT gen_random_uuid(),
    currency_rate_code varchar(36) unique,

    company_id uuid,
    currency_id uuid,

    exchange_rate double precision,

    rate_buy_in double precision,
    rate_sale_out double precision,

    rate_cross_buy_in double precision,
    rate_cross_sale_out double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO currency_rate (currency_rate_id, company_id, currency_id, exchange_rate, rate_buy_in, rate_sale_out, rate_cross_buy_in, rate_cross_sale_out) VALUES
                                                                                                                                                                         ('d9056d25-da5d-4028-bbb5-61749f8f3782', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'b1fc53ab-a2b7-41a9-afca-0c6d6760c111', 1.0, 1.0, 1.0, 1.0, 1.0),
                                                                                                                                                                         ('0da8bb95-3087-4158-b578-784e046f61c8', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'db33514c-6d12-4c53-80f1-1799f0f07fa4', 4100.0, 4100.0, 4100.0, 4100.0, 4100.0);

DROP TABLE IF EXISTS device;
CREATE TABLE IF NOT EXISTS device(
                                     id serial4, reference_id varchar(36), reference_code varchar(36),

    device_id uuid primary key DEFAULT gen_random_uuid(),
    device_code varchar(36) unique,

    company_id uuid,

    device_title varchar(120),
    device_os_title varchar(120),
    device_os_version varchar(120),
    device_platform varchar(50),

    notification_platform varchar(36),
    notification_device_token varchar(36) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS file_manager;
CREATE TABLE IF NOT EXISTS file_manager(
                                            id serial4, reference_id varchar(36), reference_code varchar(36),

    file_manager_id uuid primary key DEFAULT gen_random_uuid(),
    file_manager_code varchar(36) unique,

    company_id uuid,

    file_title varchar(250),
    file_path varchar(500),
    file_url varchar(500),

    thumbnail_path varchar(500),
    thumbnail_url varchar(500),

    file_type varchar(120),
    file_extension varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS sub_company;
CREATE TABLE IF NOT EXISTS sub_company(
                                          id serial4, reference_id varchar(36), reference_code varchar(36),

    sub_company_id uuid primary key DEFAULT gen_random_uuid(),
    sub_company_code varchar(36) unique,

    company_id uuid,

    sub_company_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO sub_company (sub_company_id, sub_company_code, company_id, sub_company_title) VALUES
    ('df284b49-1450-49dd-8a7a-fd14bbb08ff2', 'FWFCAM', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'FWF Logistics Cambodia');


DROP TABLE IF EXISTS sub_company_title;
CREATE TABLE IF NOT EXISTS sub_company_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    sub_company_id uuid,
    sub_company_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (sub_company_id, lang)
);

DROP TABLE IF EXISTS company_branch_type;
CREATE TABLE IF NOT EXISTS company_branch_type(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    company_branch_type_id uuid primary key DEFAULT gen_random_uuid(),
    company_branch_type_code varchar(36) unique,

    company_id uuid,

    branch_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_branch_type (company_branch_type_id, company_branch_type_code, company_id, branch_type_title) VALUES
                                                                                                                    ('c07ccfe6-6be0-4c88-baa4-2187b0f0a705', 'HQ', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'Head Qauter'),
                                                                                                                    ('4cfb9c15-0ae7-470c-b428-0d0b78f7cde8', 'SD', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'Subsidiary'),
                                                                                                                    ('0723dd1a-5a63-4ca7-9f2d-d6042fcb37ba', 'BN', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'Branch');

DROP TABLE IF EXISTS company_branch_type_title;
CREATE TABLE IF NOT EXISTS company_branch_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_branch_type_id uuid,
    branch_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_branch_type_id, lang)
);


DROP TABLE IF EXISTS branch;
CREATE TABLE IF NOT EXISTS branch(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    branch_id uuid primary key DEFAULT gen_random_uuid(),
    branch_code varchar(36) unique,

    company_id uuid,
    sub_company_id uuid,

    company_branch_type_id uuid,

    branch_title varchar(120),

    country_id uuid,
    province_id uuid,
    district_id uuid,
    commune_id uuid,
    village_id uuid,
    postal_code varchar(50),
    contact_person varchar(100),
    contact_phone varchar(100),
    contact_email varchar(100),
    check_point_contact_person varchar(100),
    check_point_contact_phone varchar(100),
    branch_address varchar(250),
    branch_image_id uuid,
    latitude double precision,
    longitude double precision,
    timezone varchar(100),


    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO branch (branch_id, branch_code, company_id, sub_company_id, company_branch_type_id, branch_title) VALUES
('20548fb8-830b-4bf3-b179-520c99185b63', 'FWFHQCAM', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'df284b49-1450-49dd-8a7a-fd14bbb08ff2', 'c07ccfe6-6be0-4c88-baa4-2187b0f0a705', 'Headquarters');

DROP TABLE IF EXISTS branch_title;
CREATE TABLE IF NOT EXISTS branch_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    branch_id uuid,
    branch_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (branch_id, lang)
);


DROP TABLE IF EXISTS branch_currency;
CREATE TABLE IF NOT EXISTS branch_currency(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    branch_currency_id uuid primary key DEFAULT gen_random_uuid(),
    branch_currency_code varchar(36) unique,

    branch_id uuid,
    currency_id uuid,
    primary_status integer default 0 not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO branch_currency (branch_currency_id, branch_id, currency_id) VALUES
                                                                                     ('46684c6b-6f32-4ab4-8cd9-7ffaee0f8206', '20548fb8-830b-4bf3-b179-520c99185b63', 'b1fc53ab-a2b7-41a9-afca-0c6d6760c111'),
                                                                                     ('209228dc-111f-4227-9c56-0da5ce3e7ad2', '20548fb8-830b-4bf3-b179-520c99185b63', 'db33514c-6d12-4c53-80f1-1799f0f07fa4'),
                                                                                     ('3c71b320-6440-4471-b622-9ca890db18fa', '29926d7c-1583-4a14-aa24-b09d4be766db', 'b1fc53ab-a2b7-41a9-afca-0c6d6760c111'),
                                                                                     ('be25db25-9673-4ecb-8ed5-31f31ea2ee92', '29926d7c-1583-4a14-aa24-b09d4be766db', 'db33514c-6d12-4c53-80f1-1799f0f07fa4'),
                                                                                     ('30e88b2d-e1af-4db4-a00e-4be2701293e5', '142c7eaf-806d-4337-968e-a8dfcde2021f', 'b1fc53ab-a2b7-41a9-afca-0c6d6760c111'),
                                                                                     ('78fc21f1-2d27-4927-b735-9c040834aaaf', '142c7eaf-806d-4337-968e-a8dfcde2021f', 'db33514c-6d12-4c53-80f1-1799f0f07fa4');

DROP TABLE IF EXISTS branch_payment_method;
CREATE TABLE IF NOT EXISTS branch_payment_method(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    branch_payment_method_id uuid primary key DEFAULT gen_random_uuid(),
    branch_payment_method_code varchar(36) unique,

    branch_id uuid,
    company_payment_method_id uuid,
    primary_status integer default 0 not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO branch_payment_method(branch_payment_method_id, branch_id, company_payment_method_id, primary_status) VALUES
('9c104e0e-1890-42ce-ad08-90aef28de8ce', '20548fb8-830b-4bf3-b179-520c99185b63', '31a58be9-e88c-48f5-b271-eb233de26bca', 1),
('0a21267b-8198-467b-a4be-b43597ca9a76', '20548fb8-830b-4bf3-b179-520c99185b63', '2a77d394-2a13-4140-abd0-a3bb26cf8267', 0),
('094f5900-775b-4a63-8fed-e6e62c0a9713', '20548fb8-830b-4bf3-b179-520c99185b63', '723f8bf7-4026-49f1-a7f7-ae9086377618', 0),
('685b1d77-26c4-4d68-abb0-bb08b1414fc4', '20548fb8-830b-4bf3-b179-520c99185b63', '7a02d1cf-56cd-47dc-af37-7fca473dda07', 0),
('a628a557-68da-48ae-9489-0d9ee7390fa1', '20548fb8-830b-4bf3-b179-520c99185b63', 'b15f4b24-5896-4703-af8a-04e6e7b7c348', 0);

DROP TABLE IF EXISTS branch_payment_gateway;
CREATE TABLE IF NOT EXISTS branch_payment_gateway(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    branch_payment_gateway_id uuid primary key DEFAULT gen_random_uuid(),
    branch_payment_gateway_code varchar(36) unique,

    branch_id uuid,
    company_payment_gateway_id uuid,
    primary_status integer default 0 not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO branch_payment_gateway(branch_payment_gateway_id, branch_id, company_payment_gateway_id, primary_status) VALUES
('57360560-6c2c-4209-9fee-3d06e4088d83', '20548fb8-830b-4bf3-b179-520c99185b63', '4bb320b3-2ba7-478a-ba0a-3bcb34b812c4', 0),
('b1095336-8880-4a9d-a31a-56facdcd59a0', '20548fb8-830b-4bf3-b179-520c99185b63', '00d0ff7a-2849-4191-b194-4ae0fb3a4941', 1),
('f43d7ac2-e744-4211-acd0-a8f16736870c', '20548fb8-830b-4bf3-b179-520c99185b63', 'c0844aa5-f590-42db-9956-e304cac5449b', 0);

DROP TABLE IF EXISTS company_user_position;
CREATE TABLE IF NOT EXISTS company_user_position(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_user_position_id uuid primary key DEFAULT gen_random_uuid(),
    company_user_position_code varchar(36) unique,

    company_id uuid,
    system_user_position_id uuid,


    user_position_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_user_position (company_user_position_id, company_user_position_code, company_id, system_user_position_id, user_position_title) VALUES
                                                                                                                                                    
                                                                                                                                                    ('440135b2-7158-4eca-925f-240955dfd0e6', 'CEO', 'b45c8a43-b247-4c75-b352-c6b4337186be', '799f188c-6f33-4cc6-a2c6-533d5aea4389', 'Chief Executive Officer'),
                                                                                                                                                    ('41c09a28-48d5-4d66-96c5-a26b0f249d63', 'EXD', 'b45c8a43-b247-4c75-b352-c6b4337186be', '5466cee1-1bc1-421c-95a5-2c8c4fafc80e', 'Executive Director'),
                                                                                                                                                    ('648e038c-9ce1-4f4f-86ce-35111e63cad3', 'BDD', 'b45c8a43-b247-4c75-b352-c6b4337186be', '70dbaa81-5eec-4791-ab3c-b207ca131e1c', 'Overseas Business Development Director'),
                                                                                                                                                    ('36ce5104-30bf-408f-94ec-04973e2fc870', 'ACM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '7a57e106-e007-417e-b88f-b44107d8ed4f', 'Accountant Manager'),
                                                                                                                                                    ('ffad1d74-7387-48b4-bc60-e4166296d98a', 'SEA', 'b45c8a43-b247-4c75-b352-c6b4337186be', '72ac39c2-9131-44e2-b94b-ff70f357fa7c', 'Senior Accountant'),
                                                                                                                                                    ('f8a2c36c-bd31-419a-a971-47081b19329d', 'ASC', 'b45c8a43-b247-4c75-b352-c6b4337186be', '0ec62e43-0070-4c51-a0cd-1e4c9c448d14', 'Assistant & Cashier'),
                                                                                                                                                    ('364c037b-0ee9-4731-874a-c4f983f7a7ad', 'JAC', 'b45c8a43-b247-4c75-b352-c6b4337186be', '4648342e-68e8-413e-89a0-cf8946cf24eb', 'Junior Accountant'),
                                                                                                                                                    ('d1b08d92-e09e-4b51-8c05-d93122520387', 'SPM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '56e7de4c-fff1-44e6-ba70-fa6ffcf02cc8', 'Sale & Pricing Manager'),
                                                                                                                                                    ('646f2199-5e22-4949-bed6-b6afaa8e4565', 'COM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '8df3f60d-e02c-4cfd-9d26-b5a6cd4c09fc', 'Commercial Manager'),
                                                                                                                                                    ('345c236e-d524-4475-bc9a-8ba5b42028d6', 'SSO', 'b45c8a43-b247-4c75-b352-c6b4337186be', '616257bc-8f60-456f-9e88-dc4ce5732198', 'Sale Support Officer'),
                                                                                                                                                    ('4d19bc9b-6f30-45c1-a29a-9806c42a487c', 'SLS', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ba387c59-2654-46e8-b552-d8daa94912ac', 'Sale Assistant'),
                                                                                                                                                    ('edfb431c-9ab5-4027-aed8-9383a861039a', 'OPM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '79f0b0d5-16a4-4547-8136-6108d48e9dc3', 'Operation Manager'),
                                                                                                                                                    ('4246606b-d505-4101-9b97-9cd740f8fb12', 'IMM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '9a310909-fbeb-4faf-ab30-8934ef3f35e0', 'Import Manager'),
                                                                                                                                                    ('4b56aead-4bcf-4f3b-9851-a794a945f24c', 'SIO', 'b45c8a43-b247-4c75-b352-c6b4337186be', '666d52c1-690b-40b5-8b3c-8dd354471a47', 'Senior Import Operation'),
                                                                                                                                                    ('2f7410ba-aa91-4e25-90b9-eb0a23280473', 'IMP', 'b45c8a43-b247-4c75-b352-c6b4337186be', '87fbb565-b104-45bf-a14b-23f667c3b96d', 'Import Operation'),
                                                                                                                                                    ('810d5225-e78b-4690-a518-00ee386f9961', 'SNO', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ad723c78-1c34-414c-94e3-bed874b92348', 'Senior Operation'),
                                                                                                                                                    ('d27da938-17c4-4656-80e2-a37613554ae4', 'EXM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '3700262b-87d4-49d8-b11a-c053688a3916', 'Export Manager'),
                                                                                                                                                    ('00e51aec-9691-46ad-bd10-d60cb1d20829', 'EXO', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'cf91d0b7-1af8-4865-85fa-3a1317a8502b', 'Export Operation'),
                                                                                                                                                    ('ac9e45c6-6e1a-4f39-baed-7bcb4de3def9', 'SEO', 'b45c8a43-b247-4c75-b352-c6b4337186be', '8d29d51d-278d-44c3-93fc-9e89a8e16ade', 'Senior Export Operation'),
                                                                                                                                                    ('dae5df4b-ddf8-488f-94d3-ff2580fbdd6c', 'LSP', 'b45c8a43-b247-4c75-b352-c6b4337186be', '7cfd1f5c-bacf-415f-92fa-c24320c1dd42', 'Logistics Suppervisor'),
                                                                                                                                                    ('db532f1b-7675-4991-bc85-cfd797338bb4', 'CLO', 'b45c8a43-b247-4c75-b352-c6b4337186be', '3323fc86-9716-4e87-a9f8-84db051fe3a0', 'Clearance Operation'),
                                                                                                                                                    ('ab9eb71b-151a-47ef-8fdc-f3be98dbb858', 'CLS', 'b45c8a43-b247-4c75-b352-c6b4337186be', '772bf9ff-d421-4be5-ad36-c339a9707a39', 'Clearance Supervisor'),
                                                                                                                                                    ('fd8fac85-4420-45b3-bb8f-ae62a2db5238', 'ITO', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'd7e00412-66c6-4399-9467-3e7496813f90', 'IT Officer'),
                                                                                                                                                    ('a458ae5b-0fe6-460f-98ca-5fd3a1899033', 'OTO', 'b45c8a43-b247-4c75-b352-c6b4337186be', '5c2e1d61-9c79-4f83-99fc-81ab8bd70b3c', 'Outside Team Officer'),
                                                                                                                                                    ('e6931859-2e13-4478-bbcc-e86322ecb215', 'CLN', 'b45c8a43-b247-4c75-b352-c6b4337186be', '2e65dcc1-2f41-4a85-94f5-725542b324f9', 'Cleaner'),
                                                                                                                                                    ('a7fcdc5d-84bf-44d5-803b-ffb4d9b7a0c6', 'DRV', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'f47caf54-cc5c-49ad-9e4b-d24d29e890b0', 'Driver'),
                                                                                                                                                    ('37e4ec9e-0def-476c-9bf1-8f22fba1584e', 'CWM', 'b45c8a43-b247-4c75-b352-c6b4337186be', '49cdb4d9-df04-4654-8e6a-b9feda32dfe2', 'Cold Warehouse Manager');

DROP TABLE IF EXISTS company_user_position_title;
CREATE TABLE IF NOT EXISTS company_user_position_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_user_position_id uuid,
    user_position_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_user_position_id, lang)
);

DROP TABLE IF EXISTS company_user_department;
CREATE TABLE IF NOT EXISTS company_user_department(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_user_department_id uuid primary key DEFAULT gen_random_uuid(),
    company_user_department_code varchar(36) unique,

    company_id uuid,
    system_user_department_id uuid,

    user_department_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO company_user_department (company_user_department_id, company_user_department_code, company_id, system_user_department_id, user_department_title) VALUES

                                                                                                                                                                ('059b84b7-4da0-47d7-a464-5b983c8b9cbc', 'EX', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ee881143-49a5-4ef4-9d91-0cf68e3a43fc', 'Executive'),
                                                                                                                                                                ('421c7cd9-0ca4-4664-97cd-b17ab08e47fb', 'FA', 'b45c8a43-b247-4c75-b352-c6b4337186be', '08dd9c9a-4b3a-4dca-828d-33e903cb46e7', 'Finance & Accounting'),
                                                                                                                                                                ('968030cd-6f7c-4cbf-8b83-b10c547cd859', 'SL', 'b45c8a43-b247-4c75-b352-c6b4337186be', '04625f8a-2f6b-40d2-b613-9151ba40f777', 'Sale'),
                                                                                                                                                                ('9603e3a8-6eb1-46e1-b2b4-9bff699f92bd', 'IM', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ae01a1d9-a756-4940-af5b-e8cdc818816d', 'Import'),
                                                                                                                                                                ('f99e239b-664c-47a3-9dc5-7c96825ab8d2', 'EP', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'bf76e633-5676-4b12-b5b8-05d1f9985e44', 'Export'),
                                                                                                                                                                ('f03dd4d9-9f6e-40c3-ba2b-c85181871d83', 'CC', 'b45c8a43-b247-4c75-b352-c6b4337186be', '3e730a6d-37be-49f9-b546-ed44fdc5b9e3', 'Customs Clearance'),
                                                                                                                                                                ('007e4616-d100-48ad-9460-c31ab3de9cb4', 'IT', 'b45c8a43-b247-4c75-b352-c6b4337186be', '87c62e56-cd69-49dc-b6e6-f77495ec84f1', 'Information Technology'),
                                                                                                                                                                ('e0e8700b-adde-4065-867f-8cd531c2d41b', 'OT', 'b45c8a43-b247-4c75-b352-c6b4337186be', '1519264e-e340-410a-96a1-ba9ff21e9b18', 'Outside Team'),
                                                                                                                                                                ('b84ffb5a-8385-42bd-b268-736f81aa0018', 'HR', 'b45c8a43-b247-4c75-b352-c6b4337186be', '6c77f67d-b0d9-454c-b829-07b05b2a4afd', 'HR & Admin'),
                                                                                                                                                                ('ba097991-af7d-4805-b18c-e5326c03bece', 'WH', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'a4c9f9f6-6031-4055-af39-d2f91f5fd9b4', 'Warehouse');

DROP TABLE IF EXISTS company_user_department_title;
CREATE TABLE IF NOT EXISTS company_user_department_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_user_department_id uuid,
    user_department_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_user_department_id, lang)
);

DROP TABLE IF EXISTS user_auth;
CREATE TABLE IF NOT EXISTS user_auth(
                                        id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_id uuid primary key DEFAULT gen_random_uuid(),
    user_auth_code varchar(36) unique,

    company_id uuid,
    sub_company_id uuid,
    branch_id uuid,
    operation_branch_id uuid,

    company_user_position_id uuid,
    company_user_department_id uuid,

    account_number varchar(15) unique,
    staff_id varchar(50),
    username varchar(36) unique,
    password varchar(250),
    secret_password varchar(500),
    force_change_password smallint default 0,
    allow_change_password smallint default 0,
    password_expire_in_second int default null,
    password_expire_at timestamp default null,
    last_change_password_at timestamp default null,
    last_login_at timestamp default null,
    activated_login_at timestamp default now(),

    first_name varchar(100),
    last_name varchar(100),
    full_name varchar(200),
    gender varchar(8),
    contact_phone varchar(100),
    profile_image_id uuid,


    operation_active_at timestamp default null,
    operation_expire_at timestamp default null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO user_auth (user_auth_id, company_id, sub_company_id, branch_id, operation_branch_id, company_user_position_id, company_user_department_id, account_number, username, password, full_name, first_name, last_name, gender, operation_active_at) VALUES
    ('181e2649-e46b-4cfd-9396-59727108119e', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'df284b49-1450-49dd-8a7a-fd14bbb08ff2', '20548fb8-830b-4bf3-b179-520c99185b63', '20548fb8-830b-4bf3-b179-520c99185b63', null, null, '100001', 'admin', '$2a$12$3DdlNhkgp370EQ7LvCTp8uDdFXVkUJ3T/Rqhb2R7sY6wA/JMcqR2C', 'eng kyhov', 'kyhov', 'eng', 'male', now());

DROP TABLE IF EXISTS user_auth_token_ttl;
CREATE TABLE IF NOT EXISTS user_auth_token_ttl(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_token_ttl_id uuid primary key DEFAULT gen_random_uuid(),

    user_auth_id uuid,
    ttl_min int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO user_auth_token_ttl (user_auth_token_ttl_id, user_auth_id, ttl_min) VALUES
    ('98717bd7-2b2a-4f8e-8b2c-b77eafe6a385', '181e2649-e46b-4cfd-9396-59727108119e', 52560000);

DROP TABLE IF EXISTS user_auth_device;
CREATE TABLE IF NOT EXISTS user_auth_device(
                                               id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_device_id uuid primary key DEFAULT gen_random_uuid(),
    user_auth_device_code varchar(36) unique,

    user_auth_id uuid,
    device_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS user_auth_login;
CREATE TABLE IF NOT EXISTS user_auth_login(
                                              id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_login_id uuid primary key DEFAULT gen_random_uuid(),
    user_auth_login_code varchar(36) unique,

    user_auth_id uuid,
    user_auth_device_id uuid,

    auth_token_type varchar(36),
    auth_token varchar(2500),
    auth_active_at timestamp default now(),

    log_in_at timestamp default now(),
    -- log_out_at timestamp,

    ip_address varchar(250),
    latitude double precision,
    longitude double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS user_auth_login_history;
CREATE TABLE IF NOT EXISTS user_auth_login_history(
                                              id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_login_history_id uuid primary key DEFAULT gen_random_uuid(),
    user_auth_login_history_code varchar(36) unique,

    user_auth_id uuid,
    user_auth_device_id uuid,

    auth_token_type varchar(36),
    auth_token varchar(2500),
    auth_active_at timestamp default now(),

    log_in_at timestamp default now(),
    log_out_at timestamp,

    ip_address varchar(250),
    latitude double precision,
    longitude double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS user_auth_system_role;
CREATE TABLE IF NOT EXISTS user_auth_system_role(
                                                    id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_system_role_id uuid primary key DEFAULT gen_random_uuid(),

    user_auth_id uuid,
    company_system_role_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO user_auth_system_role (user_auth_system_role_id, user_auth_id, company_system_role_id) VALUES
                                                                                                       ('56cdafb5-5c7c-4010-b113-d222c23cbc4a', '181e2649-e46b-4cfd-9396-59727108119e', '28e42b39-b375-4269-869f-4dd68c36ee2a'),
                                                                                                       ('228accfc-095f-4b87-baf3-6e6f54fd46e9', '181e2649-e46b-4cfd-9396-59727108119e', '7b072478-60a6-42a3-b24b-6c36d9a28b91');

DROP TABLE IF EXISTS user_auth_system_role_authority_extend;
CREATE TABLE IF NOT EXISTS user_auth_system_role_authority_extend(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_system_role_extend_id uuid primary key DEFAULT gen_random_uuid(),

    user_auth_id uuid,
    company_system_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO user_auth_system_role_authority_extend (user_auth_system_role_extend_id, user_auth_id, company_system_authority_id) VALUES
    ('5590663e-4e94-4568-9170-f26ac0880074', '181e2649-e46b-4cfd-9396-59727108119e', '52f0eb1e-4350-45a3-9ebe-057284db4cf2');


DROP TABLE IF EXISTS user_auth_mobile_role;
CREATE TABLE IF NOT EXISTS user_auth_mobile_role(
                                                    id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_mobile_role_id uuid primary key DEFAULT gen_random_uuid(),

    user_auth_id uuid,
    company_mobile_role_id uuid,
    primary_status int default 0,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );
INSERT INTO user_auth_mobile_role (user_auth_mobile_role_id, user_auth_id, company_mobile_role_id, primary_status) VALUES
    ('41714fb5-73cd-49a2-a32d-492c380dc60c', '181e2649-e46b-4cfd-9396-59727108119e', '47a2bff9-d3f1-45a9-a9e5-a359b528df92', 1);



DROP TABLE IF EXISTS user_auth_mobile_role_authority_extend;
CREATE TABLE IF NOT EXISTS user_auth_mobile_role_authority_extend(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_mobile_role_extend_id uuid primary key DEFAULT gen_random_uuid(),

    user_auth_id uuid,
    company_system_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO user_auth_mobile_role_authority_extend (user_auth_mobile_role_extend_id, user_auth_id, company_system_authority_id) VALUES
    ('9d483078-d935-4ced-a28a-215195d01aff', '181e2649-e46b-4cfd-9396-59727108119e', '45c78c6f-d010-4f91-bb67-3e5a606446b7');

DROP TABLE IF EXISTS user_auth_mobile_authority_favorite;
CREATE TABLE IF NOT EXISTS user_auth_mobile_authority_favorite(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    user_auth_mobile_authority_favorite_id uuid primary key DEFAULT gen_random_uuid(),
    user_auth_mobile_authority_favorite_code varchar(36) unique,

    user_auth_id uuid not null,
    company_system_authority_id uuid not null,
    favorite_order int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS gmt_timezone;
CREATE TABLE IF NOT EXISTS gmt_timezone(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    gmt_timezone_id uuid primary key DEFAULT gen_random_uuid(),
    gmt_timezone_code varchar(36) unique,

    country_short_code varchar(10),
    country_name varchar(100),
    timezone varchar(50),
    gmt varchar(10),
    carbon_gmt varchar(10),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO gmt_timezone(country_short_code, country_name, timezone, gmt, carbon_gmt) VALUES
('AF', 'Afghanistan', 'Asia/Kabul', '+04:30', '-04:30'),
('AX', 'Aland Islands', 'Europe/Mariehamn', '+02:00', '-02:00'),
('AL', 'Albania', 'Europe/Tirane', '+01:00', '-01:00'),
('DZ', 'Algeria', 'Africa/Algiers', '+01:00', '-01:00'),
('AS', 'American Samoa', 'Pacific/Pago_Pago', '-11:00', '+11:00'),
('AD', 'Andorra', 'Europe/Andorra', '+01:00', '-01:00'),
('AO', 'Angola', 'Africa/Luanda', '+01:00', '-01:00'),
('AI', 'Anguilla', 'America/Anguilla', '-04:00', '+04:00'),
('AQ', 'Antarctica', 'Antarctica/Casey', '+08:00', '-08:00'),
('AQ', 'Antarctica', 'Antarctica/Davis', '+07:00', '-07:00'),
('AQ', 'Antarctica', 'Antarctica/DumontDUrville', '+10:00', '-10:00'),
('AQ', 'Antarctica', 'Antarctica/Mawson', '+05:00', '-05:00'),
('AQ', 'Antarctica', 'Antarctica/McMurdo', '+13:00', '-13:00'),
('AQ', 'Antarctica', 'Antarctica/Palmer', '-03:00', '+03:00'),
('AQ', 'Antarctica', 'Antarctica/Rothera', '-03:00', '+03:00'),
('AQ', 'Antarctica', 'Antarctica/Syowa', '+03:00', '-03:00'),
('AQ', 'Antarctica', 'Antarctica/Troll', '+00:00', '+00:00'),
('AQ', 'Antarctica', 'Antarctica/Vostok', '+06:00', '-06:00'),
('AG', 'Antigua and Barbuda', 'America/Antigua', '-04:00', '+04:00'),
('AR', 'Argentina', 'America/Argentina/Buenos_Aires', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Catamarca', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Cordoba', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Jujuy', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/La_Rioja', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Mendoza', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Rio_Gallegos', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Salta', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/San_Juan', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/San_Luis', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Tucuman', '-03:00', '+03:00'),
('AR', 'Argentina', 'America/Argentina/Ushuaia', '-03:00', '+03:00'),
('AM', 'Armenia', 'Asia/Yerevan', '+04:00', '-04:00'),
('AW', 'Aruba', 'America/Aruba', '-04:00', '+04:00'),
('AU', 'Australia', 'Antarctica/Macquarie', '+11:00', '-11:00'),
('AU', 'Australia', 'Australia/Adelaide', '+10:30', '-10:30'),
('AU', 'Australia', 'Australia/Brisbane', '+10:00', '-10:00'),
('AU', 'Australia', 'Australia/Broken_Hill', '+10:30', '-10:30'),
('AU', 'Australia', 'Australia/Currie', '+11:00', '-11:00'),
('AU', 'Australia', 'Australia/Darwin', '+09:30', '-09:30'),
('AU', 'Australia', 'Australia/Eucla', '+08:45', '-08:45'),
('AU', 'Australia', 'Australia/Hobart', '+11:00', '-11:00'),
('AU', 'Australia', 'Australia/Lindeman', '+10:00', '-10:00'),
('AU', 'Australia', 'Australia/Lord_Howe', '+11:00', '-11:00'),
('AU', 'Australia', 'Australia/Melbourne', '+11:00', '-11:00'),
('AU', 'Australia', 'Australia/Perth', '+08:00', '-08:00'),
('AU', 'Australia', 'Australia/Sydney', '+11:00', '-11:00'),
('AT', 'Austria', 'Europe/Vienna', '+01:00', '-01:00'),
('AZ', 'Azerbaijan', 'Asia/Baku', '+04:00', '-04:00'),
('BS', 'Bahamas', 'America/Nassau', '-05:00', '+05:00'),
('BH', 'Bahrain', 'Asia/Bahrain', '+03:00', '-03:00'),
('BD', 'Bangladesh', 'Asia/Dhaka', '+06:00', '-06:00'),
('BB', 'Barbados', 'America/Barbados', '-04:00', '+04:00'),
('BY', 'Belarus', 'Europe/Minsk', '+03:00', '-03:00'),
('BE', 'Belgium', 'Europe/Brussels', '+01:00', '-01:00'),
('BZ', 'Belize', 'America/Belize', '-06:00', '+06:00'),
('BJ', 'Benin', 'Africa/Porto-Novo', '+01:00', '-01:00'),
('BM', 'Bermuda', 'Atlantic/Bermuda', '-04:00', '+04:00'),
('BT', 'Bhutan', 'Asia/Thimphu', '+06:00', '-06:00'),
('BO', 'Bolivia', 'America/La_Paz', '-04:00', '+04:00'),
('BQ', 'Bonaire, Saint Eustatius and Saba', 'America/Kralendijk', '-04:00', '+04:00'),
('BA', 'Bosnia and Herzegovina', 'Europe/Sarajevo', '+01:00', '-01:00'),
('BW', 'Botswana', 'Africa/Gaborone', '+02:00', '-02:00'),
('BR', 'Brazil', 'America/Araguaina', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Bahia', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Belem', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Boa_Vista', '-04:00', '+04:00'),
('BR', 'Brazil', 'America/Campo_Grande', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Cuiaba', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Eirunepe', '-05:00', '+05:00'),
('BR', 'Brazil', 'America/Fortaleza', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Maceio', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Manaus', '-04:00', '+04:00'),
('BR', 'Brazil', 'America/Noronha', '-02:00', '+02:00'),
('BR', 'Brazil', 'America/Porto_Velho', '-04:00', '+04:00'),
('BR', 'Brazil', 'America/Recife', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Rio_Branco', '-05:00', '+05:00'),
('BR', 'Brazil', 'America/Santarem', '-03:00', '+03:00'),
('BR', 'Brazil', 'America/Sao_Paulo', '-02:00', '+02:00'),
('IO', 'British Indian Ocean Territory', 'Indian/Chagos', '+06:00', '-06:00'),
('VG', 'British Virgin Islands', 'America/Tortola', '-04:00', '+04:00'),
('BN', 'Brunei', 'Asia/Brunei', '+08:00', '-08:00'),
('BG', 'Bulgaria', 'Europe/Sofia', '+02:00', '-02:00'),
('BF', 'Burkina Faso', 'Africa/Ouagadougou', '+00:00', '+00:00'),
('BI', 'Burundi', 'Africa/Bujumbura', '+02:00', '-02:00'),
('KH', 'Cambodia', 'Asia/Phnom_Penh', '+07:00', '-07:00'),
('CM', 'Cameroon', 'Africa/Douala', '+01:00', '-01:00'),
('CA', 'Canada', 'America/Atikokan', '-05:00', '+05:00'),
('CA', 'Canada', 'America/Blanc-Sablon', '-04:00', '+04:00'),
('CA', 'Canada', 'America/Cambridge_Bay', '-07:00', '+07:00'),
('CA', 'Canada', 'America/Creston', '-07:00', '+07:00'),
('CA', 'Canada', 'America/Dawson', '-08:00', '+08:00'),
('CA', 'Canada', 'America/Dawson_Creek', '-07:00', '+07:00'),
('CA', 'Canada', 'America/Edmonton', '-07:00', '+07:00'),
('CA', 'Canada', 'America/Fort_Nelson', '-07:00', '+07:00'),
('CA', 'Canada', 'America/Glace_Bay', '-04:00', '+04:00'),
('CA', 'Canada', 'America/Goose_Bay', '-04:00', '+04:00'),
('CA', 'Canada', 'America/Halifax', '-04:00', '+04:00'),
('CA', 'Canada', 'America/Inuvik', '-07:00', '+07:00'),
('CA', 'Canada', 'America/Iqaluit', '-05:00', '+05:00'),
('CA', 'Canada', 'America/Moncton', '-04:00', '+04:00'),
('CA', 'Canada', 'America/Nipigon', '-05:00', '+05:00'),
('CA', 'Canada', 'America/Pangnirtung', '-05:00', '+05:00'),
('CA', 'Canada', 'America/Rainy_River', '-06:00', '+06:00'),
('CA', 'Canada', 'America/Rankin_Inlet', '-06:00', '+06:00'),
('CA', 'Canada', 'America/Regina', '-06:00', '+06:00'),
('CA', 'Canada', 'America/Resolute', '-06:00', '+06:00'),
('CA', 'Canada', 'America/St_Johns', '-03:30', '+03:30'),
('CA', 'Canada', 'America/Swift_Current', '-06:00', '+06:00'),
('CA', 'Canada', 'America/Thunder_Bay', '-05:00', '+05:00'),
('CA', 'Canada', 'America/Toronto', '-05:00', '+05:00'),
('CA', 'Canada', 'America/Vancouver', '-08:00', '+08:00'),
('CA', 'Canada', 'America/Whitehorse', '-08:00', '+08:00'),
('CA', 'Canada', 'America/Winnipeg', '-06:00', '+06:00'),
('CA', 'Canada', 'America/Yellowknife', '-07:00', '+07:00'),
('CV', 'Cape Verde', 'Atlantic/Cape_Verde', '-01:00', '+01:00'),
('KY', 'Cayman Islands', 'America/Cayman', '-05:00', '+05:00'),
('CF', 'Central African Republic', 'Africa/Bangui', '+01:00', '-01:00'),
('TD', 'Chad', 'Africa/Ndjamena', '+01:00', '-01:00'),
('CL', 'Chile', 'America/Punta_Arenas', '-03:00', '+03:00'),
('CL', 'Chile', 'America/Santiago', '-03:00', '+03:00'),
('CL', 'Chile', 'Pacific/Easter', '-05:00', '+05:00'),
('CN', 'China', 'Asia/Shanghai', '+08:00', '-08:00'),
('CN', 'China', 'Asia/Urumqi', '+06:00', '-06:00'),
('CX', 'Christmas Island', 'Indian/Christmas', '+07:00', '-07:00'),
('CC', 'Cocos Islands', 'Indian/Cocos', '+06:30', '-06:30'),
('CO', 'Colombia', 'America/Bogota', '-05:00', '+05:00'),
('KM', 'Comoros', 'Indian/Comoro', '+03:00', '-03:00'),
('CK', 'Cook Islands', 'Pacific/Rarotonga', '-10:00', '+10:00'),
('CR', 'Costa Rica', 'America/Costa_Rica', '-06:00', '+06:00'),
('HR', 'Croatia', 'Europe/Zagreb', '+01:00', '-01:00'),
('CU', 'Cuba', 'America/Havana', '-05:00', '+05:00'),
('CW', 'Curaçao', 'America/Curacao', '-04:00', '+04:00'),
('CY', 'Cyprus', 'Asia/Famagusta', '+02:00', '-02:00'),
('CY', 'Cyprus', 'Asia/Nicosia', '+02:00', '-02:00'),
('CZ', 'Czech Republic', 'Europe/Prague', '+01:00', '-01:00'),
('CD', 'Democratic Republic of the Congo', 'Africa/Kinshasa', '+01:00', '-01:00'),
('CD', 'Democratic Republic of the Congo', 'Africa/Lubumbashi', '+02:00', '-02:00'),
('DK', 'Denmark', 'Europe/Copenhagen', '+01:00', '-01:00'),
('DJ', 'Djibouti', 'Africa/Djibouti', '+03:00', '-03:00'),
('DM', 'Dominica', 'America/Dominica', '-04:00', '+04:00'),
('DO', 'Dominican Republic', 'America/Santo_Domingo', '-04:00', '+04:00'),
('TL', 'East Timor', 'Asia/Dili', '+09:00', '-09:00'),
('EC', 'Ecuador', 'America/Guayaquil', '-05:00', '+05:00'),
('EC', 'Ecuador', 'Pacific/Galapagos', '-06:00', '+06:00'),
('EG', 'Egypt', 'Africa/Cairo', '+02:00', '-02:00'),
('SV', 'El Salvador', 'America/El_Salvador', '-06:00', '+06:00'),
('GQ', 'Equatorial Guinea', 'Africa/Malabo', '+01:00', '-01:00'),
('ER', 'Eritrea', 'Africa/Asmara', '+03:00', '-03:00'),
('EE', 'Estonia', 'Europe/Tallinn', '+02:00', '-02:00'),
('ET', 'Ethiopia', 'Africa/Addis_Ababa', '+03:00', '-03:00'),
('FK', 'Falkland Islands', 'Atlantic/Stanley', '-03:00', '+03:00'),
('FO', 'Faroe Islands', 'Atlantic/Faroe', '+00:00', '+00:00'),
('FJ', 'Fiji', 'Pacific/Fiji', '+13:00', '-13:00'),
('FI', 'Finland', 'Europe/Helsinki', '+02:00', '-02:00'),
('FR', 'France', 'Europe/Paris', '+01:00', '-01:00'),
('GF', 'French Guiana', 'America/Cayenne', '-03:00', '+03:00'),
('PF', 'French Polynesia', 'Pacific/Gambier', '-09:00', '+09:00'),
('PF', 'French Polynesia', 'Pacific/Marquesas', '-09:30', '+09:30'),
('PF', 'French Polynesia', 'Pacific/Tahiti', '-10:00', '+10:00'),
('TF', 'French Southern Territories', 'Indian/Kerguelen', '+05:00', '-05:00'),
('GA', 'Gabon', 'Africa/Libreville', '+01:00', '-01:00'),
('GM', 'Gambia', 'Africa/Banjul', '+00:00', '+00:00'),
('GE', 'Georgia', 'Asia/Tbilisi', '+04:00', '-04:00'),
('DE', 'Germany', 'Europe/Berlin', '+01:00', '-01:00'),
('DE', 'Germany', 'Europe/Busingen', '+01:00', '-01:00'),
('GH', 'Ghana', 'Africa/Accra', '+00:00', '+00:00'),
('GI', 'Gibraltar', 'Europe/Gibraltar', '+01:00', '-01:00'),
('GR', 'Greece', 'Europe/Athens', '+02:00', '-02:00'),
('GL', 'Greenland', 'America/Danmarkshavn', '+00:00', '+00:00'),
('GL', 'Greenland', 'America/Godthab', '-03:00', '+03:00'),
('GL', 'Greenland', 'America/Scoresbysund', '-01:00', '+01:00'),
('GL', 'Greenland', 'America/Thule', '-04:00', '+04:00'),
('GD', 'Grenada', 'America/Grenada', '-04:00', '+04:00'),
('GP', 'Guadeloupe', 'America/Guadeloupe', '-04:00', '+04:00'),
('GU', 'Guam', 'Pacific/Guam', '+10:00', '-10:00'),
('GT', 'Guatemala', 'America/Guatemala', '-06:00', '+06:00'),
('GG', 'Guernsey', 'Europe/Guernsey', '+00:00', '+00:00'),
('GN', 'Guinea', 'Africa/Conakry', '+00:00', '+00:00'),
('GW', 'Guinea-Bissau', 'Africa/Bissau', '+00:00', '+00:00'),
('GY', 'Guyana', 'America/Guyana', '-04:00', '+04:00'),
('HT', 'Haiti', 'America/Port-au-Prince', '-05:00', '+05:00'),
('HN', 'Honduras', 'America/Tegucigalpa', '-06:00', '+06:00'),
('HK', 'Hong Kong', 'Asia/Hong_Kong', '+08:00', '-08:00'),
('HU', 'Hungary', 'Europe/Budapest', '+01:00', '-01:00'),
('IS', 'Iceland', 'Atlantic/Reykjavik', '+00:00', '+00:00'),
('IN', 'India', 'Asia/Kolkata', '+05:30', '-05:30'),
('ID', 'Indonesia', 'Asia/Jakarta', '+07:00', '-07:00'),
('ID', 'Indonesia', 'Asia/Jayapura', '+09:00', '-09:00'),
('ID', 'Indonesia', 'Asia/Makassar', '+08:00', '-08:00'),
('ID', 'Indonesia', 'Asia/Pontianak', '+07:00', '-07:00'),
('IR', 'Iran', 'Asia/Tehran', '+03:30', '-03:30'),
('IQ', 'Iraq', 'Asia/Baghdad', '+03:00', '-03:00'),
('IE', 'Ireland', 'Europe/Dublin', '+00:00', '+00:00'),
('IM', 'Isle of Man', 'Europe/Isle_of_Man', '+00:00', '+00:00'),
('IL', 'Israel', 'Asia/Jerusalem', '+02:00', '-02:00'),
('IT', 'Italy', 'Europe/Rome', '+01:00', '-01:00'),
('CI', 'Ivory Coast', 'Africa/Abidjan', '+00:00', '+00:00'),
('JM', 'Jamaica', 'America/Jamaica', '-05:00', '+05:00'),
('JP', 'Japan', 'Asia/Tokyo', '+09:00', '-09:00'),
('JE', 'Jersey', 'Europe/Jersey', '+00:00', '+00:00'),
('JO', 'Jordan', 'Asia/Amman', '+02:00', '-02:00'),
('KZ', 'Kazakhstan', 'Asia/Almaty', '+06:00', '-06:00'),
('KZ', 'Kazakhstan', 'Asia/Aqtau', '+05:00', '-05:00'),
('KZ', 'Kazakhstan', 'Asia/Aqtobe', '+05:00', '-05:00'),
('KZ', 'Kazakhstan', 'Asia/Atyrau', '+05:00', '-05:00'),
('KZ', 'Kazakhstan', 'Asia/Oral', '+05:00', '-05:00'),
('KZ', 'Kazakhstan', 'Asia/Qyzylorda', '+06:00', '-06:00'),
('KE', 'Kenya', 'Africa/Nairobi', '+03:00', '-03:00'),
('KI', 'Kiribati', 'Pacific/Enderbury', '+13:00', '-13:00'),
('KI', 'Kiribati', 'Pacific/Kiritimati', '+14:00', '-14:00'),
('KI', 'Kiribati', 'Pacific/Tarawa', '+12:00', '-12:00'),
('KW', 'Kuwait', 'Asia/Kuwait', '+03:00', '-03:00'),
('KG', 'Kyrgyzstan', 'Asia/Bishkek', '+06:00', '-06:00'),
('LA', 'Laos', 'Asia/Vientiane', '+07:00', '-07:00'),
('LV', 'Latvia', 'Europe/Riga', '+02:00', '-02:00'),
('LB', 'Lebanon', 'Asia/Beirut', '+02:00', '-02:00'),
('LS', 'Lesotho', 'Africa/Maseru', '+02:00', '-02:00'),
('LR', 'Liberia', 'Africa/Monrovia', '+00:00', '+00:00'),
('LY', 'Libya', 'Africa/Tripoli', '+02:00', '-02:00'),
('LI', 'Liechtenstein', 'Europe/Vaduz', '+01:00', '-01:00'),
('LT', 'Lithuania', 'Europe/Vilnius', '+02:00', '-02:00'),
('LU', 'Luxembourg', 'Europe/Luxembourg', '+01:00', '-01:00'),
('MO', 'Macao', 'Asia/Macau', '+08:00', '-08:00'),
('MK', 'Macedonia', 'Europe/Skopje', '+01:00', '-01:00'),
('MG', 'Madagascar', 'Indian/Antananarivo', '+03:00', '-03:00'),
('MW', 'Malawi', 'Africa/Blantyre', '+02:00', '-02:00'),
('MY', 'Malaysia', 'Asia/Kuala_Lumpur', '+08:00', '-08:00'),
('MY', 'Malaysia', 'Asia/Kuching', '+08:00', '-08:00'),
('MV', 'Maldives', 'Indian/Maldives', '+05:00', '-05:00'),
('ML', 'Mali', 'Africa/Bamako', '+00:00', '+00:00'),
('MT', 'Malta', 'Europe/Malta', '+01:00', '-01:00'),
('MH', 'Marshall Islands', 'Pacific/Kwajalein', '+12:00', '-12:00'),
('MH', 'Marshall Islands', 'Pacific/Majuro', '+12:00', '-12:00'),
('MQ', 'Martinique', 'America/Martinique', '-04:00', '+04:00'),
('MR', 'Mauritania', 'Africa/Nouakchott', '+00:00', '+00:00'),
('MU', 'Mauritius', 'Indian/Mauritius', '+04:00', '-04:00'),
('YT', 'Mayotte', 'Indian/Mayotte', '+03:00', '-03:00'),
('MX', 'Mexico', 'America/Bahia_Banderas', '-06:00', '+06:00'),
('MX', 'Mexico', 'America/Cancun', '-05:00', '+05:00'),
('MX', 'Mexico', 'America/Chihuahua', '-07:00', '+07:00'),
('MX', 'Mexico', 'America/Hermosillo', '-07:00', '+07:00'),
('MX', 'Mexico', 'America/Matamoros', '-06:00', '+06:00'),
('MX', 'Mexico', 'America/Mazatlan', '-07:00', '+07:00'),
('MX', 'Mexico', 'America/Merida', '-06:00', '+06:00'),
('MX', 'Mexico', 'America/Mexico_City', '-06:00', '+06:00'),
('MX', 'Mexico', 'America/Monterrey', '-06:00', '+06:00'),
('MX', 'Mexico', 'America/Ojinaga', '-07:00', '+07:00'),
('MX', 'Mexico', 'America/Tijuana', '-08:00', '+08:00'),
('FM', 'Micronesia', 'Pacific/Chuuk', '+10:00', '-10:00'),
('FM', 'Micronesia', 'Pacific/Kosrae', '+11:00', '-11:00'),
('FM', 'Micronesia', 'Pacific/Pohnpei', '+11:00', '-11:00'),
('MD', 'Moldova', 'Europe/Chisinau', '+02:00', '-02:00'),
('MC', 'Monaco', 'Europe/Monaco', '+01:00', '-01:00'),
('MN', 'Mongolia', 'Asia/Choibalsan', '+08:00', '-08:00'),
('MN', 'Mongolia', 'Asia/Hovd', '+07:00', '-07:00'),
('MN', 'Mongolia', 'Asia/Ulaanbaatar', '+08:00', '-08:00'),
('ME', 'Montenegro', 'Europe/Podgorica', '+01:00', '-01:00'),
('MS', 'Montserrat', 'America/Montserrat', '-04:00', '+04:00'),
('MA', 'Morocco', 'Africa/Casablanca', '+01:00', '-01:00'),
('MZ', 'Mozambique', 'Africa/Maputo', '+02:00', '-02:00'),
('MM', 'Myanmar', 'Asia/Yangon', '+06:30', '-06:30'),
('NA', 'Namibia', 'Africa/Windhoek', '+02:00', '-02:00'),
('NR', 'Nauru', 'Pacific/Nauru', '+12:00', '-12:00'),
('NP', 'Nepal', 'Asia/Kathmandu', '+05:45', '-05:45'),
('NL', 'Netherlands', 'Europe/Amsterdam', '+01:00', '-01:00'),
('NC', 'New Caledonia', 'Pacific/Noumea', '+11:00', '-11:00'),
('NZ', 'New Zealand', 'Pacific/Auckland', '+13:00', '-13:00'),
('NZ', 'New Zealand', 'Pacific/Chatham', '+13:45', '-13:45'),
('NI', 'Nicaragua', 'America/Managua', '-06:00', '+06:00'),
('NE', 'Niger', 'Africa/Niamey', '+01:00', '-01:00'),
('NG', 'Nigeria', 'Africa/Lagos', '+01:00', '-01:00'),
('NU', 'Niue', 'Pacific/Niue', '-11:00', '+11:00'),
('NF', 'Norfolk Island', 'Pacific/Norfolk', '+11:00', '-11:00'),
('KP', 'North Korea', 'Asia/Pyongyang', '+09:00', '-09:00'),
('MP', 'Northern Mariana Islands', 'Pacific/Saipan', '+10:00', '-10:00'),
('NO', 'Norway', 'Europe/Oslo', '+01:00', '-01:00'),
('OM', 'Oman', 'Asia/Muscat', '+04:00', '-04:00'),
('PK', 'Pakistan', 'Asia/Karachi', '+05:00', '-05:00'),
('PW', 'Palau', 'Pacific/Palau', '+09:00', '-09:00'),
('PS', 'Palestinian Territory', 'Asia/Gaza', '+02:00', '-02:00'),
('PS', 'Palestinian Territory', 'Asia/Hebron', '+02:00', '-02:00'),
('PA', 'Panama', 'America/Panama', '-05:00', '+05:00'),
('PG', 'Papua New Guinea', 'Pacific/Bougainville', '+11:00', '-11:00'),
('PG', 'Papua New Guinea', 'Pacific/Port_Moresby', '+10:00', '-10:00'),
('PY', 'Paraguay', 'America/Asuncion', '-03:00', '+03:00'),
('PE', 'Peru', 'America/Lima', '-05:00', '+05:00'),
('PH', 'Philippines', 'Asia/Manila', '+08:00', '-08:00'),
('PN', 'Pitcairn', 'Pacific/Pitcairn', '-08:00', '+08:00'),
('PL', 'Poland', 'Europe/Warsaw', '+01:00', '-01:00'),
('PT', 'Portugal', 'Atlantic/Azores', '-01:00', '+01:00'),
('PT', 'Portugal', 'Atlantic/Madeira', '+00:00', '+00:00'),
('PT', 'Portugal', 'Europe/Lisbon', '+00:00', '+00:00'),
('PR', 'Puerto Rico', 'America/Puerto_Rico', '-04:00', '+04:00'),
('QA', 'Qatar', 'Asia/Qatar', '+03:00', '-03:00'),
('CG', 'Republic of the Congo', 'Africa/Brazzaville', '+01:00', '-01:00'),
('RE', 'Reunion', 'Indian/Reunion', '+04:00', '-04:00'),
('RO', 'Romania', 'Europe/Bucharest', '+02:00', '-02:00'),
('RU', 'Russia', 'Asia/Anadyr', '+12:00', '-12:00'),
('RU', 'Russia', 'Asia/Barnaul', '+07:00', '-07:00'),
('RU', 'Russia', 'Asia/Chita', '+09:00', '-09:00'),
('RU', 'Russia', 'Asia/Irkutsk', '+08:00', '-08:00'),
('RU', 'Russia', 'Asia/Kamchatka', '+12:00', '-12:00'),
('RU', 'Russia', 'Asia/Khandyga', '+09:00', '-09:00'),
('RU', 'Russia', 'Asia/Krasnoyarsk', '+07:00', '-07:00'),
('RU', 'Russia', 'Asia/Magadan', '+11:00', '-11:00'),
('RU', 'Russia', 'Asia/Novokuznetsk', '+07:00', '-07:00'),
('RU', 'Russia', 'Asia/Novosibirsk', '+07:00', '-07:00'),
('RU', 'Russia', 'Asia/Omsk', '+06:00', '-06:00'),
('RU', 'Russia', 'Asia/Sakhalin', '+11:00', '-11:00'),
('RU', 'Russia', 'Asia/Srednekolymsk', '+11:00', '-11:00'),
('RU', 'Russia', 'Asia/Tomsk', '+07:00', '-07:00'),
('RU', 'Russia', 'Asia/Ust-Nera', '+10:00', '-10:00'),
('RU', 'Russia', 'Asia/Vladivostok', '+10:00', '-10:00'),
('RU', 'Russia', 'Asia/Yakutsk', '+09:00', '-09:00'),
('RU', 'Russia', 'Asia/Yekaterinburg', '+05:00', '-05:00'),
('RU', 'Russia', 'Europe/Astrakhan', '+04:00', '-04:00'),
('RU', 'Russia', 'Europe/Kaliningrad', '+02:00', '-02:00'),
('RU', 'Russia', 'Europe/Kirov', '+03:00', '-03:00'),
('RU', 'Russia', 'Europe/Moscow', '+03:00', '-03:00'),
('RU', 'Russia', 'Europe/Samara', '+04:00', '-04:00'),
('RU', 'Russia', 'Europe/Saratov', '+04:00', '-04:00'),
('RU', 'Russia', 'Europe/Simferopol', '+03:00', '-03:00'),
('RU', 'Russia', 'Europe/Ulyanovsk', '+04:00', '-04:00'),
('RU', 'Russia', 'Europe/Volgograd', '+04:00', '-04:00'),
('RW', 'Rwanda', 'Africa/Kigali', '+02:00', '-02:00'),
('BL', 'Saint Barthélemy', 'America/St_Barthelemy', '-04:00', '+04:00'),
('SH', 'Saint Helena', 'Atlantic/St_Helena', '+00:00', '+00:00'),
('KN', 'Saint Kitts and Nevis', 'America/St_Kitts', '-04:00', '+04:00'),
('LC', 'Saint Lucia', 'America/St_Lucia', '-04:00', '+04:00'),
('MF', 'Saint Martin', 'America/Marigot', '-04:00', '+04:00'),
('PM', 'Saint Pierre and Miquelon', 'America/Miquelon', '-03:00', '+03:00'),
('VC', 'Saint Vincent and the Grenadines', 'America/St_Vincent', '-04:00', '+04:00'),
('WS', 'Samoa', 'Pacific/Apia', '+14:00', '-14:00'),
('SM', 'San Marino', 'Europe/San_Marino', '+01:00', '-01:00'),
('ST', 'Sao Tome and Principe', 'Africa/Sao_Tome', '+01:00', '-01:00'),
('SA', 'Saudi Arabia', 'Asia/Riyadh', '+03:00', '-03:00'),
('SN', 'Senegal', 'Africa/Dakar', '+00:00', '+00:00'),
('RS', 'Serbia', 'Europe/Belgrade', '+01:00', '-01:00'),
('SC', 'Seychelles', 'Indian/Mahe', '+04:00', '-04:00'),
('SL', 'Sierra Leone', 'Africa/Freetown', '+00:00', '+00:00'),
('SG', 'Singapore', 'Asia/Singapore', '+08:00', '-08:00'),
('SX', 'Sint Maarten', 'America/Lower_Princes', '-04:00', '+04:00'),
('SK', 'Slovakia', 'Europe/Bratislava', '+01:00', '-01:00'),
('SI', 'Slovenia', 'Europe/Ljubljana', '+01:00', '-01:00'),
('SB', 'Solomon Islands', 'Pacific/Guadalcanal', '+11:00', '-11:00'),
('SO', 'Somalia', 'Africa/Mogadishu', '+03:00', '-03:00'),
('ZA', 'South Africa', 'Africa/Johannesburg', '+02:00', '-02:00'),
('GS', 'South Georgia and the South Sandwich Islands', 'Atlantic/South_Georgia', '-02:00', '+02:00'),
('KR', 'South Korea', 'Asia/Seoul', '+09:00', '-09:00'),
('SS', 'South Sudan', 'Africa/Juba', '+03:00', '-03:00'),
('ES', 'Spain', 'Africa/Ceuta', '+01:00', '-01:00'),
('ES', 'Spain', 'Atlantic/Canary', '+00:00', '+00:00'),
('ES', 'Spain', 'Europe/Madrid', '+01:00', '-01:00'),
('LK', 'Sri Lanka', 'Asia/Colombo', '+05:30', '-05:30'),
('SD', 'Sudan', 'Africa/Khartoum', '+02:00', '-02:00'),
('SR', 'Suriname', 'America/Paramaribo', '-03:00', '+03:00'),
('SJ', 'Svalbard and Jan Mayen', 'Arctic/Longyearbyen', '+01:00', '-01:00'),
('SZ', 'Swaziland', 'Africa/Mbabane', '+02:00', '-02:00'),
('SE', 'Sweden', 'Europe/Stockholm', '+01:00', '-01:00'),
('CH', 'Switzerland', 'Europe/Zurich', '+01:00', '-01:00'),
('SY', 'Syria', 'Asia/Damascus', '+02:00', '-02:00'),
('TW', 'Taiwan', 'Asia/Taipei', '+08:00', '-08:00'),
('TJ', 'Tajikistan', 'Asia/Dushanbe', '+05:00', '-05:00'),
('TZ', 'Tanzania', 'Africa/Dar_es_Salaam', '+03:00', '-03:00'),
('TH', 'Thailand', 'Asia/Bangkok', '+07:00', '-07:00'),
('TG', 'Togo', 'Africa/Lome', '+00:00', '+00:00'),
('TK', 'Tokelau', 'Pacific/Fakaofo', '+13:00', '-13:00'),
('TO', 'Tonga', 'Pacific/Tongatapu', '+13:00', '-13:00'),
('TT', 'Trinidad and Tobago', 'America/Port_of_Spain', '-04:00', '+04:00'),
('TN', 'Tunisia', 'Africa/Tunis', '+01:00', '-01:00'),
('TR', 'Turkey', 'Europe/Istanbul', '+03:00', '-03:00'),
('TM', 'Turkmenistan', 'Asia/Ashgabat', '+05:00', '-05:00'),
('TC', 'Turks and Caicos Islands', 'America/Grand_Turk', '-05:00', '+05:00'),
('TV', 'Tuvalu', 'Pacific/Funafuti', '+12:00', '-12:00'),
('VI', 'U.S. Virgin Islands', 'America/St_Thomas', '-04:00', '+04:00'),
('UG', 'Uganda', 'Africa/Kampala', '+03:00', '-03:00'),
('UA', 'Ukraine', 'Europe/Kiev', '+02:00', '-02:00'),
('UA', 'Ukraine', 'Europe/Uzhgorod', '+02:00', '-02:00'),
('UA', 'Ukraine', 'Europe/Zaporozhye', '+02:00', '-02:00'),
('AE', 'United Arab Emirates', 'Asia/Dubai', '+04:00', '-04:00'),
('GB', 'United Kingdom', 'Europe/London', '+00:00', '+00:00'),
('US', 'United States', 'America/Adak', '-10:00', '+10:00'),
('US', 'United States', 'America/Anchorage', '-09:00', '+09:00'),
('US', 'United States', 'America/Boise', '-07:00', '+07:00'),
('US', 'United States', 'America/Chicago', '-06:00', '+06:00'),
('US', 'United States', 'America/Denver', '-07:00', '+07:00'),
('US', 'United States', 'America/Detroit', '-05:00', '+05:00'),
('US', 'United States', 'America/Indiana/Indianapolis', '-05:00', '+05:00'),
('US', 'United States', 'America/Indiana/Knox', '-06:00', '+06:00'),
('US', 'United States', 'America/Indiana/Marengo', '-05:00', '+05:00'),
('US', 'United States', 'America/Indiana/Petersburg', '-05:00', '+05:00'),
('US', 'United States', 'America/Indiana/Tell_City', '-06:00', '+06:00'),
('US', 'United States', 'America/Indiana/Vevay', '-05:00', '+05:00'),
('US', 'United States', 'America/Indiana/Vincennes', '-05:00', '+05:00'),
('US', 'United States', 'America/Indiana/Winamac', '-05:00', '+05:00'),
('US', 'United States', 'America/Juneau', '-09:00', '+09:00'),
('US', 'United States', 'America/Kentucky/Louisville', '-05:00', '+05:00'),
('US', 'United States', 'America/Kentucky/Monticello', '-05:00', '+05:00'),
('US', 'United States', 'America/Los_Angeles', '-08:00', '+08:00'),
('US', 'United States', 'America/Menominee', '-06:00', '+06:00'),
('US', 'United States', 'America/Metlakatla', '-09:00', '+09:00'),
('US', 'United States', 'America/New_York', '-05:00', '+05:00'),
('US', 'United States', 'America/Nome', '-09:00', '+09:00'),
('US', 'United States', 'America/North_Dakota/Beulah', '-06:00', '+06:00'),
('US', 'United States', 'America/North_Dakota/Center', '-06:00', '+06:00'),
('US', 'United States', 'America/North_Dakota/New_Salem', '-06:00', '+06:00'),
('US', 'United States', 'America/Phoenix', '-07:00', '+07:00'),
('US', 'United States', 'America/Sitka', '-09:00', '+09:00'),
('US', 'United States', 'America/Yakutat', '-09:00', '+09:00'),
('US', 'United States', 'Pacific/Honolulu', '-10:00', '+10:00'),
('UM', 'United States Minor Outlying Islands', 'Pacific/Midway', '-11:00', '+11:00'),
('UM', 'United States Minor Outlying Islands', 'Pacific/Wake', '+12:00', '-12:00'),
('UY', 'Uruguay', 'America/Montevideo', '-03:00', '+03:00'),
('UZ', 'Uzbekistan', 'Asia/Samarkand', '+05:00', '-05:00'),
('UZ', 'Uzbekistan', 'Asia/Tashkent', '+05:00', '-05:00'),
('VU', 'Vanuatu', 'Pacific/Efate', '+11:00', '-11:00'),
('VA', 'Vatican', 'Europe/Vatican', '+01:00', '-01:00'),
('VE', 'Venezuela', 'America/Caracas', '-04:00', '+04:00'),
('VN', 'Vietnam', 'Asia/Ho_Chi_Minh', '+07:00', '-07:00'),
('WF', 'Wallis and Futuna', 'Pacific/Wallis', '+12:00', '-12:00'),
('EH', 'Western Sahara', 'Africa/El_Aaiun', '+01:00', '-01:00'),
('YE', 'Yemen', 'Asia/Aden', '+03:00', '-03:00'),
('ZM', 'Zambia', 'Africa/Lusaka', '+02:00', '-02:00'),
('ZW', 'Zimbabwe', 'Africa/Harare', '+02:00', '-02:00');


DROP TABLE IF EXISTS system_site_type;
CREATE TABLE IF NOT EXISTS system_site_type(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    system_site_type_id uuid primary key DEFAULT gen_random_uuid(),
    system_site_type_code varchar(36) unique,

    site_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO system_site_type(system_site_type_id, system_site_type_code, site_type_title) VALUES
('686815d1-1d56-45bd-bf54-7d8f4db4e19d', 'SITE', 'Site'),
('6793e361-8f98-42c5-837e-4e4caa53145f', 'PORT', 'Port');

DROP TABLE IF EXISTS company_site_type;
CREATE TABLE IF NOT EXISTS company_site_type(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_site_type_id uuid primary key DEFAULT gen_random_uuid(),
    company_site_type_code varchar(36) unique,

    company_id uuid not null,
    system_site_type_id uuid not null,

    site_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO company_site_type(company_site_type_id, company_id, system_site_type_id, site_type_title) VALUES
('23b4493a-0730-4e30-b80f-e18cb65eb536', 'b45c8a43-b247-4c75-b352-c6b4337186be','686815d1-1d56-45bd-bf54-7d8f4db4e19d', 'Site'),
('51ad669b-2c12-4b94-9f7f-827472e19611', 'b45c8a43-b247-4c75-b352-c6b4337186be','6793e361-8f98-42c5-837e-4e4caa53145f', 'Port');

DROP TABLE IF EXISTS company_site_type_title;
CREATE TABLE IF NOT EXISTS company_site_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_site_type_id uuid,
    site_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_site_type_id, lang)
);

DROP TABLE IF EXISTS site;
CREATE TABLE IF NOT EXISTS site(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    site_id uuid primary key DEFAULT gen_random_uuid(),
    site_code varchar(36) unique,

    company_id uuid,
    sub_company_id uuid,
    branch_id uuid,

    company_site_type_id uuid,

    site_short_code varchar(36),
    site_title varchar(120),

    country_id uuid,
    province_id uuid,
    district_id uuid,
    commune_id uuid,
    village_id uuid,
    site_address varchar(250),
    postal_code varchar(50),
    contact_person varchar(100),
    contact_phone varchar(100),
    contact_email varchar(100),
    latitude double precision,
    longitude double precision,
    timezone varchar(100),


    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS site_title;
CREATE TABLE IF NOT EXISTS site_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    site_id uuid,
    site_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (site_id, lang)
);


DROP TABLE IF EXISTS company_customer_platform;
CREATE TABLE IF NOT EXISTS company_customer_platform(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_platform_id uuid primary key DEFAULT gen_random_uuid(),
    company_customer_platform_code varchar(36) unique,

    company_id uuid,
    system_customer_platform_id uuid,

    customer_platform_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );
INSERT INTO company_customer_platform(company_customer_platform_id, company_id, system_customer_platform_id, customer_platform_title) VALUES
('60748a26-af6e-4aae-a6b7-ee88b4293a4c', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'ba296073-fb73-4928-a184-7040b025791c', 'Direct Customer'),
('0148bfc4-3082-4d0d-a8e5-58b7ea5c218c', 'b45c8a43-b247-4c75-b352-c6b4337186be', '972c1e3d-9ea9-4daf-ae29-0f64146754aa', 'In-Direct Customer');

DROP TABLE IF EXISTS company_customer_platform_title;
CREATE TABLE IF NOT EXISTS company_customer_platform_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_platform_id uuid,
    customer_platform_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_platform_id, lang)
);

DROP TABLE IF EXISTS company_customer_type;
CREATE TABLE IF NOT EXISTS company_customer_type(
                                                    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_type_id uuid primary key DEFAULT gen_random_uuid(),
    company_customer_type_code varchar(36) unique,

    company_id uuid,
    system_customer_type_id uuid,

    customer_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO company_customer_type(company_customer_type_id, company_id, system_customer_type_id, customer_type_title) VALUES
('2761c7c2-43cf-416f-978a-5717a5867473', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'd3c785f3-d5e2-410b-a954-ddb343c6fb85', 'Walked In'),
('84034231-0b90-407c-9e29-d6bb8bd28897', 'b45c8a43-b247-4c75-b352-c6b4337186be', '6a7702a2-9a40-4740-baaa-65a3e6ec6c87', 'General Customer'),
('fb7e96dd-c699-4a0f-b41d-db4a9813f88f', 'b45c8a43-b247-4c75-b352-c6b4337186be', '28a1ebe8-5b15-43d0-8403-ba648cf155b8', 'OCEAN'),
('57692bbf-99f1-403f-bd2c-d0f3c1e5bfe7', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'f14cbeaa-f05e-4d24-a65b-5012f1f9b196', 'AIR'),
('e46d6361-05bd-46bb-884a-5ec2355b312e', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'bf16cfb8-31bb-4efc-bf6a-3c79dcb90512', 'TRUCK');

DROP TABLE IF EXISTS company_customer_type_title;
CREATE TABLE IF NOT EXISTS company_customer_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_customer_type_id uuid,
    customer_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_customer_type_id, lang)
);


DROP TABLE IF EXISTS system_salesman_type;
CREATE TABLE IF NOT EXISTS system_salesman_type(
                                                   id serial4, reference_id varchar(36), reference_code varchar(36),

    system_salesman_type_id uuid primary key DEFAULT gen_random_uuid(),
    system_salesman_type_code varchar(36) unique,

    system_salesman_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO system_salesman_type (system_salesman_type_id, system_salesman_type_code, system_salesman_type_title) VALUES
                                                                                                                        ('49a49684-11ec-449b-a773-98585c39667c', 'INTL', 'Internal'),
                                                                                                                        ('83b5c265-f336-4566-afc1-854c1e9f8722', 'CONT', 'Contract'),
                                                                                                                        ('3eb6b974-f957-4569-8eda-0e3f2460407f', 'FRLN', 'Freelance');

DROP TABLE IF EXISTS salesman_type;
CREATE TABLE IF NOT EXISTS salesman_type(
                                            id serial4, reference_id varchar(36), reference_code varchar(36),

    salesman_type_id uuid primary key DEFAULT gen_random_uuid(),
    salesman_type_code varchar(36) unique,

    company_id uuid,
    system_salesman_type_id uuid,

    salesman_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO salesman_type (salesman_type_id, salesman_type_code, company_id, system_salesman_type_id, salesman_type_title) VALUES
                                                                                                                                ('cae7165b-6cfe-4841-9ae6-5bac82437d74', 'INTL', 'b45c8a43-b247-4c75-b352-c6b4337186be', '49a49684-11ec-449b-a773-98585c39667c', 'Internal'),
                                                                                                                                ('22ceac0a-f1fa-496e-ab0a-469e3e29c3be', 'CONT', 'b45c8a43-b247-4c75-b352-c6b4337186be', '83b5c265-f336-4566-afc1-854c1e9f8722', 'Contract'),
                                                                                                                                ('7dd07bd9-bead-4554-81cd-c562f0223eba', 'FRLN', 'b45c8a43-b247-4c75-b352-c6b4337186be', '3eb6b974-f957-4569-8eda-0e3f2460407f', 'Freelance');

DROP TABLE IF EXISTS salesman_type_title;
CREATE TABLE IF NOT EXISTS salesman_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    salesman_type_id uuid,
    salesman_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (salesman_type_id, lang)
);


-- DROP TABLE IF EXISTS sales_group;
CREATE TABLE IF NOT EXISTS sales_group(
                                          id serial4, reference_id varchar(36), reference_code varchar(36),

    sales_group_id uuid primary key DEFAULT gen_random_uuid(),
    sales_group_code varchar(36) unique,

    company_id uuid,

    sales_group_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

INSERT INTO sales_group (sales_group_id, sales_group_code, company_id, sales_group_title) VALUES
    ('0514e96e-0057-490b-a1f1-639732d39873', 'SGP1', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'FWF Logistics');


-- DROP TABLE IF EXISTS sales_group_title;
CREATE TABLE IF NOT EXISTS sales_group_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    sales_group_id uuid,
    sales_group_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (sales_group_id, lang)
);

DROP TABLE IF EXISTS sales_team;
CREATE TABLE IF NOT EXISTS sales_team(
                                         id serial4, reference_id varchar(36), reference_code varchar(36),

    sales_team_id uuid primary key DEFAULT gen_random_uuid(),
    sales_team_code varchar(36) unique,

    company_id uuid,
    sales_group_id uuid,

    sales_team_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );


-- DROP TABLE IF EXISTS sales_team_title;
CREATE TABLE IF NOT EXISTS sales_team_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    sales_team_id uuid,
    sales_team_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (sales_team_id, lang)
);

-- DROP TABLE IF EXISTS salesman;
CREATE TABLE IF NOT EXISTS salesman(
                                       id serial4, reference_id varchar(36), reference_code varchar(36),

    salesman_id uuid primary key DEFAULT gen_random_uuid(),
    salesman_code varchar(36) unique,

    company_id uuid,
    sub_company_id uuid,

    salesman_type_id uuid,
    user_auth_id uuid unique,

    account_number varchar(15) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

-- DROP TABLE IF EXISTS salesman_team;
CREATE TABLE IF NOT EXISTS salesman_team(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    salesman_team_id uuid primary key DEFAULT gen_random_uuid(),

    sales_team_id uuid,
    salesman_id uuid,
    sales_reference_id varchar(50) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS salesman_device;
CREATE TABLE IF NOT EXISTS salesman_device(
                                              id serial4, reference_id varchar(36), reference_code varchar(36),

    salesman_device_id uuid primary key DEFAULT gen_random_uuid(),
    salesman_device_code varchar(36) unique,

    salesman_id uuid,
    device_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS salesman_login;
CREATE TABLE IF NOT EXISTS salesman_login(
                                             id serial4, reference_id varchar(36), reference_code varchar(36),

    salesman_login_id uuid primary key DEFAULT gen_random_uuid(),
    salesman_login_code varchar(36) unique,

    salesman_id uuid,
    salesman_device_id uuid,

    auth_token_type varchar(36),
    auth_token varchar(2500),

    log_in_at timestamp default now(),
    last_log_in_at timestamp default now(),
    log_out_at timestamp,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS system_payment_method;
CREATE TABLE IF NOT EXISTS system_payment_method(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    system_payment_method_id uuid primary key DEFAULT gen_random_uuid(),
    system_payment_method_code varchar(36) unique default null,

    payment_method_title varchar(100) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO system_payment_method(system_payment_method_id, system_payment_method_code, payment_method_title) VALUES
('9dd87578-c356-4cdb-9d80-cba101f58ff1', 'PRD', 'Prepaid'),
('278d9341-ccf6-40d0-908b-e51d39007c0b', 'COl', 'Collect');

DROP TABLE IF EXISTS company_payment_method;
CREATE TABLE IF NOT EXISTS company_payment_method(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_payment_method_id uuid primary key DEFAULT gen_random_uuid(),
    company_payment_method_code varchar(36) unique default null,

    company_id uuid,
    system_payment_method_id uuid,
    payment_method_title varchar(100),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO company_payment_method(company_payment_method_id, company_id, system_payment_method_id, payment_method_title) VALUES
('2a77d394-2a13-4140-abd0-a3bb26cf8267', 'b45c8a43-b247-4c75-b352-c6b4337186be', '9dd87578-c356-4cdb-9d80-cba101f58ff1', 'Freight Prepaid'),
('723f8bf7-4026-49f1-a7f7-ae9086377618', 'b45c8a43-b247-4c75-b352-c6b4337186be', '278d9341-ccf6-40d0-908b-e51d39007c0b', 'Freight Collect');

DROP TABLE IF EXISTS company_payment_method_title;
CREATE TABLE IF NOT EXISTS company_payment_method_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_payment_method_id uuid,
    payment_method_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_payment_method_id, lang)
);
INSERT INTO company_payment_method_title(company_payment_method_id, payment_method_title, lang) VALUES
('2a77d394-2a13-4140-abd0-a3bb26cf8267', 'Freight Prepaid', 'en'),
('2a77d394-2a13-4140-abd0-a3bb26cf8267', 'បង់ប្រាក់មុន', 'kh'),
('723f8bf7-4026-49f1-a7f7-ae9086377618', 'Freight Collect', 'en'),
('723f8bf7-4026-49f1-a7f7-ae9086377618', 'បង់ប្រាក់ពេលទទួលទំនិញ', 'kh');


DROP TABLE IF EXISTS system_payment_gateway;
CREATE TABLE IF NOT EXISTS system_payment_gateway(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    system_payment_gateway_id uuid primary key DEFAULT gen_random_uuid(),
    system_payment_gateway_code varchar(36) unique default null,

    payment_gateway_title varchar(100) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO system_payment_gateway(system_payment_gateway_id, system_payment_gateway_code, payment_gateway_title) VALUES
('2804c384-5a25-4999-9a30-7a05a59943a4', 'CAS', 'Cash'),
('fc96d280-5656-4681-bfec-5b80dcffd6c2', 'CHK', 'Check'),
('6e73bde6-aafd-4ccd-8860-1e5112c5fc7e', 'ABA', 'T/T');

DROP TABLE IF EXISTS company_payment_gateway;
CREATE TABLE IF NOT EXISTS company_payment_gateway(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_payment_gateway_id uuid primary key DEFAULT gen_random_uuid(),
    company_payment_gateway_code varchar(36) unique default null,

    company_id uuid,
    system_payment_gateway_id uuid,

    payment_gateway_title varchar(100) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO company_payment_gateway(company_payment_gateway_id, company_id, system_payment_gateway_id, payment_gateway_title) VALUES
('4bb320b3-2ba7-478a-ba0a-3bcb34b812c4', 'b45c8a43-b247-4c75-b352-c6b4337186be', '2804c384-5a25-4999-9a30-7a05a59943a4', 'Cash'),
('00d0ff7a-2849-4191-b194-4ae0fb3a4941', 'b45c8a43-b247-4c75-b352-c6b4337186be', 'fc96d280-5656-4681-bfec-5b80dcffd6c2', 'Check'),
('c0844aa5-f590-42db-9956-e304cac5449b', 'b45c8a43-b247-4c75-b352-c6b4337186be', '6e73bde6-aafd-4ccd-8860-1e5112c5fc7e', 'T/T');


DROP TABLE IF EXISTS company_payment_gateway_title;
CREATE TABLE IF NOT EXISTS company_payment_gateway_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    company_payment_gateway_id uuid,
    payment_gateway_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (company_payment_gateway_id, lang)
);
INSERT INTO company_payment_gateway_title(company_payment_gateway_id, payment_gateway_title, lang) VALUES
('4bb320b3-2ba7-478a-ba0a-3bcb34b812c4', 'Cash', 'en'),
('4bb320b3-2ba7-478a-ba0a-3bcb34b812c4', 'សាច់ប្រាក់', 'kh'),
('4bb320b3-2ba7-478a-ba0a-3bcb34b812c4', 'Cash', 'cn'),
('00d0ff7a-2849-4191-b194-4ae0fb3a4941', 'Check', 'en'),
('00d0ff7a-2849-4191-b194-4ae0fb3a4941', 'មូលប្បទានបត្រ', 'kh'),
('00d0ff7a-2849-4191-b194-4ae0fb3a4941', 'Check', 'cn'),
('c0844aa5-f590-42db-9956-e304cac5449b', 'T/T', 'en'),
('c0844aa5-f590-42db-9956-e304cac5449b', 'T/T', 'kh'),
('c0844aa5-f590-42db-9956-e304cac5449b', 'T/T', 'cn');

DROP TABLE IF EXISTS customer_category;
CREATE TABLE IF NOT EXISTS customer_category(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_category_id uuid primary key DEFAULT gen_random_uuid(),
    customer_category_code varchar(36) unique default null,

    customer_category_title varchar(100) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO customer_category(customer_category_id, customer_category_code, customer_category_title) VALUES
('acbe3d2d-2451-4913-abcb-7832262f38d0', 'NOM', 'NOMINATE'),
('19fc19e9-8447-4f15-aabd-a768f6e2a4b0', 'FRH', 'FREE-HAND'),
('f76ea15e-f045-449c-98e9-2267cd2f5dda', 'SHP', 'SHIPPER'),
('5fadaeae-acf1-47b9-ba62-f2cc9e5ff740', 'AGN', 'AGENT');

DROP TABLE IF EXISTS customer_category_title;
CREATE TABLE IF NOT EXISTS customer_category_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_category_id uuid,
    customer_category_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (customer_category_id, lang)
);

DROP TABLE IF EXISTS customer_sector;
CREATE TABLE IF NOT EXISTS customer_sector(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_sector_id uuid primary key DEFAULT gen_random_uuid(),
    customer_sector_code varchar(36) unique default null,

    customer_sector_title varchar(100) unique,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO customer_sector(customer_sector_id, customer_sector_code, customer_sector_title) VALUES
('9ce0943d-4665-4d33-9f92-55a27afbdc94', 'RET', 'Retail'),
('ad4caaf0-033d-47a9-b4df-24a6e749be74', 'FBV', 'Food and Beverage'),
('3c846f2f-2ef6-4dad-a51e-dd7f598080cf', 'THL', 'Travel, Hospitality, and Leisure'),
('76fa907f-8bdc-4fd9-8a9b-e0a507c79a12', 'TEL', 'Telecom'),
('4c903153-f3a1-411d-9368-3e0a4ee52cf0', 'FIB', 'Finance, Insurance, and Banking'),
('b30b8494-b3ef-443a-b33c-a3cffb4b620a', 'MNF', 'Manufacturing'),
('b7c73f08-df3f-4ab9-942d-b6de0eae9ed2', 'TEC', 'Technology'),
('5be5cd8f-9ec8-49a6-b747-5f4fabace22a', 'ENU', 'Energy and Utilities'),
('97b71f96-a221-40ab-b16f-1624e4c6bda2', 'PHH', 'Pharmaceuticals and Healthcare'),
('1aaebc6d-30ec-4b21-87fb-70f26111b2ec', 'TRL', 'Transportation and Logistics'),
('5d4e65f8-73ae-4ea4-91d2-35e051822a3f', 'NPS', 'Not-for-Profit and Public Sector'),
('e0ebc469-b8fc-4be6-8d7f-a04b6e976a9d', 'EDU', 'Education'),
('1458503c-534b-47a0-ad98-c2a943b133ef', 'CNS', 'Construction'),
('748c5000-7375-4ee2-85c4-cd740a8b7515', 'AGR', 'Agriculture'),
('b8a991c3-ae0c-4953-a8dc-92ac9807c305', 'RLE', 'Real Estate'),
('d1645971-76d5-4777-8853-994b4ef1903c', 'OTH', 'Others');

DROP TABLE IF EXISTS customer_sector_title;
CREATE TABLE IF NOT EXISTS customer_sector_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_sector_id uuid,
    customer_sector_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (customer_sector_id, lang)
);

DROP TABLE IF EXISTS approach_status;
CREATE TABLE IF NOT EXISTS approach_status(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    approach_status_id uuid primary key DEFAULT gen_random_uuid(),
    approach_status_code varchar(36) unique default null,

    approach_status_title varchar(100) unique,
    order_level int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO approach_status(approach_status_id, approach_status_code, approach_status_title, order_level) VALUES
('2ba13979-7164-4544-9d04-27ac54d7199f', 'APR', 'Approach', 1),
('479d655e-eed7-4a39-834e-f1cb375f00a8', 'CON', 'Contacted', 2),
('e195269f-2c1d-4cce-a35f-2182c9c0d5a4', 'QUO', 'Quote', 3),
('33ed592c-7cba-4dc5-b246-fa71f6c5192b', 'AWD', 'Awarded', 4);

DROP TABLE IF EXISTS approach_status_title;
CREATE TABLE IF NOT EXISTS approach_status_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    approach_status_id uuid,
    approach_status_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (approach_status_id, lang)
);

-- DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_id uuid primary key DEFAULT gen_random_uuid(),
    customer_code varchar(36) unique default null,

    company_id uuid,
    sub_company_id uuid,

    branch_id uuid,
    operation_branch_id uuid,

    parent_customer_id uuid default null,
    company_customer_platform_id uuid default null,

    customer_category_id uuid,
    company_customer_type_id uuid,
    customer_sector_id uuid,
    customer_status int, -- 1=Approach, 2=Awarded
    created_approach_status int,
    customer_approach_status_id uuid,

    salesman_team_id uuid default null,

    account_number varchar(15) unique not null,
    customer_name varchar(100) not null,
    username varchar(36) unique,
    password varchar(250),
    secret_password varchar(500),
    force_change_password smallint default 0,
    allow_change_password smallint default 0,
    password_expire_in_second int default null,
    password_expire_at timestamp default null,
    last_change_password_at timestamp default null,
    last_login_at timestamp default null,
    activated_login_at timestamp default now(),
    updated_password_by uuid default null,
    updated_password_at timestamp default null,

    verify_email varchar(100) unique,
    verify_email_at timestamp default null,
    verify_phone_number varchar(50) unique,
    verify_phone_number_at timestamp default null,

    first_name varchar(100),
    last_name varchar(100),
    full_name varchar(200),
    gender varchar(8),
    phone_number varchar(50),
    email varchar(100),
    fax_number varchar(50),
    address varchar(250),
    country_id uuid,
    province_id uuid,
    district_id uuid,
    commune_id uuid,
    village_id uuid,

    invoicing_vat_tin varchar(30) unique,
    invoicing_customer_name_native varchar(100),
    invoicing_customer_name_en varchar(100),
    invoicing_telephone varchar(100),
    invoicing_phone_number varchar(100),
    invoicing_email varchar(100),
    invoicing_address_native varchar(250),
    invoicing_address_en varchar(250),

    map_latitude double precision default null,
    map_longitude double precision default null,
    postal_code varchar(30),

    pod_at_branch_status int default 0,

    remark_description varchar(1000) default null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS customer_approach_status;
CREATE TABLE IF NOT EXISTS customer_approach_status(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_approach_status_id uuid primary key DEFAULT gen_random_uuid(),
    customer_approach_status_code varchar(36) unique,

    customer_id uuid not null ,
    approach_status_id uuid not null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS customer_approach_status_file_manager;
CREATE TABLE IF NOT EXISTS customer_approach_status_file_manager(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_approach_status_file_manager_id uuid primary key DEFAULT gen_random_uuid(),
    customer_approach_status_file_manager_code varchar(36) unique,

    customer_approach_status_id uuid not null ,
    file_manager_id uuid,
    file_title varchar(150),
    file_description varchar(200),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS customer_approach_status_file_manager_file_title;
CREATE TABLE IF NOT EXISTS customer_approach_status_file_manager_file_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_approach_status_file_manager_id uuid,
    file_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (customer_approach_status_file_manager_id, lang)
);

DROP TABLE IF EXISTS customer_address;
CREATE TABLE IF NOT EXISTS customer_address(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_address_id uuid primary key DEFAULT gen_random_uuid(),
    customer_address_code varchar(36) unique,

    customer_id uuid not null ,
    primary_status smallint,
    address_title varchar(100),
    contact_name varchar(100) not null ,
    contact_phone varchar(100) not null ,
    contact_email varchar(100),
    country_id uuid not null,
    province_id uuid not null,
    district_id uuid not null,
    commune_id uuid,
    village_id uuid,
    address varchar(250),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
DROP TABLE IF EXISTS customer_address_title;
CREATE TABLE IF NOT EXISTS customer_address_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_address_id uuid,
    address_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (customer_address_id, lang)
);

DROP TABLE IF EXISTS customer_file_manager;
CREATE TABLE IF NOT EXISTS customer_file_manager(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_file_manager_id uuid primary key DEFAULT gen_random_uuid(),
    customer_file_manager_code varchar(36) unique,

    customer_id uuid not null ,
    file_manager_id uuid not null,
    file_title varchar(150),
    file_description varchar(200),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
DROP TABLE IF EXISTS customer_file_manager_file_title;
CREATE TABLE IF NOT EXISTS customer_file_manager_file_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_file_manager_id uuid,
    file_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (customer_file_manager_id, lang)
);


DROP TABLE IF EXISTS customer_device;
CREATE TABLE IF NOT EXISTS customer_device(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_device_id uuid primary key DEFAULT gen_random_uuid(),
    customer_device_code varchar(36) unique,

    customer_id uuid,
    device_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_login;
CREATE TABLE IF NOT EXISTS customer_login(
                                             id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_login_id uuid primary key DEFAULT gen_random_uuid(),
    customer_login_code varchar(36) unique,

    customer_id uuid,
    customer_device_id uuid,

    auth_token_type varchar(36),
    auth_token varchar(2500),
    auth_active_at timestamp default now(),
    log_in_at timestamp default now(),

    ip_address varchar(250),
    latitude double precision,
    longitude double precision,
    
    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS customer_login_history;
CREATE TABLE IF NOT EXISTS customer_login_history(
                                              id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_login_history_id uuid primary key DEFAULT gen_random_uuid(),
    customer_login_history_code varchar(36) unique,

    customer_id uuid,
    customer_device_id uuid,

    auth_token_type varchar(36),
    auth_token varchar(2500),
    auth_active_at timestamp default now(),

    log_in_at timestamp default now(),
    log_out_at timestamp,

    ip_address varchar(250),
    latitude double precision,
    longitude double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS customer_auth;
CREATE TABLE IF NOT EXISTS customer_auth(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_code varchar(36) unique,

    customer_id uuid,

    account_number varchar(15) unique,
    username varchar(36) unique,
    password varchar(250),
    secret_password varchar(500),
    force_change_password smallint default 0,
    allow_change_password smallint default 0,
    password_expire_in_second int default null,
    password_expire_at timestamp default null,
    last_change_password_at timestamp default null,
    last_login_at timestamp default null,
    activated_login_at timestamp default now(),
    updated_password_by uuid default null,
    updated_password_at timestamp default null,

    verify_email varchar(100),
    verify_email_at timestamp default null,
    verify_phone_number varchar(50),
    verify_phone_number_at timestamp default null,

    first_name varchar(100),
    last_name varchar(100),
    full_name varchar(200),
    gender varchar(8),

    contact_person varchar(100),
    contact_telephone varchar(100) default null,
    contact_phone varchar(100),
    contact_email varchar(100) default null,

    national_id_number varchar(50),
    national_id_expire_date date,
    national_id_image_id uuid,
    passport_number varchar(50),
    passport_expire_date date,
    passport_id_image_id uuid,

    country_id uuid,
    province_id uuid,
    district_id uuid,
    commune_id uuid default null,
    address varchar(250),
    map_latitude double precision default null,
    map_longitude double precision default null,
    postal_code int default null,

    pod_at_branch_status int default 0,

    company_payment_method_id uuid default null,
    payment_method_remark varchar(250) default null,

    cod_endorsed_account_number varchar(50) default null,
    cod_endorsed_account_ref varchar(100) default null,
    cod_endorsed_account_remark varchar(100) default null,
    cod_collected_commission double precision default 0,

    remark_description varchar(250) default null,

    salesman_id uuid default null,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_auth_device;
CREATE TABLE IF NOT EXISTS customer_auth_device(
                                                   id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_device_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_device_code varchar(36) unique,

    customer_auth_id uuid,
    device_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_auth_login;
CREATE TABLE IF NOT EXISTS customer_auth_login(
                                                  id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_login_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_login_code varchar(36) unique,

    customer_auth_id uuid,
    customer_auth_device_id uuid,

    auth_token_type varchar(36),
    auth_token varchar(2500),

    log_in_at timestamp default now(),
    last_log_in_at timestamp default now(),
    log_out_at timestamp,

    ip_address varchar(250),
    device_os_title varchar(120),
    latitude double precision,
    longitude double precision,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_auth_system_role;
CREATE TABLE IF NOT EXISTS customer_auth_system_role(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_system_role_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_system_role_code varchar(36) unique,

    customer_auth_id uuid,
    customer_system_role_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_auth_system_role_authority_extend;
CREATE TABLE IF NOT EXISTS customer_auth_system_role_authority_extend(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_system_role_extend_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_system_role_extend_code varchar(36) unique,

    customer_auth_id uuid,
    customer_system_role_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_auth_mobile_role;
CREATE TABLE IF NOT EXISTS customer_auth_mobile_role(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_mobile_role_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_mobile_role_code varchar(36) unique,

    customer_auth_id uuid,
    customer_mobile_role_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );

DROP TABLE IF EXISTS customer_auth_mobile_role_authority_extend;
CREATE TABLE IF NOT EXISTS customer_auth_mobile_role_authority_extend(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    customer_auth_mobile_role_extend_id uuid primary key DEFAULT gen_random_uuid(),
    customer_auth_mobile_role_extend_code varchar(36) unique,

    customer_auth_id uuid,
    customer_mobile_role_authority_id uuid,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
    );


DROP TABLE IF EXISTS commodity_type;
CREATE TABLE IF NOT EXISTS commodity_type(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    commodity_type_id uuid primary key DEFAULT gen_random_uuid(),
    commodity_type_code varchar(36) unique,

    company_id uuid,
    commodity_type_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS commodity_type_title;
CREATE TABLE IF NOT EXISTS commodity_type_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    commodity_type_id uuid,
    commodity_type_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (commodity_type_id, lang)
);

DROP TABLE IF EXISTS commodity;
CREATE TABLE IF NOT EXISTS commodity(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    commodity_id uuid primary key DEFAULT gen_random_uuid(),
    commodity_code varchar(36) unique,

    commodity_type_id uuid,
    commodity_title varchar(120),
    sorting_order int,
    commodity_icon_url varchar(500),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);

DROP TABLE IF EXISTS commodity_title;
CREATE TABLE IF NOT EXISTS commodity_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    commodity_id uuid,
    commodity_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (commodity_id, lang)
);

DROP TABLE IF EXISTS check_point_status;
CREATE TABLE IF NOT EXISTS check_point_status(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_status_id uuid primary key DEFAULT gen_random_uuid(),
    check_point_status_code varchar(36) unique,

    check_point_status_title varchar(120),
    order_level int,
    

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO check_point_status (check_point_status_id, check_point_status_code, check_point_status_title, order_level) VALUES
('e0fc40c5-1b30-48df-b35f-a26670da3155', 'PED', 'Pending', 1),
('b0e61b1f-2e01-44b4-9234-2ce47b0de02b', 'CFM', 'Confirmed', 2),
('9796788d-3d61-4109-957b-42c53dc47243', 'TRN', 'In Transit', 3),
('c0e2dd9e-8a7b-478e-8abc-e648ce39034a', 'DEL', 'Delivered', 4),
('1a64c3b0-0ab3-44b0-84a7-56efb83f9f9c', 'CAN', 'Cancelled', 5);

DROP TABLE IF EXISTS check_point_status_title;
CREATE TABLE IF NOT EXISTS check_point_status_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_status_id uuid,
    check_point_status_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (check_point_status_id, lang)
);

DROP TABLE IF EXISTS check_point;
CREATE TABLE IF NOT EXISTS check_point(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_id uuid primary key DEFAULT gen_random_uuid(),
    check_point_code varchar(36) unique,

    check_point_status_code varchar(36),
    check_point_status_id uuid not null,
    once_operation_status int DEFAULT 0,
    in_warehouse_status int default 0,
    check_point_title varchar(120),
    next_word_title varchar(100),
    concat_check_point_status int,
    required_remark_description int default 0,
    required_completed_check_point_id uuid default null,
    required_destination_status int default 0,
    required_shipment_closed int default 0,
    push_notification_status int default 0,
    notification_title varchar(120),
    notification_message varchar(120),
    group_number int default null,
    order_status int default null,
    icon_url varchar(500),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO check_point(check_point_id, check_point_code, check_point_status_id, once_operation_status, check_point_title, required_remark_description, order_status) VALUES

('04d8da48-df1f-4d2b-bfb6-71642d9744c7', '2025001', 'e0fc40c5-1b30-48df-b35f-a26670da3155', 1, 'Created Booking', 0, 1),
('0df7b70c-7dac-4da4-bf3a-1268efb23f91', '2025002', 'b0e61b1f-2e01-44b4-9234-2ce47b0de02b', 1, 'Confirmed', 0, 2),
('d6861679-13cc-411a-96d5-8f5fc7df9bae', '2025003', '9796788d-3d61-4109-957b-42c53dc47243', 0, 'In Transit', 0, 3),
('55e0fcb3-f2b2-4301-9d07-080c50c4c449', '2025004', 'c0e2dd9e-8a7b-478e-8abc-e648ce39034a', 1, 'Delivered', 0, 4),
('164782ad-ab90-4264-8853-721d3f711eba', '2025005', '1a64c3b0-0ab3-44b0-84a7-56efb83f9f9c', 1, 'Cancelled', 0, 5);

DROP TABLE IF EXISTS check_point_title;
CREATE TABLE IF NOT EXISTS check_point_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_id uuid,
    check_point_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (check_point_id, lang)
);

DROP TABLE IF EXISTS check_point_next_word_title;
CREATE TABLE IF NOT EXISTS check_point_next_word_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_id uuid,
    check_point_next_word_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (check_point_id, lang)
);

DROP TABLE IF EXISTS check_point_notification_title;
CREATE TABLE IF NOT EXISTS check_point_notification_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_id uuid,
    check_point_notification_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (check_point_id, lang)
);

DROP TABLE IF EXISTS check_point_notification_message;
CREATE TABLE IF NOT EXISTS check_point_notification_message(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    check_point_id uuid,
    check_point_notification_message varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (check_point_id, lang)
);

DROP TABLE IF EXISTS logistics_service;
CREATE TABLE IF NOT EXISTS logistics_service(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    logistics_service_id uuid primary key DEFAULT gen_random_uuid(),
    logistics_service_code varchar(36) unique,

    logistics_service_title varchar(120),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO logistics_service(logistics_service_id, logistics_service_code, logistics_service_title) VALUES
('8c8259b0-555f-4c7e-8104-409f7040fab7', 'FRE', 'Freight Service'),
('ec8b7790-c898-4758-8e92-97dca7e8ec1b', 'CLE', 'Clearance Service');

DROP TABLE IF EXISTS logistics_service_title;
CREATE TABLE IF NOT EXISTS logistics_service_title(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    logistics_service_id uuid,
    logistics_service_title varchar(120) default null,
    lang varchar(5),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null,
    primary key (logistics_service_id, lang)
);

DROP TABLE IF EXISTS shipping_term;
CREATE TABLE IF NOT EXISTS shipping_term(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_term_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_term_code varchar(36) unique,

    shipping_term_title varchar(120),
    description varchar(250),
    order_level int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO shipping_term(shipping_term_id, shipping_term_code, shipping_term_title, order_level) VALUES
('83324785-da4b-433c-b4e1-9db622167570', 'CYCY', 'CY-CY', 1),
('3650a303-7fa1-49a6-86f8-2bfe9eceff06', 'CFSCFS', 'CFS-CFS', 2);

DROP TABLE IF EXISTS shipping_term_status;
CREATE TABLE IF NOT EXISTS shipping_term_status(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    shipping_term_status_id uuid primary key DEFAULT gen_random_uuid(),
    shipping_term_status_code varchar(36) unique,

    shipping_term_id uuid not null,
    shipping_term_status_title varchar(120),
    description varchar(250),
    order_level int,

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO shipping_term_status(shipping_term_status_id, shipping_term_id, shipping_term_status_title, order_level) VALUES
('90b2fc90-9071-43ae-ab7b-cbe96b04cf6a', '83324785-da4b-433c-b4e1-9db622167570', 'FCL-FCL', 1),
('28b4c2f4-5be6-4130-92bf-b2ce3c414a7c', '3650a303-7fa1-49a6-86f8-2bfe9eceff06', 'LCL-LCL', 2);

DROP TABLE IF EXISTS incoterm;
CREATE TABLE IF NOT EXISTS incoterm(
    id serial4, reference_id varchar(36), reference_code varchar(36),

    incoterm_id uuid primary key DEFAULT gen_random_uuid(),
    incoterm_code varchar(36) unique,

    incoterm_title varchar(120),
    description varchar(250),

    active_at timestamp default now(), expire_at timestamp, operation_status integer default 1 not null, visible_status integer default 1 not null, enable_status integer default 1 not null, deleted_status integer default 0 not null, deleted_remark varchar(250), deleted_by uuid, deleted_at timestamp, created_by uuid, created_at timestamp default now(), updated_by uuid, updated_at timestamp, group_reference_number varchar(36), row_created_at timestamp default now() not null
);
INSERT INTO incoterm(incoterm_id, incoterm_code, incoterm_title) VALUES
('8cef82a4-13aa-40c4-8902-971c4881922c', 'EXW', 'Ex Works (Place)'),
('960941ff-d500-4f83-9546-32750e851ea4', 'FCA', 'Free Carrier (Place)'),
('4f42163f-91e5-43f0-afa9-cdd5c6204826', 'FAS', 'Free Alongside Ship (Port)'),
('73454e5d-7ef0-4332-a249-373f1e602a1d', 'FOB', 'Free On Board (Port)'),
('9f712aad-5038-4be8-a72c-9dbe4057c6ef', 'CFR', 'Cost & Freight (Port)'),
('a2cd6969-ba72-4348-9e08-8546cf72ed0d', 'CIF', 'Cost, Insurance & Freight (Port)'),
('e4bf2ef4-44c1-4e5f-8688-1baff9254cd7', 'CPT', 'Carriage Paid To (Place)'),
('361c65b4-3c6b-4902-bc5e-ea38c3a306d0', 'CIP', 'Carriage & Insurance Paid To (Place)'),
('65e61469-82d7-403e-b079-ccf3fd9fb108', 'DAP', 'Delivered At Place (Place)'),
('66e10ded-b8c2-4b4b-b34e-1f39d89792bd', 'DPU', 'Delivered At Place Unloaded (Place)'),
('a966adfb-ac7b-47f7-974b-fb787808287a', 'DDP', 'Delivered Duty Paid (Place)');
