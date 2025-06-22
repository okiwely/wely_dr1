import request from '@/utils/request'

// 查询关于我们列表
export function listSysWe(query) {
  return request({
    url: '/system/sysWe/list',
    method: 'get',
    params: query
  })
}
// 查询关于我们列表(不分页)
export function noPageListSysWe(query) {
  return request({
    url: '/system/sysWe/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询关于我们详细
export function getSysWe(id) {
  return request({
    url: '/system/sysWe/' + id,
    method: 'get'
  })
}

// 新增关于我们
export function addSysWe(data) {
  return request({
    url: '/system/sysWe',
    method: 'post',
    data: data
  })
}

// 修改关于我们
export function updateSysWe(data) {
  return request({
    url: '/system/sysWe',
    method: 'put',
    data: data
  })
}

// 删除关于我们
export function delSysWe(id) {
  return request({
    url: '/system/sysWe/' + id,
    method: 'delete'
  })
}
