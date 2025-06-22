import request from '@/utils/request'

// 查询汽车管理列表
export function listTbCustomerCar(query) {
  return request({
    url: '/project/tbCustomerCar/list',
    method: 'get',
    params: query
  })
}
// 查询汽车管理列表(不分页)
export function noPageListTbCustomerCar(query) {
  return request({
    url: '/project/tbCustomerCar/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询汽车管理详细
export function getTbCustomerCar(id) {
  return request({
    url: '/project/tbCustomerCar/' + id,
    method: 'get'
  })
}
// 查询汽车管理详细
export function getCarByCustomerId(id) {
  return request({
    url: '/project/tbCustomerCar/getCarByCustomerId/' + id,
    method: 'get'
  })
}

// 新增汽车管理
export function addTbCustomerCar(data) {
  return request({
    url: '/project/tbCustomerCar',
    method: 'post',
    data: data
  })
}

// 修改汽车管理
export function updateTbCustomerCar(data) {
  return request({
    url: '/project/tbCustomerCar',
    method: 'put',
    data: data
  })
}

// 删除汽车管理
export function delTbCustomerCar(id) {
  return request({
    url: '/project/tbCustomerCar/' + id,
    method: 'delete'
  })
}
