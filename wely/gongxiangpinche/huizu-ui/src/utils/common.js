/** 下载按钮操作 */
export function downloadFile(url){
  if (url != null && url != ''){
    var urlList = url.split(",");
    for (let i = 0; i < urlList.length; i++) {
      this.$download.resource(urlList[i]);
    }
  }
}


// 处理文件名称
export function getFileName(name) {
  if (name.lastIndexOf("/") > -1) {
    return name.slice(name.lastIndexOf("/") + 1);
  } else {
    return "";
  }
}
