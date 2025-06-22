import request from '@/utils/request'

// 查询轮播图信息列表
export function listBanner(query) {
  return request({
    url: '/system/banner/list',
    method: 'get',
    params: query
  })
}
// 查询轮播图信息列表(不分页)
export function noPageListBanner(query) {
  return request({
    url: '/system/banner/noPage/list',
    method: 'get',
    params: query
  })
}

// 查询轮播图信息详细
export function getBanner(id) {
  return request({
    url: '/system/banner/' + id,
    method: 'get'
  })
}

// 新增轮播图信息
export function addBanner(data) {
  return request({
    url: '/system/banner',
    method: 'post',
    data: data
  })
}

// 修改轮播图信息
export function updateBanner(data) {
  return request({
    url: '/system/banner',
    method: 'put',
    data: data
  })
}

// 删除轮播图信息
export function delBanner(id) {
  return request({
    url: '/system/banner/' + id,
    method: 'delete'
  })
}
