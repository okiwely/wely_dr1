<template>
	<view>
		<view class="content">
			<headers ref="headers" style="position: fixed;top:0;left:0;z-index: 1;"></headers>
			<view class='pc-only'>


				<Navigation :pageIndex="'6'" style="position: fixed;top: 7.905rem;left:0;z-index: 1;"></Navigation>
				<view style="height:14.229rem;"></view>
				<view v-if="typex == 1"
					style="width: 113.834rem;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto  3.162rem;text-align: center;padding-bottom:1px;">
					<view style="font-weight: bold;font-size: 1.897rem;padding: 2.529rem 0  1.739rem;">アカウントの設定</view>

					<view class="buttons" @click="payfor">設定する</view>
				</view>
				<view v-else
					style="width: 113.834rem;background: #FFFFFF;border-radius:  2.372rem;margin: 2.372rem auto  3.162rem;text-align: center;padding-bottom:1px;">
					<view style="font-weight: bold;font-size: 1.897rem;padding: 2.529rem 0  1.739rem;">支払い口座の選択です</view>
					<view style="font-size:  1.581rem;color: #666666;">お支払いアカウントの選択をお願いします</view>
					<view class="flex"
						style="width:20.158rem;margin: 5.613em auto 4.032rem;align-items: center;padding-left:3.94rem;">
						<image v-if="types==1" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png">
						</image>
						<image @click="qiehuan(1)" v-else style="width: 1.739rem;height:  1.739rem;cursor: pointer;"
							src="/static/images/isc.png"></image>
						<view @click="qiehuan(1)" style="margin:0 0 0 1.106rem;cursor: pointer;">{{holder_name}}</view>
					</view>
					<view class="flex" style="width:20.158rem;margin: auto;align-items: center;padding-left:3.94rem;">
						<image v-if="types==0" style="width: 1.739rem;height:  1.739rem;" src="/static/images/xzz.png">
						</image>
						<image @click="qiehuan(0)" v-else style="width: 1.739rem;height:  1.739rem;cursor: pointer;"
							src="/static/images/isc.png"></image>
						<view @click="qiehuan(0)" style="margin:0 0 0 1.106rem;cursor: pointer;">別のアカウントです</view>
					</view>

					<view style="font-size: 1.581rem;color: #666666;margin-top:10.356rem;margin-bottom:2rem">
						Welyはfincode社の決済サービスを通じて請求および決済を行っております
					</view>
					<view v-if='types==0' class="buttons" @click="payfor">新しいカードを登録します</view>
				</view>


				<!-- <div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
					<div class="modal">
						<form id="paymentForm">
							<div class="form-group">
								<label for="cardNo">カード番号:</label>
								<input style='width:95%' v-model="cardNo" type="text" id="cardNo"
									placeholder="123456789012345">
							</div>

							<div class="form-group">
								<label for="expire">有効期間 (年月：2606):</label>
								<input style='width:95%' v-model="expire" type="text" id="expire" placeholder="2606">
							</div>

							<div class="form-group">
								<label for="securityCode">セキュリティコード:</label>
								<input style='width:95%' v-model="security_code" type="text" id="securityCode"
									placeholder="CVC">
							</div>

							<div class="form-group">
								<label for="holderName">カード名義人:</label>
								<input style='width:95%' v-model="holderName" type="text" id="holderName"
									placeholder="TARO YAMADA">
							</div>

							<button type="button" class="payment-button" @click="submitPayment">登録する</button>
						
						</form>

						<div id="result"></div>

						<button @click="showModal = false" class="close-modal-button">閉じる</button>
					</div>
				</div> -->
				<view style="height:16.126rem"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>

			</view>
			<!-- <toast ref="toast"></toast> -->
			<view class='mobile-only'>

				<view style="height:18.69rem;"></view>
				<view v-if="typex == 1"
					style="width:100vw;background: #FFFFFF;border-radius:  2.372rem;text-align: center;padding-bottom:1px;padding-top:6.82rem">
					<view class='text1' style="font-weight: bold;">アカウントの設定</view>

					<view class="buttons" @click="payfor">設定する</view>
				</view>
				<view v-else
					style="width: 100vw;background: #FFFFFF;border-radius:  2.372rem;text-align: center;padding-bottom:1px;padding-top:6.82rem">
					<view class='text1' style="font-weight: bold;margin-top:6.82rem">支払い口座の選択です</view>
					<view class='text1' style="color: #666666;margin-top:3.18rem">お支払いアカウントの選択をお願いします</view>
					<view class="flex"
						style="width:40rem;margin: 5.613em auto 4.032rem;align-items: center;padding-left:3.94rem;">
						<image v-if="types==1" style="width: 3.86rem;height: 3.86rem;" src="/static/images/xzz.png">
						</image>
						<image @click="qiehuan(1)" v-else style="width: 3.86rem;height:  3.86rem;cursor: pointer;"
							src="/static/images/isc.png"></image>
						<view class='text2' @click="qiehuan(1)" style="margin:0 0 0 1.106rem;cursor: pointer;">
							{{holder_name}}
						</view>
					</view>
					<view class="flex" style="width:40rem;margin: auto;align-items: center;padding-left:3.94rem;">
						<image v-if="types==0" style="width: 3.86rem;height:  3.86rem;" src="/static/images/xzz.png">
						</image>
						<image @click="qiehuan(0)" v-else style="width: 3.86rem;height: 3.86rem;cursor: pointer;"
							src="/static/images/isc.png"></image>
						<view class='text2' @click="qiehuan(0)" style="margin:0 0 0 1.106rem;cursor: pointer;">別のアカウントです
						</view>
					</view>

					<view style="width:73rem;font-size: 2.73rem;color: #666666;margin:10.356rem auto 2rem">
						Welyはfincode社の決済サービスを通じて請求および決済を行っております
					</view>
					<view v-if='types==0' class="buttons" @click="payfor">新しいカードを登録します</view>
				</view>


				<view style="height:58.41rem;"></view>
				<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>



			</view>
			<div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
				<div class="modal">
					<!-- <h1>Fincode 支払示例</h1> -->
					<form id="paymentForm">
						<div class="form-group">
							<label for="cardNo">カード番号:</label>
							<input style='width:95%' v-model="cardNo" type="text" id="cardNo"
								placeholder="123456789012345">
						</div>
			
						<div class="form-group">
							<label for="expire">有効期間 (年月：2606):</label>
							<input style='width:95%' v-model="expire" type="text" id="expire" placeholder="2606">
						</div>
			
						<div class="form-group">
							<label for="securityCode">セキュリティコード:</label>
							<input style='width:95%' v-model="security_code" type="text" id="securityCode"
								placeholder="CVC">
						</div>
			
						<div class="form-group">
							<label for="holderName">カード名義人:</label>
							<input style='width:95%' v-model="holderName" type="text" id="holderName"
								placeholder="TARO YAMADA">
						</div>
			
						<button type="button" class="payment-button" @click="submitPayment">登録する</button>
						<!--  @click="submitPayment" -->
					</form>
			
					<div id="result"></div>
			
					<!-- 关闭弹窗按钮 -->
					<button @click="showModal = false" class="close-modal-button">閉じる</button>
				</div>
			</div>
			
			<toast ref="toast"></toast>
		</view>
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
				showModal: false,
				types: 0,
				customerId: '',
				id: '',
				user: {
					cardNo: '',
					expire: '',
					security_code: '',
					holder_name: '',
				},
				transaction: {
					id: "",
					pay_type: 'Card',
					access_id: '',
					cardNo: '',
					expire: '',
					method: '1'
				},
				expire_mm: '',
				expire_yy: '',
				holder_name: '',
				security_code: '',
				amount: "500",
				fincode: '',
				publicKey: 'p_prod_MjFkMjM4ODQtY2I3YS00MzRlLWE5MDMtMGJkMTgxYzAxZWRiNTYyYzUxM2EtZDExZi00MWIwLTg1NmUtMDFkNDhlZjMzMWU3c18yNDA4MDY2OTExNQ',
				cardNo: '',
				expire: '',
				securityCode: '',
				holderName: '',
				typex: 1
			}
		},
		onLoad(option) {
			if (option) {
				if (option.id) {
					this.typex = 2
					this.id = option.id
				}
			}
			this.loads()
			console.log(this.fincode, 'console.log(this.fincode)----------111111')
			this.fincode = this.Fincode(
				'p_prod_MjFkMjM4ODQtY2I3YS00MzRlLWE5MDMtMGJkMTgxYzAxZWRiNTYyYzUxM2EtZDExZi00MWIwLTg1NmUtMDFkNDhlZjMzMWU3c18yNDA4MDY2OTExNQ'
			);
			//获取用户绑卡信息user

			console.log(this.fincode, 'console.log(this.fincode)---------22222222222222')
		},
		onShow() {
			console.log(12345)
			var data = getApp().globalData.Informations
			this.customerId = uni.getStorageSync('customerId')

			setTimeout(() => {
				this.$refs.headers.gengxin(data)
				this.getPayInfo()
			}, 300)
		},

		methods: {
			submit() {
				this.transaction.expire = this.expire_yy + this.expire_mm;
				console.log(this.transaction);

				var apikey =
					"Bearer m_prod_NWY4YmYwYzgtZjRiNi00MTIyLTljNDItNjFmYzBkYWZlYTk0MWMwOGNlM2QtZTBmYi00NjFjLThlNzktZTkyNGQwMDU0ZTk1c18yNDA4MDY2OTExNQ";

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
					data: datas, //参数
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
							// host:"https://api.test.fincode.jp/v1/",
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
						console.log(card, '--------card----------------')
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
			getPayInfo() {
				this.$httpapi('project/getProCustomerCard', 'POST', {
					customerId: this.customerId
				}).then(res => {
					if (res.code == '200' && res.data.name) {
						this.holder_name = res.data.name

						this.types = 1
						this.user = {
							cardNo: res.data.cardNo,
							expire: res.data.expire.replace(/\//g, ''),
							security_code: res.data.securityCode,
							holder_name: res.data.name,
						}
						if (res.data.cardNo) {
							this.typex = 2
						}
					} else {
						// alert(res.msg)
					}

				})
			},
			submitPayment() {
				var that = this
				// 确保 Fincode 库已经加载
				console.log(this.Fincode)
				const {
					cardNo,
					expire,
					security_code,
					holder_name
				} = this.user;
				if(!(cardNo || this.cardNo)){
					this.$utils.showtt('入力内容に誤りがあります。1')
					return
				}
				if(!(expire || this.expire)){
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if(!(security_code || this.security_code)){
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				if(!(holder_name || this.holderName)){
					this.$utils.showtt('入力内容に誤りがあります。')
					return
				}
				
				if (typeof this.Fincode !== 'undefined') {
					const fincode = this.Fincode(this.publicKey);

					const card = {
						card_no: cardNo || this.cardNo,
						expire: (expire && expire.replace(/\//g, '') )|| (this.expire && this.expire.replace(/\//g,'')),
						security_code: security_code || this.security_code,
						holder_name: holder_name || this.holderName,
					};
					this.$httpapi('project/addProCustomerCard', 'POST', {
						cardNo: this.cardNo,
						expire: this.expire,
						securityCode: this.security_code,
						name: this.holderName,
						customerId: this.customerId
					}).then(res => {
						if (res.code == '200') {

							this.getPayInfo()
							this.showModal = false
						} else {
							alert(res.msg)
						}

					})

					// 使用 Fincode 生成 Token
					fincode.tokens(card, (status, response) => {
							if (status === 200) {
								// console.log('Token 成功生成:', response);
								// 		this.$refs.toast.show({
								// 			message: '',
								// 			duration: 2000
								// 		});

								// alert('绑定成功！')
								// that.$httpapi('project/payOrder', 'POST', {
								// 	orderCode:'',
								// 	customerId:'',
								// 	cardNo:'',
								// 	securityCode:"",
								// 	expire:'',
								// 	name:'',
								// 	token:response.list[0].token
								// }).then(res => {
								// 	// this.listCar = res.rows
								// 	if (res.code == 500) {
								// 		// this.$refs.toast.show({
								// 		// 	message: res.msg,
								// 		// 	duration: 2000
								// 		// });
								// 	}
								// })

								// document.getElementById('result').innerText = '生成的 Token: ' + response.list[0].token;
								// 发送 Token 到后端（此处省略，见之前的代码）
							} else {
								// console.error('生成 Token 失败:', response);
								// alert(response.errors[0].error_message)
								this.$refs.toast.show({
									message: response.errors[0].error_message,
									duration: 2000
								});
								// document.getElementById('result').innerText = 'Token 生成失败: ' + response.message;
							}
						},
						() => {
							console.error('Token 生成过程中发生错误');
							document.getElementById('result').innerText = 'Token 生成过程中发生错误';
						}
					);
				} else {
					console.error('Fincode 库未定义或未正确加载');
					document.getElementById('result').innerText = 'Fincode 库未定义或未正确加载';
				}
			},
			payfor() {
				// console.log(this.types)
				// return
				if (this.types == 1) {
					this.submitPayment()
				} else {
					this.showModal = true
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

	uni-input {
		width: 94%;
	}

	.content {
		min-height: 100vh;
		position: relative;

		.buttons {
			margin: 3.162rem auto 7.115rem;
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

		@media screen and (max-width: 768px) {
			.buttons {
				width: 75.23rem;
				height: 10.23rem;
				background: #F44870;
				border-radius: 2.27rem 2.27rem 2.27rem 2.27rem;
				font-family: Source Han Sans CN, Source Han Sans CN;
				font-weight: 500;
				font-size: 3.41rem;
				color: #FFFFFF;
				line-height: 10.23rem;
				text-align: center;
				font-style: normal;
				text-transform: none;
			}
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

	.content {
		// text-align: center;
		padding: 20px;
	}

	@media screen and (max-width: 768px) {
		.content {
			// text-align: center;
			padding: 0;
		}

		.text1 {
			font-family: PingFang SC, PingFang SC;
			font-weight: 800;
			font-size: 3.64rem;
			color: #000000;
			line-height: 5.68rem;
			text-align: center;
			font-style: normal;
			text-transform: none;
		}

		.text2 {
			font-family: Source Han Sans CN, Source Han Sans CN;
			font-weight: 500;
			font-size: 3.41rem;
			color: #000000;
			text-align: left;
			font-style: normal;
			text-transform: none;
		}
	}

	/* 支付按钮样式 */
	.open-payment-button {
		padding: 12px 20px;
		background-color: #4caf50;
		color: white;
		border: none;
		border-radius: 5px;
		font-size: 16px;
		cursor: pointer;
	}

	/* 模态框遮罩层 */
	.modal-overlay {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: rgba(0, 0, 0, 0.5);
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 800;
	}

	/* 弹窗样式 */
	.modal {
		background-color: #fff;
		padding: 20px;
		border-radius: 10px;
		width: 90%;
		max-width: 400px;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	}

	/* 表单样式 */
	.form-group {
		margin-bottom: 15px;
	}

	label {
		display: block;
		margin-bottom: 5px;
		font-weight: bold;
	}

	input {
		width: 100%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		font-size: 16px;
	}

	.payment-button {
		width: 100%;
		padding: 10px;
		background-color: #4caf50;
		color: white;
		border: none;
		border-radius: 4px;
		font-size: 16px;
		cursor: pointer;
	}

	/* 关闭弹窗按钮样式 */
	.close-modal-button {
		margin-top: 20px;
		background-color: #F44870;
		color: white;
		border: none;
		padding: 10px;
		width: 100%;
		font-size: 16px;
		border-radius: 4px;
		cursor: pointer;
	}
</style>