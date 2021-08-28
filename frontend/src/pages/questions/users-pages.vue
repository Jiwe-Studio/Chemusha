<template>
    <div>
        <view-users-page :api-path="setApiPath('users/view')" ></view-users-page>
    </div>
</template>
<script>
import viewUsersPage from "../users/view.vue";
export default {
	name: '',
	components: {
		viewUsersPage
	},
	props: {
		apiPath: {
			type: Object,
			default: function () { 
				return {
					id: '',
					formData: {}
				} 
			}
		},
	},
	data: function(){
		return {
			loading : false,
			ready: false,
			selectedTab: "questions_users_view",
		}
	},
	methods: {
		setApiPath: function(path){
			if(this.apiPath){
				return path + "/" + this.apiPath.id;
			}
			return path;
		},
		setFormData: function(){
			if(this.apiPath){
				return this.apiPath.formData;
			}
			return {};
		},
	},
	mounted: function(){
		this.ready = true;
	}
};
</script>
