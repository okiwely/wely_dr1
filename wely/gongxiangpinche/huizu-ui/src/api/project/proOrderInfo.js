import request from '@/utils/request'

// 查询订单信息列表
export function listProOrderInfo(query) {
  return request({
    url: '/project/proOrderInfo/list',
    method: 'get',
    params: query
  })
}
// 查询订单信息列表(不分页)
export function noPageListProOrderInfo(query) {
  return request({
    url: '/project/proOrderInfo/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询订单信息详细
export function getProOrderInfo(id) {
  return request({
    url: '/project/proOrderInfo/' + id,
    method: 'get'
  })
}

// 新增订单信息
export function addProOrderInfo(data) {
  return request({
    url: '/project/proOrderInfo',
    method: 'post',
    data: data
  })
}

// 修改订单信息
export function updateProOrderInfo(data) {
  return request({
    url: '/project/proOrderInfo',
    method: 'put',
    data: data
  })
}

// 删除订单信息
export function delProOrderInfo(id) {
  return request({
    url: '/project/proOrderInfo/' + id,
    method: 'delete'
  })
}
