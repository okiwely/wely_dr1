import request from '@/utils/request'

// 查询评价;列表
export function listTbCustomerAppraise(query) {
  return request({
    url: '/project/tbCustomerAppraise/list',
    method: 'get',
    params: query
  })
}
// 查询评价;列表(不分页)
export function noPageListTbCustomerAppraise(query) {
  return request({
    url: '/project/tbCustomerAppraise/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询评价;详细
export function getTbCustomerAppraise(id) {
  return request({
    url: '/project/tbCustomerAppraise/' + id,
    method: 'get'
  })
}

// 新增评价;
export function addTbCustomerAppraise(data) {
  return request({
    url: '/project/tbCustomerAppraise',
    method: 'post',
    data: data
  })
}

// 修改评价;
export function updateTbCustomerAppraise(data) {
  return request({
    url: '/project/tbCustomerAppraise',
    method: 'put',
    data: data
  })
}

// 删除评价;
export function delTbCustomerAppraise(id) {
  return request({
    url: '/project/tbCustomerAppraise/' + id,
    method: 'delete'
  })
}
