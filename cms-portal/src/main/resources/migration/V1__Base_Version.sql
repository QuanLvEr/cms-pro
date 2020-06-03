------------------------
-- table structure for cms_user_primary 用户主表
------------------------
create table cms_user_primary(
  create_time timestamp not null default current_timestamp ,
  update_time timestamp not null default '0000-00-00 00:00:00',
  id int(11) not null auto_increment primary key ,
  username varchar(50) not null comment '用户名',
  password varchar(64) not null comment '用户密码，MD5加密或sha256散列加密',
  salt varchar(64) not null comment '密码盐',
  email varchar(50) not null default '' comment '邮箱',
  login_count int(10) not null default 0 comment '登录次数',
  status tinyint(1) not null default '1' comment '状态',
  deleted tinyint(1) not null default '1' comment '是否已删除(软删除) 0删除 1正常',
  unique key user_name_unique (username) using btree,
  unique key user_email_unique (email) using btree
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into cms_user_primary
(id,create_time,update_time,username,password,salt,email,login_count)values
(1,'2020-05-02 08:50:58',null,'admin','e298f9b29585da289080ffebb32e6f931b52a61195bcf6246d3e0f24654897eb','6e4abc9695661ce11442eaea3cb654','abc@163.com',0),
(2,'2020-05-02 08:50:58',null,'administrator','e298f9b29585da289080ffebb32e6f931b52a61195bcf6246d3e0f24654897eb','6e4abc9695661ce11442eaea3cb654','def@126.com',0);

------------------------
-- table structure for cms_user 用户副表
------------------------

create table cms_user(
  id int(11) not null auto_increment primary key ,
  create_time   timestamp     not null       default current_timestamp ,
  update_time   timestamp     not null       default '0000-00-00 00:00:00',
  group_id      int             null                                   comment '会员组ID',
  username      varchar(50)    not null                               comment '用户名 即手机号',
  email         varchar(50)     not null       default ''             comment '邮箱',
  rank          int             not null       default '0'            comment '管理员级别',
  is_admin      tinyint(1)      not null       default 0              comment '是否后台用户 0否 1是',
  is_super      tinyint(1)      not null       default 0              comment '是否后台用户 0否 1是',
  is_self_admin tinyint(1)      not null      default '0'            comment '是否受限管理员 是否只管理自己的数据 0否 1是',
  register_time timestamp      not null                              comment '注册时间',
  register_ip   varchar(50)    not null       default '127.0.0.1'   comment '注册IP',
  login_count    int(10)       not null        default 0              comment '登录次数',
  upload_total   bigint         not null        default '0'            comment '上传总大小',
  upload_size    int           not null         default '0'          comment '上传大小',
  is_viewonly_admin tinyint(1)  not null        default '0'           comment '是否只读管理员 0否 1是',
  upload_date   timestamp       null                                   comment '上传日期',
  session_id    varchar(200)    not null       default ''             comment '用户session id',
  status         tinyint(1)       not null        default '1'           comment '状态',
  deleted        tinyint(1)       not null        default '1'           comment '是否已删除 0删除 1正常',
  last_login_ip  varchar(30)     not null        default ''             comment '最后登录ip',
  last_login_time timestamp     not null        default '0000-00-00 00:00:00' comment '最后登录时间',
  unique key user_name_unique (username) using btree,
  unique key user_email_unique (email) using btree
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into cms_user (id, create_time, update_time, group_id, username, email, rank, is_admin, is_super,
  is_self_admin, register_time, register_ip, login_count,upload_total, upload_size, is_viewonly_admin,
  upload_date, session_id, status, deleted,last_login_ip, last_login_time)
  values  (1,'2020-05-09 20:41:12',null ,1,'admin','abc@163.com',1, 1,1,0,'2020-05-02 08:50:58','127.0.0.1',0,0,0,0,
  null ,'',0,0,'',null),(2,'2020-05-09 20:41:12',null ,1,'administrator','def@126.com',1,1,1,0,'2020-05-02 08:50:58',
  '127.0.0.1',0,0,0,0,null ,'',0,0,'',null);
