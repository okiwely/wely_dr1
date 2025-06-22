import request from '@/utils/request'

// 查询客服信息列表
export function listService(query) {
  return request({
    url: '/system/service/list',
    method: 'get',
    params: query
  })
}
// 查询客服信息列表(不分页)
export function noPageListService(query) {
  return request({
    url: '/system/service/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询客服信息详细
export function getService(id) {
  return request({
    url: '/system/service/' + id,
    method: 'get'
  })
}

// 新增客服信息
export function addService(data) {
  return request({
    url: '/system/service',
    method: 'post',
    data: data
  })
}

// 修改客服信息
export function updateService(data) {
  return request({
    url: '/system/service',
    method: 'put',
    data: data
  })
}

// 删除客服信息
export function delService(id) {
  return request({
    url: '/system/service/' + id,
    method: 'delete'
  })
}
