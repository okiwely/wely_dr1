import request from '@/utils/request'

// 查询聊天信息列表
export function listTbCustomerChat(query) {
  return request({
    url: '/project/tbCustomerChat/list',
    method: 'get',
    params: query
  })
}
// 查询聊天信息列表(不分页)
export function noPageListTbCustomerChat(query) {
  return request({
    url: '/project/tbCustomerChat/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询聊天信息详细
export function getTbCustomerChat(id) {
  return request({
    url: '/project/tbCustomerChat/' + id,
    method: 'get'
  })
}

// 新增聊天信息
export function addTbCustomerChat(data) {
  return request({
    url: '/project/tbCustomerChat',
    method: 'post',
    data: data
  })
}

// 修改聊天信息
export function updateTbCustomerChat(data) {
  return request({
    url: '/project/tbCustomerChat',
    method: 'put',
    data: data
  })
}

// 删除聊天信息
export function delTbCustomerChat(id) {
  return request({
    url: '/project/tbCustomerChat/' + id,
    method: 'delete'
  })
}
