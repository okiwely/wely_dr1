<template>
	<view class="uni-toast" v-if="isShow">
		<text class="uni-toast-text">{{message}}</text>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isShow: false,
				message: '',
				duration: 1500
			};
		},
		methods: {
			show(options) {
				this.isShow = true;
				this.message = options.message || '';
				setTimeout(() => {
					this.isShow = false;
				}, options.duration || this.duration);
			}
		}
	};
</script>

<style>
	.uni-toast {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		padding: 2rem;
		font-size:2rem;
		background-color: rgba(0, 0, 0, 0.6);
		border-radius: 5px;
		color: #fff;
		z-index: 9999;
	}
</style>