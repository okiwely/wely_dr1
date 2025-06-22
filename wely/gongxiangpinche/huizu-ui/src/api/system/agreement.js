import request from '@/utils/request'

// 查询协议管理列表
export function listAgreement(query) {
  return request({
    url: '/system/agreement/list',
    method: 'get',
    params: query
  })
}

// 查询协议管理详细
export function getAgreement(id) {
  return request({
    url: '/system/agreement/' + id,
    method: 'get'
  })
}

// 新增协议管理
export function addAgreement(data) {
  return request({
    url: '/system/agreement',
    method: 'post',
    data: data
  })
}

// 修改协议管理
export function updateAgreement(data) {
  return request({
    url: '/system/agreement',
    method: 'put',
    data: data
  })
}

// 删除协议管理
export function delAgreement(id) {
  return request({
    url: '/system/agreement/' + id,
    method: 'delete'
  })
}
