use ganshahao;

truncate user;
insert into user(nick_name, email, password, description, zip_code, resume, available_time, real_name, is_veteran) values ('test_nick1', 'a@b.com', 'password1', 'description1', 200011, '/doc/resume/id1.doc', '[{},{}]', '来火焰1', 0);
insert into user(nick_name, email, password, description, zip_code, resume, available_time, real_name, is_veteran) values ('test_nick2', 'a@b.com', 'password2', 'description2', 200022, '/doc/resume/id2.doc', '[{},{}]', '来火焰2', 0);
insert into user(nick_name, email, password, description, zip_code, resume, available_time, real_name, is_veteran) values ('test_nick3', 'a@b.com', 'password3', 'description3', 200033, '/doc/resume/id3.doc', '[{},{}]', '来火焰3', 0);

truncate company;
insert into company(name, description) values ('翻太平洋国际大财团1', '我们公司就是牛逼啊1');
insert into company(name, description) values ('翻太平洋国际大财团2', '我们公司就是牛逼啊2');
insert into company(name, description) values ('翻太平洋国际大财团3', '我们公司就是牛逼啊3');

truncate job;
insert into job(company_id, name, updated_time, description, address, zip_code, salary) values (1, '临时工1', NOW(), '猝死排第一', '花还东路', '200011', 10);
insert into job(company_id, name, updated_time, description, address, zip_code, salary) values (1, '临时工2', NOW(), '猝死排第一', '花还东路', '200022', 20);
insert into job(company_id, name, updated_time, description, address, zip_code, salary) values (3, '临时工3', NOW(), '猝死排第一', '花还东路', '200033', 30);

truncate training;
insert into training(job_id, name, description) values (1, '给连四你1', '临时工联系1');
insert into training(job_id, name, description) values (2, '给连四你2', '临时工联系2');
insert into training(job_id, name, description) values (1, '给连四你2', '临时工联系2');

truncate question;
insert into question(training_id, content, choices, answer) values (1, '怎么扫地？', '["方法1", "方法2", "方法3", "方法4"]', 1);
insert into question(training_id, content, choices, answer) values (1, '怎么提水？', '["方法1", "方法2", "方法3", "方法4"]', 2);
insert into question(training_id, content, choices, answer) values (1, '怎么炒菜？', '["方法1", "方法2", "方法3", "方法4"]', 3);

truncate training_completed;
insert into training_completed(training_id, user_id) values (1, 1);
insert into training_completed(training_id, user_id) values (2, 1);
insert into training_completed(training_id, user_id) values (2, 2);

truncate job_application;
insert into job_application(job_id, user_id, status) values (1, 1, 0);
insert into job_application(job_id, user_id, status) values (2, 1, 0);
insert into job_application(job_id, user_id, status) values (1, 2, 0);