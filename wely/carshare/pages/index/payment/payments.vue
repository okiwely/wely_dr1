<template>
	<view class="content">
		<headers ref="headers"  style="position: fixed;top:0;left:0;z-index: 1;"></headers>
		<Navigation :pageIndex="'6'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
		<view style="height:14.229rem;"></view>
		<view
			style="width: 113.834rem;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto  3.162rem;text-align: center;padding-bottom:1px;">
			<view style="font-weight: bold;font-size: 1.897rem;padding: 2.529rem 0  1.739rem;">お支払い方法の選択</view>
			<view style="font-size:  1.581rem;color: #666666;">お支払い方法を選択してください</view>
			<view class="flex" style="width:20.158rem;margin: 5.613em auto 4.032rem;align-items: center;padding-left:3.94rem;">
				<image v-if="types==0" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
				<image @click="qiehuan(0)" v-else style="width: 1.739rem;height:  1.739rem;cursor: pointer;" src="/static/images/isc.png"></image>
				<view @click="qiehuan(0)" style="margin:0 0 0 1.106rem;cursor: pointer;">クレジットカード</view>
			</view>
			<view class="flex" style="width:20.158rem;margin: auto;align-items: center;padding-left:3.94rem;">
				<image v-if="types==1" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png"></image>
				<image @click="qiehuan(1)" v-else style="width: 1.739rem;height:  1.739rem;cursor: pointer;" src="/static/images/isc.png"></image>
				<view @click="qiehuan(1)" style="margin:0 0 0 1.106rem;cursor: pointer;">Paypay</view>
			</view>

			<view style="font-size: 1.581rem;color: #666666;margin-top:10.356rem;">Welyはfincode社の決済サービスを通じて請求および決済を行っております
			</view>
			<view class="buttons" @click="submit">お支払い情報の入力へ</view>
		</view>
		<view style="height:16.126rem"></view>
		<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
		<toast ref="toast"></toast>
	</view>
</template>
<script src="../../../https/fincode"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	export default {
		data() {
			return {
				check: false,
				
				types: 0,
				id: '',
				transaction: {
					id: "",
					pay_type: 'Card',
					access_id: '',
					card_no: '',
					expire: '',
					method: '1'
				},
				expire_mm: '',
				expire_yy: '',
				holder_name: '',
				security_code: '',
				amount: "500",
				fincode: ''
			}
		},
		onLoad(option) {
			if (option) {
				if (option.id) {
					this.id = option.id
				}
			}
			this.loads()
			console.log(this.fincode, 'console.log(this.fincode)----------111111')
			this.fincode = this.Fincode(
				'p_prod_NjlkYjhkN2YtMDZiYy00MThhLTk0ZDktYmQ5MjQ2ZWFjOTc0ZDIzOWZjYjYtZDdjOC00MmIyLWFmZTQtOWMxYmQ5MzliZTIzc18yNDA4MDY2OTExNQ'
			);

			console.log(this.fincode, 'console.log(this.fincode)---------22222222222222')
		},
		onShow(){
			var data = getApp().globalData.Informations
			setTimeout(()=>{
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			submit() {
				this.transaction.expire = this.expire_yy + this.expire_mm;
				console.log(this.transaction);

				var apikey = "Bearer m_prod_NWY4YmYwYzgtZjRiNi00MTIyLTljNDItNjFmYzBkYWZlYTk0MWMwOGNlM2QtZTBmYi00NjFjLThlNzktZTkyNGQwMDU0ZTk1c18yNDA4MDY2OTExNQ";
					
				var datas = {
					pay_type: "Card",
					job_code: "CAPTURE",
					amount: '1',
				};

				//axiosでリクエストデータ送信
				uni.request({
					url: 'https://api.fincode.jp/v1/payments', //真实接口地址。
					method: "POST", //请求的方式
					// proxy: PROXY_URL,
					header: {
						"Content-Type": "application/json; charset=utf-8",
						Authorization: apikey,
					},
					data:datas , //参数
					// 成功使用resolve
					success: (res) => {
						console.log(res, '----------')
						//決済登録APIのレスポンスを設定
						this.transaction.id = res.data.id;
						this.transaction.shop_id = res.data.shop_id;
						this.transaction.access_id = res.data.access_id;

						//決済実行JS呼び出し
						this.fincode.payments(this.transaction, function(status, response) {
								if (status === 200) {
									console.log(response);
									// リクエスト正常時の処理
									alert("決済が完了しました")
								} else {
									// リクエストエラー時の処理
									console.log(response);
									response.errors.forEach(error => {
										alert(error.error_message + "(" + error.error_code + ")");

									});
								}
							},
							function() {
								// 通信エラー処理。
								alert("通信エラーが発生しました。しばらく経ってから再度お試しください。");
							});
					},
					//时报调用reject
					fail: (err) => {
						console.log(err, '---------------')
					}
				});
				// uni.navigateTo({
				// 	url: '/pages/index/evaluate/evaluate'
				// })
			},
			Fincode(apiKey) {
				var config;
				if (_checkRequire(apiKey)) return {
					config: config = {
						api: {
							host: "https://api.fincode.jp/",
							context: "v1"
						},
						headers: {
							accept: "application/json",
							contentType: "application/json",
							tenantShopId: "",
							idempotentKey: ""
						},
						apiKey: apiKey
					},
					setTenantShopId: function(tenantShopId) {
						if (!_checkRequire(tenantShopId)) throw new Error("tenantShopId が指定されていません");
						! function(tenantShopId) {
							config.headers.tenantShopId = tenantShopId
						}(tenantShopId)
					},
					setIdempotentKey: function(idempotentKey) {
						if (!_checkRequire(idempotentKey)) throw new Error("idempotentKey が指定されていません");
						! function(idempotentKey) {
							config.headers.idempotentKey = idempotentKey
						}(idempotentKey)
					},
					payments: function(transaction, callBack, errorCallBack) {
						if (!_checkRequire(transaction)) throw new Error("transaction が指定されていません");
						let id = null;
						var data = {};
						if (_isObject(transaction))
							for (let i = 0, keys = Object.keys(transaction); i < keys.length; i++) {
								var key = keys[i];
								"id" == key ? id = transaction[key] : data[key] = transaction[key]
							}
						if (!_checkRequire(id)) throw new Error("transaction.id が指定されていません");
						! function(order_id, transaction, callBack, errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/payments/" + order_id, "PUT",
								transaction,
								callBack, errorCallBack)
						}(id, data, callBack, errorCallBack)
					},
					cards: function(card, callBack, errorCallBack) {
						if (!_checkRequire(card)) throw new Error("card が指定されていません");
						let customer_id = null,
							card_id = null;
						var data = {};
						if (_isObject(card))
							for (let i = 0, keys = Object.keys(card); i < keys.length; i++) {
								var key = keys[i];
								"customer_id" == key ? customer_id = card[key] : "card_id" == key ? card_id = card[
										key] :
									data[key] = card[key]
							}
						if (!_checkRequire(customer_id)) throw new Error("card.customer_id が指定されていません");
						_checkRequire(card_id) ? function(customer_id, card_id, card, callBack, errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/customers/" + customer_id +
								"/cards/" + card_id, "PUT", card, callBack, errorCallBack)
						}(customer_id, card_id, data, callBack, errorCallBack) : function(customer_id, card,
							callBack,
							errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/customers/" + customer_id +
								"/cards",
								"POST", card, callBack, errorCallBack)
						}(customer_id, data, callBack, errorCallBack)
					},
					tokens: function(card, callBack, errorCallBack) {
						if (!_checkRequire(card)) throw new Error("card が指定されていません");
						var data = {};
						if (_isObject(card))
							for (let i = 0, keys = Object.keys(card); i < keys.length; i++) {
								var key = keys[i];
								data[key] = card[key]
							}! function(card, callBack, errorCallBack) {
								_sendRequest(config.api.host + config.api.context + "/tokens/cards", "POST", card,
									callBack,
									errorCallBack)
							}(data, callBack, errorCallBack)
					},
					getCardsList: function(customer_id, callBack, errorCallBack) {
						if (!_checkRequire(customer_id)) throw new Error("customer_id が指定されていません");
						! function(customer_id, callBack, errorCallBack) {
							_sendRequest(config.api.host + config.api.context + "/customers/" + customer_id +
								"/cards",
								"GET", "", callBack, errorCallBack)
						}(customer_id, callBack, errorCallBack)
					},
					ui: function(appearance) {
						if (!_checkRequire(appearance)) throw new Error("appearance が指定されていません");
						if (_isObject(appearance))
							for (let i = 0, keys = Object.keys(appearance); i < keys.length; i++) {
								var key = keys[i];
								key, appearance[key]
							}
						return _ui(appearance)
					}
				};
				throw new Error("Public key が指定されていません");

				function _checkRequire(arg) {
					return null != arg && "" !== arg
				}

				function _isObject(obj) {
					return "object" == (void 0 === obj ? "undefined" : typeof obj) && null !== obj
				}

				function _sendRequest(url, method, data, callBack, errorCallBack) {
					var xhr = new XMLHttpRequest;
					xhr.open(method, url), xhr.setRequestHeader("Accept", config.headers.accept), xhr.setRequestHeader(
						"Content-Type", config.headers.contentType), xhr.setRequestHeader("Authorization", "Bearer " +
						config
						.apiKey), _checkRequire(config.headers.tenantShopId) && xhr.setRequestHeader("Tenant-Shop-Id",
						config
						.headers.tenantShopId), _checkRequire(config.headers.idempotentKey) && xhr.setRequestHeader(
						"idempotent_key", config.headers.idempotentKey), xhr.addEventListener("load", () => {
						null != callBack && "function" == typeof callBack && callBack(xhr.status, JSON.parse(xhr
							.response))
					}), xhr.addEventListener("error", () => {
						null != errorCallBack && "function" == typeof errorCallBack && errorCallBack(
							"request errro.")
					}), xhr.send(JSON.stringify(data))
				}

				function _ui(appearance) {
					var ui;
					if (_checkRequire(appearance)) return ui = {
						api: {
							host: "https://js.fincode.jp/_templates/CardPaymentInputElements",
							host2: "https://js.fincode.jp",
							context: "v1",
							urls: ""
						},
						apiKey: config.apiKey,
						appearance: appearance,
						elementId: "",
						tenantShopId: config.headers.tenantShopId,
						form: {
							cardNo: "",
							CVC: "",
							year: "",
							month: ""
						}
					}, window.addEventListener("message", function(event) {
						return event.origin !== ui.api.host2 ? 0 : "getCardData" == event.data.action ? (ui
							.form = event
							.data.form, event.data.form) : void("iframeSize" == event.data.action && (event
							.data
							.size, document.getElementById(ui.elementId + "-ui").style.height =
							parseInt(event
								.data.size.height, 10) + 80 + "px", document.getElementById(ui
								.elementId +
								"-form").style.height = document.getElementById(ui.elementId + "-form")
							.scrollHeight + 12 + "px", document.getElementById(ui.elementId).style
							.width = event
							.data.size.width))
					}), {
						appearance: ui,
						create: function(method, appearance, callBack, errorCallBack) {
							if (!_checkRequire(appearance)) throw new Error("appearance が指定されていません");
							if (!_checkRequire(method)) throw new Error("method が指定されていません");
							var data = {};
							if (_isObject(appearance))
								for (let i = 0, keys = Object.keys(appearance); i < keys.length; i++) {
									var key = keys[i];
									data[key] = appearance[key]
								}
							_create(method, data)
						},
						mount: function(elementId, width = "500", callBack, errorCallBack) {
							if (!_checkRequire(elementId)) throw new Error("elementId が指定されていません");
							"loading" === document.readyState && console.warn("DOM が読み込まれていません"),
								function(elementId, width = "500") {
									parseInt(width, 10) <= 250 ? width = "250" : 768 <= parseInt(width, 10) &&
										(width =
											"768"), ui.elementId = elementId;
									const base = document.getElementById(elementId);
									var base2 = document.getElementById(elementId + "-form"),
										formWidth = parseInt(width, 10) + 30,
										fragment = (base2.setAttribute("style", "width:" + formWidth +
												"px; height:250px; padding:1.186rem; margin:1.186rem; border-radius:0.5em; box-shadow: 0px 0px 0px 0.5px rgb(50 50 93 / 10%), 0px 2px 5px 0px rgb(50 50 93 / 10%), 0px 1px 1.5px 0px rgb(0 0 0 / 7%)"
											), "fincode" === ui.appearance.theme ? base2.style
											.backgroundColor =
											"#000054" : "dark" === ui.appearance.theme ? base2.style
											.backgroundColor =
											"#1f1f1f" : base2.style.backgroundColor = "#" + ui.appearance
											.colorBackground, (obj = document.createElement("iframe")).id =
											elementId +
											"-ui", obj.setAttribute("frameBorder", "0"), obj.setAttribute(
												"scrolling",
												"no"), obj.style.width = width + "px", obj.style.height =
											"500px", obj
											.src = ui.api.urls, document.createDocumentFragment());
									fragment.appendChild(obj), "complete" === document.readyState ? null ===
										document
										.getElementById(obj.id) && base.appendChild(fragment) : null ===
										document
										.getElementById(obj.id) && window.addEventListener("load", function() {
											null === document.getElementById(obj.id) && base.appendChild(
												fragment)
										})
								}(elementId, width)
						},
						getFormData: async function() {
							return data = await _get()
						},
						destroy: function(callBack, errorCallBack) {
							if (!_checkRequire(ui.elementId)) throw new Error("elementId が存在しません");
							var elementId;
							elementId = ui.elementId, document.getElementById(elementId).innerHTML = ""
						}
					};
					throw new Error("Appearance が指定されていません");

					function _create(method, appearance) {
						! function(method, appearance) {
							var data = appearance,
								appearance = (appearance.apiKey = config.apiKey, appearance.tenantShopId = config.headers
									.tenantShopId, new URLSearchParams(data).toString()),
								data = encodeURI(appearance),
								appearance = ui.api.host + "?method=" + method + "&" + data;
							ui.api.urls = appearance
						}(method, appearance)
					}
					async function _get() {
						var num;
						return document.getElementById(ui.elementId + "-ui").contentWindow.postMessage({
							action: "getCardData"
						}, ui.api.host2), num = 30, await new Promise(s => setTimeout(s, num)), ui.form
					}
				}
			},
			qiehuan(type) {
				this.types = type
			},
			bindPickerChange(e) {
				if (e.detail.value == 0) {
					location.href =
						"https://docs.google.com/forms/d/e/1FAIpQLSfqk-lAtoGQNyGD3GNZYL4FosfnUkZBvQk4pIqMj7sm1lNv-A/viewform"
				} else {
					this.index = e.detail.value
				}
			},
			loads() {

			},
			register() {
				uni.navigateTo({
					url: '/pages/login/register'
				})
			}
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #F6F6F6;
	}

	.content {
		min-height: 100vh;
		position: relative;

		.buttons {
			margin:  3.162rem auto 7.115rem;
			width: 35.89rem;
			height: 5.85rem;
			background: #F44870;
			border-radius: 1.423rem;
			font-size: 1.897rem;
			color: #FFFFFF;
			line-height: 5.85rem;
			text-align: center;
			cursor: pointer;
		}

		.buttonx {
			margin: 2.213rem auto 0;
			width: 59.763rem;
			height: 6.64rem;
			background: #FFFFFF;
			border-radius: 1.106rem;
			border: 2px solid #FF3D66;
			font-size: 1.897rem;
			color: #FF3D66;
			line-height: 6.64rem;
			text-align: center;
			cursor: pointer;
		}
	}
</style>