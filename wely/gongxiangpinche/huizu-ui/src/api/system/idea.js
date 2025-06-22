import request from '@/utils/request'

// 查询意见反馈列表
export function listIdea(query) {
  return request({
    url: '/system/idea/list',
    method: 'get',
    params: query
  })
}
// 查询意见反馈列表(不分页)
export function noPageListIdea(query) {
  return request({
    url: '/system/idea/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询意见反馈详细
export function getIdea(id) {
  return request({
    url: '/system/idea/' + id,
    method: 'get'
  })
}

// 新增意见反馈
export function addIdea(data) {
  return request({
    url: '/system/idea',
    method: 'post',
    data: data
  })
}

// 修改意见反馈
export function updateIdea(data) {
  return request({
    url: '/system/idea',
    method: 'put',
    data: data
  })
}

// 删除意见反馈
export function delIdea(id) {
  return request({
    url: '/system/idea/' + id,
    method: 'delete'
  })
}
