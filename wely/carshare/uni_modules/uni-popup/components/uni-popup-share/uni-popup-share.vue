<template>
	<view class="uni-popup-share">
		<view class="uni-share-title"><text class="uni-share-title-text">{{shareTitleText}}</text></view>
		<view class="uni-share-content">
			<view class="uni-share-content-box">
				<view class="uni-share-content-item" v-for="(item,index) in bottomData" :key="index" @click.stop="select(item,index)">
					<image class="uni-share-image" :src="item.icon" mode="aspectFill"></image>
					<text class="uni-share-text">{{item.text}}</text>
				</view>

			</view>
		</view>
		<view class="uni-share-button-box">
			<button class="uni-share-button" @click="close">{{cancelText}}</button>
		</view>
	</view>
</template>

<script>
	import popup from '../uni-popup/popup.js'
	import {
	initVueI18n
	} from '@dcloudio/uni-i18n'
	import messages from '../uni-popup/i18n/index.js'
	const {	t	} = initVueI18n(messages)
	export default {
		name: 'UniPopupShare',
		mixins:[popup],
		emits:['select'],
		props: {
			title: {
				type: String,
				default: ''
			},
			beforeClose: {
				type: Boolean,
				default: false
			}
		},
		data() {
			return {
				bottomData: [{
						text: '微信',
						icon: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/c2b17470-50be-11eb-b680-7980c8a877b8.png',
						name: 'wx'
					},
					{
						text: '支付宝',
						icon: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/d684ae40-50be-11eb-8ff1-d5dcf8779628.png',
						name: 'ali'
					},
					{
						text: 'QQ',
						icon: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/e7a79520-50be-11eb-b997-9918a5dda011.png',
						name: 'qq'
					},
					{
						text: '新浪',
						icon: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/0dacdbe0-50bf-11eb-8ff1-d5dcf8779628.png',
						name: 'sina'
					},
					// {
					// 	text: '百度',
					// 	icon: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/1ec6e920-50bf-11eb-8a36-ebb87efcf8c0.png',
					// 	name: 'copy'
					// },
					// {
					// 	text: '其他',
					// 	icon: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/2e0fdfe0-50bf-11eb-b997-9918a5dda011.png',
					// 	name: 'more'
					// }
				]
			}
		},
		created() {},
		computed: {
			cancelText() {
				return t("uni-popup.cancel")
			},
		shareTitleText() {
				return this.title || t("uni-popup.shareTitle")
			}
		},
		methods: {
			/**
			 * 选择内容
			 */
			select(item, index) {
				this.$emit('select', {
					item,
					index
				})
				this.close()

			},
			/**
			 * 关闭窗口
			 */
			close() {
				if(this.beforeClose) return
				this.popup.close()
			}
		}
	}
</script>
<style lang="scss" >
	.uni-popup-share {
		background-color: #fff;
		border-top-left-radius: 0.869rem;
		border-top-right-radius: 0.869rem;
	}
	.uni-share-title {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		align-items: center;
		justify-content: center;
		height:  3.162rem;
	}
	.uni-share-title-text {
		font-size: 1.106rem;
		color: #666;
	}
	.uni-share-content {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		justify-content: center;
		padding-top: 0.79rem;
	}

	.uni-share-content-box {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		flex-wrap: wrap;
		width: 3 4.743rem;
	}

	.uni-share-content-item {
		width: 7.115rem;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		justify-content: center;
		padding: 0.79rem 0;
		align-items: center;
	}

	.uni-share-content-item:active {
		background-color: #f5f5f5;
	}

	.uni-share-image {
		width:  2.372rem;
		height:  2.372rem;
	}

	.uni-share-text {
		margin-top: 0.79rem;
		font-size: 1.106rem;
		color: #3B4144;
	}

	.uni-share-button-box {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		padding: 0.79rem 1.185rem;
	}

	.uni-share-button {
		flex: 1;
		border-radius: 3.952rem;
		color: #666;
		font-size: 1.264rem;
	}

	.uni-share-button::after {
		border-radius: 3.952rem;
	}
</style>
