## 分页器
### 简单介绍
- 组件需要依赖 sass 插件 ，请自行安装；
- 可自定义显示分页信息，如总条数，每页条数等；
- 欢迎大家下载使用，项目源码示例：[https://gitee.com/lunc9932/pagination](https://gitee.com/lunc9932/pagination)
- 若有插件导入失败，重启编辑器；

### API
#### 属性说明
| 属性名           | 类型      | 默认值   | 说明              |
|---------------|---------|---------|-----------------------|
| total         | Number  | 0       | 数据总条数             |
| pageSize      | Number  | 10      | 每页显示条数           |
| currentPage   | Number  | 1       | 当前页数               |
| mode          | String  | multi   | 显示模式，可选值：multi / simple<br>multi：标准模式；simple：简单模式，只显示当前页/总页数  |
| btnText       | Boolean | false   | 上页、下页、首页和尾页是否使用汉字，默认使用箭头表示  |
| numAround     | Boolean | false   | 是否保留页码中的第一页和最后一个，为true时不再显示首页和尾页，且中间默认使用省略号    |
| forceEllipses | Boolean | false   | 总页码数 超过`showPageSize`时，两端页码是否显示省略号   |
| showPageSize  | Number  | 5       | 显示的页码个数，当使用`numAround`和`forceEllipses`属性时，中间显示的页码个数将 减2   |
| size          | String  | normal  | 按钮大小，可选值：large / normal / small<br>large：大号按钮；normal：普通按钮(默认)；small：小型按钮    |
| color         | String  | #1989FA | 自定义按钮文字颜色   |
| showBorder    | Boolean | true    | 是否显示按钮页码边框     |
| layout        | String  | first,prev,page,next,last    | 自定义分页排版，是否显示 总条数(total)、首页(first)、上页(prev)、页码(page)、下页(next)、尾页(last)、每页条数选项(limit)和页码跳转(jumper)，中间用英文逗号分隔     |
| trigger       | String  | blur    | 页码input输入框跳转页码触发方式，当`layout`值中包含 jumper 此项才生效，可选值：blur / click<br>blur：失去焦点时触发(不显示跳转按钮)；click：点击跳转按钮触发   |
| pageSizes     | Array   | [10, 20, 50]      | 每页条数选项预设值，可选择每页条数，当`layout`值中包含 limit 此项才生效        |

注意：
1. 当`showPageSize`属性数值过大时，可能会出现横向滚动条；
2. 当`showPageSize`属性数值小于3，且`forceEllipses`或`numAround`为 true 时，中间页码将无法显示；
3. 只有当 总页码数 超过`showPageSize`，且属性`forceEllipses`或`numAround`为 true 时，省略号才能显示出来；
4. `layout`分页排版，同样可自定义分页信息显示顺序；
5. 自定义分页信息只需在`<page-pagination>`标签内自定义即可，并不需要写属性；
6. **原`showAround`(是否显示首尾页)、`showPageInfo`(是否显示分页信息)和`showGoPage`(是否显示input输入框)属性已失效，功能已合并到`layout`属性中；**
7. 由于移动端屏幕宽度限制，total、limit和jumper 将显示在页码的下面；PC端(>=450px，可自行在组件样式中修改)显示一行且按照`layout`属性中的顺序显示；
8. 总条数(total)和当前页数(currentPage)是可以动态改变的，请参考项目示例；

#### 事件说明
| 事件名        | 说明                | 返回值                            |
|--------------|---------------------|-----------------------------------|
| @change      | 页码改变时触发       | 返回值e={currentPage(Number),type(String)}，currentPage：当前页；type：点击的类型，详细见下面说明      |
| @sizeChange  | 切换每页条数选项预设值 改变`pageSize`时触发| 返回值e={pageSize(Number)}，pageSize：每页条数                              |

##### type返回类型
| 类型     | 说明 |
| -------- | ---- |
| page     | 表示点击的是页码 |
| prev     | 点击的是上页 |
| next     | 点击的是下页 |
| homePage | 点击的是首页 |
| endPage  | 点击的是尾页 |
| goPage   | 页码input输入框触发 |

注意：
1. 重复点击同一个页码，不会触发 change 事件，避免不必要的刷新；

### 基本用法
在`template`中使用组件

```
<view class="example-con">总页数：{{page.total}}，当前第{{page.currentPage}}页</view>
<view class="example-btn">
  <view @click="changeTotal">更改总页数555条</view>
  <view style="margin-left: 3.952rem;" @click="changeCurrentPage">更改到第3页</view>
</view>

<view class="title">默认</view>
<page-pagination :total="page.total" :pageSize="page.pageSize" :currentPage="page.currentPage"
  @change="change"></page-pagination>

<view class="title">简单模式（mode="simple"）</view>
<page-pagination :total="page.total" mode="simple"></page-pagination>

<view class="title">无边框（showBorder="false"）</view>
<page-pagination :total="page.total" :currentPage="page.currentPage" :showBorder="false"></page-pagination>

<view class="title">使用汉字表示(btnText)及显示省略号(forceEllipses)</view>
<page-pagination :total="page.total" :btnText="true" :forceEllipses="true"></page-pagination>

<view class="title">保留页码中的第一页和最后一页(numAround)</view>
<page-pagination :total="page.total" :numAround="true" :showBorder="false"></page-pagination>

<view class="title">附加功能(总条数、每页条数 及 页码跳转)(layout)</view>
<page-pagination :total="page.total" layout="total,first,prev,page,next,last,limit,jumper"></page-pagination>

<view class="title">附加功能自定义显示分页项及排列顺序 和<br>自定义每页显示个数选择器的选项设置(pageSizes)</view>
<page-pagination class="test-pagination" :numAround="true" :total="page.total" layout="page,prev,next,limit,total"
  :pageSizes="[10,50,60,100]" @sizeChange="sizeChange">
</page-pagination>

<view class="title">自定义显示分页信息</view>
<page-pagination :total="page.total" :pageSize="page.pageSize" :showBorder="false" :numAround="true">
  <view>total：{{page.total}}，pageSize：{{page.pageSize}}</view>
</page-pagination>

<view class="title">大号按钮(size="large")</view>
<page-pagination :total="page.total" :showBorder="false" :showPageSize="4" size="large"></page-pagination>

<view class="title">小型按钮(size="small")</view>
<page-pagination :total="page.total" :showBorder="false" :showPageSize="6" size="small"></page-pagination>

<view class="title">自定义颜色(color="#F56C6C")</view>
<page-pagination :total="page.total" :forceEllipses="true" :btnText="true" color="#F56C6C"></page-pagination>
<page-pagination :total="page.total" :forceEllipses="true" :btnText="true" color="#67C23A"></page-pagination>
<page-pagination :total="page.total" :forceEllipses="true" :btnText="true" color="#FF00E3"></page-pagination>
```
在`script`中使用

```
export default {
  data() {
    return {
      page: {
        total: 10000,
        pageSize: 50,
        currentPage: 2
      }
    }
  },
  methods: {
    change(currentPage, type) { // 当前页改变
      this.page.currentPage = currentPage;
      console.log("点击了" + type + "，当前页：" + currentPage);
    },
    sizeChange(pageSize) { // 每页条数改变
      this.page.pageSize = pageSize;
      console.log("每页", pageSize, "条");
    },
    changeTotal() { // 更改总条数
      this.page.total = 555
    },
    changeCurrentPage() { // 更改当前页
      this.page.currentPage = 3
    }
  }
}
```