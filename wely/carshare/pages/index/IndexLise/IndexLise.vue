<template>

	<view class="content">
		<headers ref="headers" title='ドライブ一覧ページ' canGoBack style="position: fixed;top:0;left:0;z-index: 1;"></headers>
		<view class='pc-only'>
			<view style="height: 7.905rem;"></view>
			<view class="flex" style="margin:2.372rem auto;width:139.13rem;">
				<view style="width:30.988rem;">
					<view style="font-weight: bold;font-size: 1.897rem;color: #000000;line-height:1.897rem"><text
							style="cursor: pointer;" @click="indexx">TOPページ>></text><text
							style="color: #FF3D66;">ドライブ一覧ページ</text></view>
					<view
						style="margin-top:3.873rem;width: 27.826rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:1.581rem;padding:1.897rem 1.581rem 2.372rem;">
						<picker @change="bindPickerChange" :value="index" :range="listCity" range-key="city">
							<view class="flexJusp"
								style="width:25.929rem;height: 3.636rem;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0 0.948rem;">
								<view v-if="listCity[index]">{{listCity[index].city}}</view>
								<view v-else>どこから乗りますか?</view>
								<image style="width:1.265rem;height:1.265rem;" src="/static/images/wec.png"></image>
							</view>
						</picker>
						<picker @change="bindPickerChanges" :value="indexs" :range="listCity" range-key="city">
							<view class="flexJusp"
								style="width:25.929rem;height: 3.636rem;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0 0.948rem;margin:1.265rem 0 1.897rem;">
								<view v-if="listCity[indexs]">{{listCity[indexs].city}}</view>
								<view v-else>どこまで乗りますか?</view>
								<image style="width:1.265rem;height:1.265rem;" src="/static/images/wec.png"></image>
							</view>
						</picker>

						<view style="font-weight: bold;font-size:  1.581rem;">日付</view>
						<view class="flexJusp" style="align-items: center;margin:1.265rem 0 1.897rem;">
							<!-- <picker mode="date" :value="date" @change="bindDateChange"> -->
							<view class="flexJusp" @click="onShowDatePicker('date')"
								style="width:19.447rem;height: 3.4rem;border-radius: 7px;border: 1px solid #707070;align-items: center;padding:0 0.948rem;cursor: pointer;">
								<view>{{date||'日付'}}</view>
								<image style="width: 1.739rem;height:1.818rem;" src="/static/images/mnvjyt.png">
								</image>
							</view>
							<!-- </picker> -->
							<!-- <el-date-picker style="width:19.447rem;height:  3.162rem;border-radius: 7px;border: 1px solid #707070;font-size: 1.264rem;" v-model="date" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker> -->
							<view @click="date = ''"
								style="font-size: 1.264rem;color: #FF3D66;line-height: 3.4rem;text-align: center;width: 5.533rem;height: 3.4rem;border-radius: 7px;border: 1px solid #FF3D66;cursor: pointer;">
								クリア</view>
						</view>
						<view style="font-weight: bold;font-size:  1.581rem;">出発時間</view>
						<view class="flexJusp" style="margin:1.265rem 0  2.372rem;align-items: center;">
							<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
								<view class="flexJusp boxs">
									<view>{{shiList[shiIndex]||'00'}}</view>
									<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
									</image>
								</view>
							</picker>
							<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
								<view class="flexJusp boxs">
									<view>{{fenList[fenIndex]||'00'}}</view>
									<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
									</image>
								</view>
							</picker>
							<view style="font-weight: bold;font-size:  1.581rem;">-</view>
							<picker @change="bindPickerChange3" :value="shiIndexs" :range="shiList">
								<view class="flexJusp boxs">
									<view>{{shiList[shiIndexs]||'00'}}</view>
									<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
									</image>
								</view>
							</picker>
							<picker @change="bindPickerChange4" :value="fenIndexs" :range="fenList">
								<view class="flexJusp boxs">
									<view>{{fenList[fenIndexs]||'00'}}</view>
									<image style="width:1.423rem;height:0.869rem;" src="/static/images/rnh.png">
									</image>
								</view>
							</picker>
						</view>
						<view @click="loads"
							style="width: 24.664rem;height: 4.743rem;background: #F44870;border-radius: 1.106rem;font-size:  1.581rem;color: #FFFFFF;line-height: 4.743rem;text-align: center;margin: auto;cursor: pointer;">
							検索する</view>
					</view>
				</view>
				<view style="width:104.98rem;margin:5.85rem 0 0  3.162rem;">
					<view class="flexJusp" style="margin-bottom:2.213rem;align-items: center;">
						<view class="flex" style="font-weight: bold;font-size: 1.739rem;">
							<view>{{page.total}}件</view>
							<view style="margin-left: 2.162rem;">のドライブが見つかりました。</view>
						</view>
						<view style='flex:1'></view>
						<picker @change="bindPickerChangeSort" :value="indexSort" :range="listSort" range-key="city">
							<!-- 	<view class="flexJusp"
										style="width:25.929rem;height: 3.636rem;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;padding:0 0.948rem;margin:1.265rem 0 1.897rem;">
										<view >{{listSort[indexSort]}}</view>
										<image style="width:1.265rem;height:1.265rem;" src="/static/images/wec.png"></image>
									</view>
									 -->
							<!-- @click="paixu" -->
							<view class="flexJusp"
								style="width:21.344rem;height: 3.478rem;border-radius: 1.106rem;border: 1px solid #888888;align-items: center;padding:0 0.948rem;cursor: pointer;">
								<view style="font-size:1.423rem;">{{listSort[indexSort]}}</view>
								<image style="width:1.265rem;height:1.265rem;" src="/static/images/downs.png">
								</image>
							</view>
						</picker>
						<view class="buttonss" @click="addride">ドライブ登録</view>
					</view>
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;">
						<view
							style="width: 26.798rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view class="flex" @click='topersonal(item)'>
								<image style="width: 10.869rem;height:10.869rem;border-radius:50%;" :src="item.avatar">
								</image>
								<view style="margin-left:1.107rem;">
									<view style="font-weight: bold;font-size: 1.897rem;color: #000000;">
										{{item.name}}
									</view>
									<view v-if="item.score!=0" class="flex"
										style="align-items: center;margin:0.949rem 0  1.581rem;">
										<image style="width: 1.739rem;height: 1.581rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 1.423rem;color: #F88400;margin:0 0.948rem 0 6px;">
											{{item.score}}
										</view>
										<view style="font-size:  1.581rem;color: #333333;">-1rating</view>
									</view>
									<view v-if="item.isAuth==1" style="font-size: 1.264rem;color: #666666;">
										本人確認書類提出済み</view>
								</view>
							</view>
							<view class="flexJusp"
								style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view>
									<view style="font-size: 1.423rem;color: #666666;">1人あたり募集金額</view>
									<view style="font-size: 1.213rem;color: #000000;margin-top:1.897rem">
										￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}
									</view>
								</view>
								<view style="width:9.17rem;">
									<view style="font-size: 1.423rem;color: #666666;">同乗人数</view>
									<view style="font-size: 1.213rem;color: #000000;margin-top:1.897rem">
										{{item.alreadyTotal}}/{{item.total}}
									</view>
								</view>
							</view>
						</view>
						<view
							style="width: 44.269rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem;">
							<view style="font-size: 2.055rem;color: #F44870;">{{item.startTime.slice(0, 16)}}</view>
							<view class="flex"
								style="align-items: center;font-weight: bold;font-size: 1.897rem;margin:2.371rem 0 1.897rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:5.059rem;height:0.79rem;margin:0 1.581rem;"
									src="/static/images/gdd.png"></image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view
								style="width: 41.502rem;height: 7.431rem;background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:1.897rem 0;">
								<view class="flex" style="margin:1.423rem 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
										src="/static/images/q.png">
									</image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">
										{{item.startAddress}}
									</view>
								</view>
								<view class="flex" style="margin:0 1.264rem;">
									<image style="width:1.897rem;height:1.897rem;margin-right:0.949rem;"
										src="/static/images/w.png">
									</image>
									<view class="yihang" style="font-size: 1.502rem;color: #333333;">
										{{item.endAddress}}
									</view>
								</view>
							</view>
							<view class="flex" style="align-items: center;">
								<!-- <view style="width:2.213rem;height:1.818rem;background-color:#F44870;"></view> -->
								<image style="width:2.055rem;height: 1.66rem;" src="/static/images/c.png"></image>
								<view style="font-size: 1.423rem;color: #000000;margin-left:0.79rem;">
									車:{{item.model}}
								</view>
							</view>
						</view>
						<view
							style="width: 17.233rem;height:20.316rem;background: #F7F8F9;border-radius:  1.581rem;padding: 1.581rem  3.162rem;">
							<view @click="details(item)"
								style="width: 17.233rem;height: 5.06rem;background: #F44870;border-radius: 1.264rem;font-weight: bold;font-size:  1.739rem;color: #FFFFFF;line-height: 5.06rem;text-align: center;margin:4.268rem 0 3.636rem;cursor: pointer;">
								詳細</view>
							<view @click="jiaru(item)"
								style="width: 17.233rem;height: 5.06rem;border-radius: 1.264rem;border: 1px solid #F44870;font-weight: bold;font-size:  1.739rem;color: #F44870;line-height: 5.06rem;text-align: center;cursor: pointer;">
								リクエスト送信</view>
						</view>
					</view>
			<!-- 		<page-pagination v-if='page.total>10' :total="page.total" :pageSize="page.pageSize"
						:showBorder="true" :numAround="true" size="large"></page-pagination> -->
				</view>
			</view>
			<view style="height:16.126rem"></view>
			<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
			<!-- <toast ref="toast"></toast> -->
			<mx-date-picker :show="showPicker" :type="type" :value="value" :show-tips="true" format="yyyy-mm-dd"
				:show-seconds="true" @confirm="ed" @cancel="ed" />
		</view>
		<view class='mobile-only'>

			<view style="height: 18.69rem;"></view>
			<view class="flex" style="width:100vw;flex-direction: column;">
				<view
					style="width:calc(100vw - 10rem);margin:2.73rem 2.27rem;padding:3.18rem 2.73rem;background-color: #fff;">
					<!-- <view style="font-weight: bold;font-size: 1.897rem;color: #000000;line-height:1.897rem"><text
								style="cursor: pointer;" @click="indexx">TOPページ>></text><text
								style="color: #FF3D66;">ドライブ一覧ページ</text></view>
						<view -->
					<!-- 	style="margin-top:3.873rem;width: 27.826rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius:1.581rem;padding:1.897rem 1.581rem 2.372rem;"> -->
					<view style='display: flex;justify-content: space-between;margin-bottom:3.18rem'>
						<view class='list_h'>どこから乗りますか?</view>
						<picker @change="bindPickerChange" :value="index" :range="listCity" range-key="city">
							<view class="flexJusp"
								style="width:37.95rem;height: 7.73rem;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;">
								<view class='list_h1' v-if="listCity[index]">{{listCity[index].city}}</view>
								<view class='list_h1' v-else></view>
								<image style="width:1.93rem;height:1.93rem;margin-right:2.5rem"
									src="/static/images/wec.png"></image>
							</view>
						</picker>
					</view>
					<view style='display: flex;justify-content: space-between;'>
						<view class='list_h'>どこまで乗りますか？</view>
						<picker @change="bindPickerChanges" :value="indexs" :range="listCity" range-key="city">
							<view class="flexJusp"
								style="width:37.95rem;height: 7.73rem;border-radius: 1.106rem;border: 1px solid #707070;align-items: center;">
								<view class='list_h1' v-if="listCity[indexs]">{{listCity[indexs].city}}</view>
								<view class='list_h1' v-else></view>
								<image style="width:1.93rem;height:1.93rem;margin-right:2.5rem"
									src="/static/images/wec.png"></image>
							</view>
						</picker>
					</view>
					<view class='list_h' style="font-weight: bold;">日付</view>
					<view class="flexJusp" style="align-items: center;margin:1.265rem 0 1.897rem;">
						<!-- <picker mode="date" :value="date" @change="bindDateChange"> -->
						<view class="flexJusp" @click="onShowDatePicker('date')"
							style="width: 54.55rem;height: 8.64rem;border-radius: 7px;border: 1px solid #707070;align-items: center;cursor: pointer;">
							<view class='list_h1'>{{date||'日付'}}</view>
							<image style="width: 4.55rem;height: 4.77rem;margin-right:2.5rem"
								src="/static/images/mnvjyt.png">
							</image>
						</view>
						<!-- </picker> -->
						<!-- <el-date-picker style="width:19.447rem;height:  3.162rem;border-radius: 7px;border: 1px solid #707070;font-size: 1.264rem;" v-model="date" type="date" value-format="yyyy-MM-dd" placeholder="选择日期"></el-date-picker> -->
						<view @click="date = ''"
							style="font-size: 3.42rem;color: #FF3D66;line-height: 8.64rem;text-align: center;width: 17.95rem;height: 8.64rem;border-radius: 7px;border: 1px solid #FF3D66;cursor: pointer;">
							クリア</view>
					</view>
					<view class='list_h' style="font-weight: bold;">出発時間</view>
					<view class="flexJusp" style="margin:1.265rem 0  2.372rem;align-items: center;">
						<picker @change="bindPickerChange1" :value="shiIndex" :range="shiList">
							<view class="flexJusp boxs" style='width:14rem;height: 8.86rem;'>
								<view class='list_h1'>{{shiList[shiIndex]||'00'}}</view>
								<image style="width: 4.09rem;height: 2.5rem;" src="/static/images/rnh.png">
								</image>
							</view>
						</picker>
						<picker @change="bindPickerChange2" :value="fenIndex" :range="fenList">
							<view class="flexJusp boxs" style='width:14rem;height: 8.86rem;'>
								<view class='list_h1'>{{fenList[fenIndex]||'00'}}</view>
								<image style="width: 4.09rem;height: 2.5rem;" src="/static/images/rnh.png">
								</image>
							</view>
						</picker>
						<view style="font-weight: bold;font-size:  1.581rem;">-</view>
						<picker @change="bindPickerChange3" :value="shiIndexs" :range="shiList">
							<view class="flexJusp boxs" style='width:14rem;height: 8.86rem;'>
								<view class='list_h1'>{{shiList[shiIndexs]||'00'}}</view>
								<image style="width: 4.09rem;height: 2.5rem;" src="/static/images/rnh.png">
								</image>
							</view>
						</picker>
						<picker @change="bindPickerChange4" :value="fenIndexs" :range="fenList">
							<view class="flexJusp boxs" style='width:14rem;height: 8.86rem;'>
								<view class='list_h1'>{{fenList[fenIndexs]||'00'}}</view>
								<image style="width: 4.09rem;height: 2.5rem;" src="/static/images/rnh.png">
								</image>
							</view>
						</picker>
					</view>
					<view @click="loads" class='search_btn'
						style="width: 55.68rem;height: 8.86rem;background: #F44870;border-radius: 1.82rem 1.82rem 1.82rem 1.82rem;margin:0 auto">
						検索する</view>
				</view>
				<view style="width:calc(100vw - 4.54rem);margin:0 2.27rem;">
					<!-- <view class='h_h3' style="margin:2.25rem 2.7rem;">最新のドライブ</view> -->
					<view class="flexJusp" style="margin-bottom:2.213rem;align-items: center;">
						<view class="flex" style="font-weight: bold;font-size: 3.18rem;">
							<view>{{page.total}}件</view>
							<!-- <view style="margin-left: 2.162rem;">のドライブが見つかりました。</view> -->
						</view>
						<view style='flex:1'></view>
						<picker @change="bindPickerChangeSort" :value="indexSort" :range="listSort" range-key="city">

							<view class="flexJusp"
								style="width:37.95rem;height: 7.27rem;border-radius: 1.106rem;border: 1px solid #888888;align-items: center;padding:0 0.948rem;cursor: pointer;">
								<view style="font-size:2.95rem;">{{listSort[indexSort]}}</view>
								<image style="width:1.93rem;height:1.93rem;" src="/static/images/downs.png">
								</image>
							</view>
						</picker>
						<!-- <view class="buttonss" @click="addride">ドライブ登録</view -->
					</view>
					<view class="flexJusp" v-for="(item,index) in list" :key="index"
						style="flex-direction:column;padding: 1.581rem;background: #FFFFFF;box-shadow: 0px 6px 1.264rem 1px rgba(0,0,0,0.06);border-radius: 2.055rem;margin-bottom: 2.372rem;">
						<view
							style="width: calc(100vw - 10rem);height:18.18rem;border-radius:  1.581rem;padding: 2.5rem;">
							<view class="flex" @click='topersonal(item)'>
								<image style="width: 10.91rem;height:10.91rem;border-radius:50%;" :src="item.avatar">
								</image>
								<view style="margin-left:2.05rem;margin-top:-0.68rem">
									<view style="font-weight: bold;font-size: 3.81rem;color: #000000;">{{item.name}}
									</view>
									<view class="flex" style="align-items: center;margin:0.91rem 0 0.91rem 0;"
										v-if="item.score!=0">
										<!--  -->
										<image style="width:2.95rem;height:2.73rem;" src="/static/images/bxs.png">
										</image>
										<view style="font-size: 2.73rem;color: #F88400;">{{item.score}}</view>
										<view style="font-size: 2.73rem;color: #333333;">-1rating</view>
									</view>
									<view style='height:4.55rem' v-else>

									</view>
									<view v-if="item.isAuth==1" style="font-size:2.73rem;color: #666666;">本人確認書類提出済み
									</view>
								</view>
								<view style='flex:1'></view>
								<view style="font-size: 3.18rem;color: #F44870;margin-right:2.27rem">{{item.startTime.slice(0, 16)}}
								</view>
							</view>
							<view
								style='height:0px;border: 0.11rem solid rgba(0,0,0,0.08);;width:calc(100vw - 10rem);margin:2.27rem auto'>

							</view>
							<!-- <view class="flexJusp" style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view>
									<view style="font-size:  1.581rem;color: #666666;">1人あたり募集金額</view>
									<view style="font-size:  1.529rem;color: #000000;margin-top:1.897rem">￥{{Math.floor(item.minPrice)}} - {{Math.floor(item.maxPrice)}}</view>
								</view>
								<view style="width:9.17rem;">
									<view style="font-size:  1.581rem;color: #666666;">同乗人数</view>
									<view style="font-size:  1.529rem;color: #000000;margin-top:1.897rem">{{item.alreadyTotal}}/{{item.total}}</view>
								</view>
							</view> -->
						</view>
						<view
							style="width:calc(100vw - 10rem);margin-top:-4rem;border-radius:  1.581rem;padding: 1.581rem;">

							<view class="flex"
								style="align-items: center;font-weight: bold;font-size:3.18rem;margin:2.529rem 0 2.055rem;">
								<view class="yihang">{{item.startAddress}}</view>
								<image style="width:7.95rem;height:1.34rem;margin:0 5.36rem;"
									src="/static/images/gdd.png"></image>
								<view class="yihang">{{item.endAddress}}</view>
							</view>
							<view
								style="width:calc(100vw - 15.89rem);background: #F7F8F9;border-radius: 1.106rem;border: 1px solid rgba(0,0,0,0.14);margin:0 auto;padding:2.27rem 2.73rem">
								<view class="flex" style='margin-bottom:3.41rem'>
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;"
										src="/static/images/q.png"></image>
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">起</view> -->
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">
										{{item.startAddress}}
									</view>
								</view>
								<view class="flex">
									<!-- <view style="width: 1.897rem;height: 1.897rem;background: #F8DAE1;border-radius: 4px;font-weight: bold;font-size: 1.106rem;color: #FF3D66;line-height: 1.897rem;text-align: center;margin-right:0.949rem;">終</view> -->
									<image style="width:4.55rem;height:4.55rem;margin-right:0.949rem;"
										src="/static/images/w.png"></image>
									<view class="yihang" style="font-size: 3.18rem;color: #333333;">{{item.endAddress}}
									</view>
								</view>
							</view>
							<view class="flex" style="align-items: center;margin-top:1.59rem">
								<image style="width:3.86rem;height:3.18rem;" src="/static/images/c.png"></image>
								<view class="yihang"
									style="font-size: 2.95rem;color: #000000;margin-left:0.79rem;width:40rem;">
									車:{{item.model}}</view>
							</view>
							<view class="flexJusp"
								style="border-top: 1px solid #E2E2E2;padding-top:1.818rem;margin-top: 1.581rem;">
								<view class='price_num'>
									<view style="color: #000000;margin-top:1.897rem">￥{{Math.floor(item.minPrice)}} -
										{{Math.floor(item.maxPrice)}}
										</view>

									<view style="color: #666666;">1人あたり募集金額</view>
								</view>
								<view class='price_num'>
									<view style="color: #000000;margin-top:1.897rem">
										{{item.alreadyTotal}}/{{item.total}}</view>
									<view style="color: #666666;">同乗人数</view>

								</view>
							</view>
						</view>
						<view
							style="display: flex;flex-direction: row;width: calc(100vw - 10rem );border-radius:  1.581rem;padding:2.73rem 1.37rem;justify-content: space-between;">
							<view @click="details(item)" class='detail'>詳細</view>
							<view @click="jiaru(item)" class='send'>リクエスト送信</view>
						</view>
					</view>
				</view>
			</view>

		</view>
		<view style="height:58.41rem;"></view>
		<bottoms style="position: absolute;bottom:0;left:0;"></bottoms>
	
		<mx-date-picker :show="showPicker" :type="type" :value="value" :show-tips="true" format="yyyy-mm-dd"
			:show-seconds="true" @confirm="ed" @cancel="ed" />

<toast ref="toast"></toast>
	</view>
	
	</view>


</template>

<script>
	import MxDatePicker from "@/components/mx-datepicker/mx-datepicker.vue";
	export default {
		components: {
			MxDatePicker
		},
		data() {
			return {
				showPicker: false,
				date: '',
				time: '',
				datetime: '',
				range: [],
				rangetime: [],
				type: 'rangetime',
				listSort: ['出発日が早い順', '出発日が遅い順', '価格が高い順'],
				indexSort: 0,
				value: '',
				page: {
					total: 0,
					pageSize: 20
				},
				list: [],
				index: -1,
				indexs: -1,
				startAddress: '',
				endAddress: '',
				startTime: '',
				beginStartTime: '',
				endStartTime: '',
				listCity: [],
				shiList: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15',
					'16', '17', '18', '19', '20', '21', '22', '23'
				],
				shiIndex: 0,
				shiIndexs: 23,
				fenList: ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15',
					'16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31',
					'32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47',
					'48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59'
				],
				fenIndex: 0,
				fenIndexs: 59,
				sort: 1
			}
		},
		onLoad() {
			let currentDate = new Date();
			let year = currentDate.getFullYear();
			let month = currentDate.getMonth() + 1; // 月份从0开始，所以要加1
			let day = currentDate.getDate();
			if (month < 10) {
				month = '0' + month
			}
			if (day < 10) {
				day = '0' + day
			}
			// this.date = year + "-" + month + "-" + day
			// 输出当前日期
			console.log(year + "-" + month + "-" + day);
			this.$httpapi('project/getCityList', 'POST', {}).then(res => {
				if (res.code == 500) {
					this.$refs.toast.show({
						message: res.msg,
						duration: 2000
					});
				}
				this.listCity = res.data
			})
			this.loads()
		},
		onShow() {
			var data = getApp().globalData.Informations
			setTimeout(() => {
				this.$refs.headers.gengxin(data)
			}, 300)
		},
		methods: {
			addride() {
				// this.info =getApp().globalData.Informations
				// console.log(this.info)
				// return
				let isDriver = uni.getStorageSync('isDriver') || 0
				if (uni.getStorageSync('isAuth') == 0) {
					this.$refs.toast.show({
						message: '本人確認が完了していません。マイページから本人確認を行ってください。',
						duration: 2000
					});
					return
				}
				if (isDriver == 1) {
					uni.navigateTo({
						url: '/pages/index/Addride/Addride?type=2'
					})
				} else {
					alert = '車の登録をお願いします'
					uni.navigateTo({
						url: '/pages/index/VehicleRegistration/VehicleRegistration'
					})
				}

			},
			topersonal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation?id=' + item.customerId
				})
			},
			bindPickerChangeSort(e) {
				this.indexSort = e.detail.value
				this.loads()
			},
			onShowDatePicker(type) { //显示
				this.type = type;
				this.showPicker = true;
				this.value = this[type];
			},
			ed(e) { //选择
				this.showPicker = false;
				if (e) {
					this[this.type] = e.value;
					//选择的值
					console.log('value => ' + e.value);
					//原始的Date对象
					console.log('date => ' + e.date);
				}
			},
			jiaru(item) {
				if (!uni.getStorageSync('customerId')) {
					uni.navigateTo({
						url: '/pages/login/login'
					})
					return
				}
				if (uni.getStorageSync('isAuth') == 0) {
					uni.navigateTo({
						url: '/pages/index/briefIntroductionTop/briefIntroductionTop?id=' + uni.getStorageSync(
							'customerId')
					})
					return
				}
				uni.showModal({
					cancelText:'キャンセル',
					confirmText:'確認',
					title: '確認',
					content: 'あなたの電話番号がドライバーに表示されます。続行してもよろしいですか？',
					success: (res) => {
						if (res.confirm) {
							// 用户点击确认，继续执行请求
							this.$httpapi('project/addTbCustomerChat', 'POST', {
								customerId: uni.getStorageSync('customerId'),
								subId: item.customerId,
								routeId: item.id
							}).then(res => {
								if (res.code == 500) {
									this.$refs.toast.show({
										message: res.msg,
										duration: 2000
									});
								} else {
									this.$refs.toast.show({
										message: 'リクエスト送信成功',
										duration: 2000
									});
								}
								this.loads();
							}).catch(error => {
								// 处理请求错误
								console.error('Error adding customer chat:', error);
								this.$refs.toast.show({
									message: 'リクエスト送信中にエラーが発生しました。',
									duration: 2000
								});
							});

						} else if (res.cancel) {
							// 用户点击取消，不执行任何操作
							console.log('ユーザーが操作をキャンセルしました。');
						}
					}
				});

			},
			bindPickerChange1(e) {
				this.shiIndex = e.detail.value
			},
			bindPickerChange2(e) {
				this.fenIndex = e.detail.value
			},
			bindPickerChange3(e) {
				this.shiIndexs = e.detail.value
			},
			bindPickerChange4(e) {
				this.fenIndexs = e.detail.value
			},
			bindPickerChange(e) {
				this.index = e.detail.value
			},
			bindPickerChanges(e) {
				this.indexs = e.detail.value
			},
			paixu() {
				if (this.sort == 1) {
					this.sort = 2
				} else {
					this.sort = 1
				}
				this.loads()
			},
			loads() {
				var startAddress = ''
				var endAddress = ''
				var beginStartTime = ''
				var endStartTime = ''
				if (this.listCity[this.index]) {
					startAddress = this.listCity[this.index].city
				}
				if (this.listCity[this.indexs]) {
					endAddress = this.listCity[this.indexs].city
				}
				if (this.date) {
					beginStartTime = this.date + ' ' + this.shiList[this.shiIndex] + ':' + this.fenList[this.fenIndex]
					endStartTime = this.date + ' ' + this.shiList[this.shiIndexs] + ':' + this.fenList[this.fenIndexs]
				}
				this.$httpapi('project/getTbCustomerRouteListS', 'POST', {
					sort: this.indexSort + 1,
					startAddress: startAddress,
					endAddress: endAddress,
					startTime: this.date,
					beginStartTime: beginStartTime,
					endStartTime: endStartTime,
				}).then(res => {
					if (res.code == 500) {
						this.$refs.toast.show({
							message: res.msg,
							duration: 2000
						});
					}
					this.page.total = res.total
					this.list = res.rows
				})
			},
			personal(item) {
				uni.navigateTo({
					url: '/pages/index/PersonalInformation/PersonalInformation'
				})
			},
			indexx() {
				uni.reLaunch({
					url: '/pages/index/index'
				})
			},
			details(item) {
				uni.navigateTo({
					url: '/pages/index/IndexLise/ListDetails?id=' + item.id
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

		.boxs {
			width: 3.794rem;
			height: 3.083rem;
			border-radius: 7px;
			border: 1px solid #707070;
			align-items: center;
			padding: 0 0.79rem;
		}
	}

	.buttonss {
		margin-left: 1rem;
		width: 16.486rem;
		height: 3.47rem;
		background: #F44870;
		border-radius: 1.423rem;
		font-size: 1.897rem;
		color: #FFFFFF;
		line-height: 3.47rem;
		text-align: center;
		cursor: pointer;
	}
</style>