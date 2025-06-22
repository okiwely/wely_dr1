import request from '@/utils/request'

// 查询行程资金明细;列表
export function listTbRouteDetail(query) {
  return request({
    url: '/project/tbRouteDetail/list',
    method: 'get',
    params: query
  })
}
// 查询行程资金明细;列表(不分页)
export function noPageListTbRouteDetail(query) {
  return request({
    url: '/project/tbRouteDetail/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询行程资金明细;详细
export function getTbRouteDetail(id) {
  return request({
    url: '/project/tbRouteDetail/' + id,
    method: 'get'
  })
}

// 新增行程资金明细;
export function addTbRouteDetail(data) {
  return request({
    url: '/project/tbRouteDetail',
    method: 'post',
    data: data
  })
}

// 修改行程资金明细;
export function updateTbRouteDetail(data) {
  return request({
    url: '/project/tbRouteDetail',
    method: 'put',
    data: data
  })
}

// 删除行程资金明细;
export function delTbRouteDetail(id) {
  return request({
    url: '/project/tbRouteDetail/' + id,
    method: 'delete'
  })
}
