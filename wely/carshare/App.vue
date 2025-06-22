<script>
	export default {
		globalData: {
			Informations: ''
		},
		onLaunch: function() {
			this.xinxi()
			this.refreshRem();
			console.log('App Launch')
		},
		onShow: function() {
			console.log(uni.getStorageSync('customerId'),'uni.getStorageSync()--------')
			// this.xinxi()
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		},
		methods: {
			xinxi() {
				if (uni.getStorageSync('customerId')) {
					this.$httpapi('project/getCustomerIntroduce', 'POST', {
						customerId: uni.getStorageSync('customerId')
					}).then(res => {
						if (res.code == 200) {
							this.globalData.Informations = res.data
							this.$forceUpdate()
							uni.setStorageSync('isAuth', res.data.isAuth)
						}
						console.log(res.data, '查看登录信息---------------------')
					})
				}
			},
			show(options) {
				this.isShow = true;
				this.message = options.message || '';
				setTimeout(() => {
					this.isShow = false;
				}, options.duration || this.duration);
			},
			refreshRem() {
				let wW = document.documentElement.clientWidth || document.body.innerWidth || document.body
					.clientWidth || window.screen.width || window.screen.availWidth || document.body
					.clientWidth; // 窗口宽度

				let designSize = 1920; // 设计图尺寸1920 1080
				var rem = (wW / designSize) * 12;
				if (document.documentElement.clientWidth == 1920) {
					if (document.documentElement.clientHeight == 1080) {
						rem = (wW / designSize) * 12;
					} else {
						rem = (wW / designSize) * 11;
					}
				} else if(document.documentElement.clientWidth < 600) {
					rem = (wW / 375) * 4.44;
				}
				else{
					rem = (wW / designSize) * 11;
				}
				document.documentElement.style.fontSize = rem + 'px';
				document.documentElement.lang = "ja";
			}
		}
	}
</script>

<style>
	/*每个页面公共css */
	.pc-only {
		display: block;
	}
	
	.mobile-only {
		display: none;
	}
	
	@media screen and (max-width: 768px) {
		.pc-only {
			display: none;
		}
		.headerx{
			    height: 18.69rem!important;
		}
		.mobile-only {
			display: block;
		}
		.login_h1{
			text-align: left;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.18rem;
			color: #000000;
			line-height: 4.55rem;
			text-align: left;
			font-style: normal;
			text-transform: none;
			// width: 22.05rem;
			height: 4.55rem;
			
		}
		.mobile_input{ 
			width: calc(100vw - 5.46rem);
			height: 9.32rem;
			background: #FFFFFF;
			border-radius: 1.106rem;
			border: 1px solid #707070;
			align-items: center;
			margin: 2.529rem auto 0;
		}
		.inputT{
			font-size: 2.95rem;
			margin-left:3.18rem;
		}
		.detail{
			width: 35.68rem;
			height: 8.64rem;
			border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
			border: 0.14rem solid #F44870;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.18rem;
			color: #F44870;
			line-height: 8.64rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}
		.send{
			width: 35.68rem;
			height: 8.64rem;
			background: #FF3D66;
			border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
			border: 0.14rem solid #F44870;
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.18rem;
			color: #FFFFFF;
			line-height: 8.64rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}
		.list_h{
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.18rem;
			color: #000000;
			height: 7.73rem;
			line-height: 7.73rem;
			text-align: left;
			font-style: normal;
			text-transform: none;
		}
		.list_h1{
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.18rem;
			color: #333333;
			text-align: left;
			font-style: normal;
			text-transform: none;
			margin-left:2.73rem;
		}
		.search_btn{
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: bold;
			font-size: 3.41rem;
			color: #FFFFFF;
			line-height: 8.86rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}
		.price_num{
			width: 35.91rem;
			height: 14.55rem;
			background: #F8F8F8;
			border-radius: 1.82rem 1.82rem 1.82rem 1.82rem;
			font-family: DIN, DIN;
			font-weight: 400;
			font-size: 3.09rem;
			color: #000000;
			text-align: left;
			font-style: normal;
			text-transform: none;
			text-align: center;
		}
		.car_intro{
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 2.73rem;
			color: #333333;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}
	}
	page {
		color: #000;
		font-size: 1.739rem;
	}


	input {
		font-size: 1.739rem;
		text-align: left;
	}

	.uni-toast {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		padding: 2rem;
		font-size: 2rem;
		background-color: rgba(0, 0, 0, 0.6);
		border-radius: 5px;
		color: #fff;
		z-index: 9999;
	}

	.flex {
		display: flex;
	}

	.flexJusp {
		display: flex;
		justify-content: space-between;
	}

	.yihang {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	.erhang {
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
	}
</style>