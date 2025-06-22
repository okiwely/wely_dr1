import request from '@/utils/request'

// 查询存储app版本相关信息列表
export function listVersion(query) {
  return request({
    url: '/system/version/list',
    method: 'get',
    params: query
  })
}
// 查询存储app版本相关信息列表(不分页)
export function noPageListVersion(query) {
  return request({
    url: '/system/version/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询存储app版本相关信息详细
export function getVersion(id) {
  return request({
    url: '/system/version/' + id,
    method: 'get'
  })
}

// 新增存储app版本相关信息
export function addVersion(data) {
  return request({
    url: '/system/version',
    method: 'post',
    data: data
  })
}

// 修改存储app版本相关信息
export function updateVersion(data) {
  return request({
    url: '/system/version',
    method: 'put',
    data: data
  })
}

// 删除存储app版本相关信息
export function delVersion(id) {
  return request({
    url: '/system/version/' + id,
    method: 'delete'
  })
}
