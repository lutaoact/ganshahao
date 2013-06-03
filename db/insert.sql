use ganshahao;
set names utf8;

truncate user;
insert into user(nick_name, email, mobile, password, description, zipcode, resume, available_time, real_name, is_veteran) values ('test_nick1', 'a@a.com', '13800000000', '111', 'description1', 200011, '/doc/resume/id1.doc', '[{},{}]', '来火焰1', 0);
insert into user(nick_name, email, mobile, password, description, zipcode, resume, available_time, real_name, is_veteran) values ('test_nick2', 'a@b.com', '13800000000', '222', 'description2', 200022, '/doc/resume/id2.doc', '[{},{}]', '来火焰2', 0);
insert into user(nick_name, email, mobile, password, description, zipcode, resume, available_time, real_name, is_veteran) values ('test_nick3', 'a@c.com', '13800000000', '333', 'description3', 200033, '/doc/resume/id3.doc', '[{},{}]', '来火焰3', 0);

truncate company;
insert into company(name, logo, description) values ('翻太平洋国际大财团1', 'logo.png', '我们公司就是牛逼啊1');
insert into company(name, logo, description) values ('翻太平洋国际大财团2', 'logo.png', '我们公司就是牛逼啊2');
insert into company(name, logo, description) values ('翻太平洋国际大财团3', 'logo.png', '我们公司就是牛逼啊3');

truncate job;
insert into job(company_id, name, status, updated_time, description, address, zipcode, salary) values (1, '临时工1', 0, NOW(), '猝死排第一', '花还东路', '200011', 10);
insert into job(company_id, name, status, updated_time, description, address, zipcode, salary) values (1, '临时工2', 0, NOW(), '猝死排第二', '花还东路', '200011', 20);
insert into job(company_id, name, status, updated_time, description, address, zipcode, salary) values (2, '临时工1', 0, NOW(), '赚钱排第一', '花还东路', '200011', 10);
insert into job(company_id, name, status, updated_time, description, address, zipcode, salary) values (2, '临时工2', 0, NOW(), '赚钱排第二', '花还东路', '200011', 20);
insert into job(company_id, name, status, updated_time, description, address, zipcode, salary) values (1, '临时工3', 1, NOW(), '猝死排第一', '花还东路', '200022', 20);
insert into job(company_id, name, status, updated_time, description, address, zipcode, salary) values (3, '临时工3', 1, NOW(), '猝死排第一', '花还东路', '200033', 30);

truncate training;
insert into training(job_id, training_type, name, description, link) values (1, 1, '给连四你1', '临时工联系1', '');
insert into training(job_id, training_type, name, description, link) values (1, 2, '给连四你2', '临时工联系2', 'test_description.png');
insert into training(job_id, training_type, name, description, link) values (1, 3, '给连四你2', '临时工联系2', '<embed src="http://player.youku.com/player.php/sid/XNTYxMTg2MTQ4/v.swf" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>');

truncate question;
insert into question(training_id, content, choices, answer) values (1, '怎么扫地？', '["方法1", "方法2", "方法3", "方法4"]', 1);
insert into question(training_id, content, choices, answer) values (1, '怎么提水？', '["方法1", "方法2", "方法3", "方法4"]', 2);
insert into question(training_id, content, choices, answer) values (1, '怎么炒菜？', '["方法1", "方法2", "方法3", "方法4"]', 3);
insert into question(training_id, content, choices, answer) values (2, '怎么扫地2？', '["方法1", "方法2", "方法3", "方法4"]', 3);
insert into question(training_id, content, choices, answer) values (2, '怎么提水2？', '["方法1", "方法2", "方法3", "方法4"]', 2);
insert into question(training_id, content, choices, answer) values (2, '怎么炒菜2？', '["方法1", "方法2", "方法3", "方法4"]', 1);
insert into question(training_id, content, choices, answer) values (3, '怎么扫地3？', '["方法1", "方法2", "方法3", "方法4"]', 3);
insert into question(training_id, content, choices, answer) values (3, '怎么提水3？', '["方法1", "方法2", "方法3", "方法4"]', 2);
insert into question(training_id, content, choices, answer) values (3, '怎么炒菜3？', '["方法1", "方法2", "方法3", "方法4"]', 1);

truncate training_completed;
insert into training_completed(training_id, user_id, score) values (1, 1, 80);
insert into training_completed(training_id, user_id, score) values (2, 1, 90);
insert into training_completed(training_id, user_id, score) values (2, 2, 100);

truncate job_application;
insert into job_application(job_id, user_id, status) values (1, 1, 0);
insert into job_application(job_id, user_id, status) values (2, 1, 0);
insert into job_application(job_id, user_id, status) values (1, 2, 0);
