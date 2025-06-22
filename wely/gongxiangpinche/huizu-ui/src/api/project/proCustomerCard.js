import request from '@/utils/request'

// 查询信用卡管理列表
export function listProCustomerCard(query) {
  return request({
    url: '/project/proCustomerCard/list',
    method: 'get',
    params: query
  })
}
// 查询信用卡管理列表(不分页)
export function noPageListProCustomerCard(query) {
  return request({
    url: '/project/proCustomerCard/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询信用卡管理详细
export function getProCustomerCard(id) {
  return request({
    url: '/project/proCustomerCard/' + id,
    method: 'get'
  })
}
// 查询信用卡管理详细
export function getProCustomerCardByCustomerId(customerId) {
  return request({
    url: '/project/getProCustomerCard',
    method: 'post',
    data: {
      customerId: customerId
    }
  })
}

// 新增信用卡管理
export function addProCustomerCard(data) {
  return request({
    url: '/project/proCustomerCard',
    method: 'post',
    data: data
  })
}

// 修改信用卡管理
export function updateProCustomerCard(data) {
  return request({
    url: '/project/proCustomerCard',
    method: 'put',
    data: data
  })
}

// 删除信用卡管理
export function delProCustomerCard(id) {
  return request({
    url: '/project/proCustomerCard/' + id,
    method: 'delete'
  })
}
