import request from '@/utils/request'

// 查询会员信息列表
export function listProCustomer(query) {
  return request({
    url: '/project/proCustomer/list',
    method: 'get',
    params: query
  })
}
// 查询会员信息列表(不分页)
export function noPageListProCustomer(query) {
  return request({
    url: '/project/proCustomer/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询会员信息详细
export function getProCustomer(id) {
  return request({
    url: '/project/proCustomer/' + id,
    method: 'get'
  })
}

// 新增会员信息
export function addProCustomer(data) {
  return request({
    url: '/project/proCustomer',
    method: 'post',
    data: data
  })
}

// 修改会员信息
export function updateProCustomer(data) {
  return request({
    url: '/project/proCustomer',
    method: 'put',
    data: data
  })
}
// 修改会员信息
export function auditCustomer(data) {
  return request({
    url: '/project/auditCustomer',
    method: 'put',
    data: data
  })
}
// 提现确定
export function updateProCustomerWithdraw(data) {
  return request({
    url: '/project/customerWithdraw',
    method: 'put',
    data: data
  })
}

// 删除会员信息
export function delProCustomer(id) {
  return request({
    url: '/project/proCustomer/' + id,
    method: 'delete'
  })
}
