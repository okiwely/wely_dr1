import request from '@/utils/request'

// 查询客服信息列表
export function listSysService(query) {
  return request({
    url: '/system/sysService/list',
    method: 'get',
    params: query
  })
}
// 查询客服信息列表(不分页)
export function noPageListSysService(query) {
  return request({
    url: '/system/sysService/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询客服信息详细
export function getSysService(id) {
  return request({
    url: '/system/sysService/' + id,
    method: 'get'
  })
}

// 新增客服信息
export function addSysService(data) {
  return request({
    url: '/system/sysService',
    method: 'post',
    data: data
  })
}

// 修改客服信息
export function updateSysService(data) {
  return request({
    url: '/system/sysService',
    method: 'put',
    data: data
  })
}

// 删除客服信息
export function delSysService(id) {
  return request({
    url: '/system/sysService/' + id,
    method: 'delete'
  })
}
