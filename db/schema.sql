DROP DATABASE IF EXISTS `ganshahao`;
CREATE DATABASE `ganshahao` character set utf8;
USE `ganshahao`;

DROP TABLE IF EXISTS `mobile_loginjack_setting`;
CREATE TABLE mobile_loginjack_setting(
    project_id          smallint unsigned   NOT NULL DEFAULT 0,
    client_name         varchar(255)        NOT NULL DEFAULT '',
    start_datetime      datetime            NOT NULL DEFAULT 0,
    end_datetime        datetime            NOT NULL DEFAULT 0,
    image_width         smallint unsigned   NOT NULL DEFAULT 0,
    image_height        smallint unsigned   NOT NULL DEFAULT 0,
    image_file          varchar(255)        NOT NULL DEFAULT '',
    body_color          char(6)             NOT NULL DEFAULT '',
    font_color          char(6)             NOT NULL DEFAULT '',
    link_color          char(6)             NOT NULL DEFAULT '',
    pr_text             varchar(255)        NOT NULL DEFAULT '',
    logo_img            varchar(255)        NOT NULL DEFAULT '',
    redirect_url_imode  char(24)            NOT NULL DEFAULT '',
    redirect_url_ezweb  char(24)            NOT NULL DEFAULT '',
    redirect_url_vfone  char(24)            NOT NULL DEFAULT '',
    registered_by       varchar(255)        NOT NULL DEFAULT '',
    confirmed_by        varchar(255)        NOT NULL DEFAULT '',
    primary key(`project_id`),
    index(client_name),
    index(start_datetime),
    index(end_datetime)
)Engine=InnoDB;

DROP TABLE IF EXISTS `mobile_loginjack_log`;
CREATE TABLE mobile_loginjack_log(
    log_id          int unsigned        auto_increment,
    action_type     tinyint(2)          NOT NULL DEFAULT 0,
    updated_by      varchar(255)        NOT NULL DEFAULT '',
    updated_detail  varchar(255)        NOT NULL DEFAULT '',
    updated_time    datetime            NOT NULL DEFAULT 0,
    project_id      smallint unsigned   NOT NULL DEFAULT 0,
    client_name     varchar(255)        NOT NULL DEFAULT '',
    start_datetime  datetime            NOT NULL DEFAULT 0,
    end_datetime    datetime            NOT NULL DEFAULT 0,
    primary key(`log_id`)
)Engine=InnoDB;
