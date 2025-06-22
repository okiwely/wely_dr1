-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('信用卡管理', '2034', '1', 'proCustomerCard', 'project/proCustomerCard/index', 1, 0, 'C', '0', '0', 'project:proCustomerCard:list', '#', 'admin', sysdate(), '', null, '信用卡管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('查询信用卡管理', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'project:proCustomerCard:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('新增信用卡管理', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'project:proCustomerCard:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('修改信用卡管理', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'project:proCustomerCard:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('删除信用卡管理', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'project:proCustomerCard:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('导出信用卡管理', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'project:proCustomerCard:export',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('详情信用卡管理', @parentId, '6',  '#', '', 1, 0, 'F', '0', '0', 'project:proCustomerCard:details',       '#', 'admin', sysdate(), '', null, '');
