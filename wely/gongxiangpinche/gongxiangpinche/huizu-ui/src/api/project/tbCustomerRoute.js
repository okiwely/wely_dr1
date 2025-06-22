import request from '@/utils/request'

// 查询行程管理;列表
export function listTbCustomerRoute(query) {
  return request({
    url: '/project/tbCustomerRoute/list',
    method: 'get',
    params: query
  })
}
// 查询行程管理;列表(不分页)
export function noPageListTbCustomerRoute(query) {
  return request({
    url: '/project/tbCustomerRoute/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询行程管理;详细
export function getTbCustomerRoute(id) {
  return request({
    url: '/project/tbCustomerRoute/' + id,
    method: 'get'
  })
}

// 新增行程管理;
export function addTbCustomerRoute(data) {
  return request({
    url: '/project/tbCustomerRoute',
    method: 'post',
    data: data
  })
}

// 修改行程管理;
export function updateTbCustomerRoute(data) {
  return request({
    url: '/project/tbCustomerRoute',
    method: 'put',
    data: data
  })
}

// 删除行程管理;
export function delTbCustomerRoute(id) {
  return request({
    url: '/project/tbCustomerRoute/' + id,
    method: 'delete'
  })
}
