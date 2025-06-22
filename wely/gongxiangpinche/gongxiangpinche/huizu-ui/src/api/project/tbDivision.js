import request from '@/utils/request'

// 查询行政区划列表
export function listTbDivision(query) {
  return request({
    url: '/project/tbDivision/list',
    method: 'get',
    params: query
  })
}
// 查询行政区划列表(不分页)
export function noPageListTbDivision(query) {
  return request({
    url: '/project/tbDivision/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询行政区划详细
export function getTbDivision(id) {
  return request({
    url: '/project/tbDivision/' + id,
    method: 'get'
  })
}

// 新增行政区划
export function addTbDivision(data) {
  return request({
    url: '/project/tbDivision',
    method: 'post',
    data: data
  })
}

// 修改行政区划
export function updateTbDivision(data) {
  return request({
    url: '/project/tbDivision',
    method: 'put',
    data: data
  })
}

// 删除行政区划
export function delTbDivision(id) {
  return request({
    url: '/project/tbDivision/' + id,
    method: 'delete'
  })
}
