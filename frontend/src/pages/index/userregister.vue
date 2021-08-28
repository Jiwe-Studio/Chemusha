<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius q-mb-md shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">User registration</div>
                        </div>
                        <div class="col-md-auto comp-grid">
                            <div class="">
                                <div class="text-center">
                                    Already have an account?  <q-btn     :rounded="false"  no-caps  unelevated    color="primary" icon="las la-user" to="/"> Login</q-btn>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </q-card>
        </template>
        <div class="">
            <div class="container">
                <div class="row q-col-gutter-md">
                    <div class="col-md-9 col-12 comp-grid">
                        <q-card bordered  flat  class="q-pa-md shadow-1">
                            <div>
                                <ValidationObserver ref="observer" v-slot="{ invalid }" tag="form" @submit.prevent="startSaveRecord()" @reset="resetForm">
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Username *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <check-duplicate v-model="formData.username" check-path="components_data/users_username_exist/" v-slot="checker">
                                                <ValidationProvider :rules="{required:true}" name="Username" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="ctrlusername" @blur="checker.check" :loading="checker.loading" v-model="formData.username"  label="Username" type="text" placeholder="Enter Username"    
                                                    class="" :error="(invalid && validated) || checker.exist" :error-message="errors[0] || 'Not available'">
                                                    </q-input>
                                                </ValidationProvider>
                                                </check-duplicate>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Email *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <check-duplicate v-model="formData.email" check-path="components_data/users_email_exist/" v-slot="checker">
                                                <ValidationProvider :rules="{required:true, email:true}" name="Email" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="ctrlemail" @blur="checker.check" :loading="checker.loading" v-model="formData.email"  label="Email" type="email" placeholder="Enter Email"    
                                                    class="" :error="(invalid && validated) || checker.exist" :error-message="errors[0] || 'Not available'">
                                                    </q-input>
                                                </ValidationProvider>
                                                </check-duplicate>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Password *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true}" name="Password" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="ctrlpassword" v-model="formData.password"  label="Password" :type="isPwd ? 'password' : 'text'" placeholder="Enter Password"    
                                                    class="" :error="invalid && validated" :error-message="errors[0]">
                                                    <template v-slot:append>
                                                        <q-icon
                                                        :name="isPwd ? 'visibility_off' : 'visibility'"
                                                        class="cursor-pointer"
                                                        @click="isPwd = !isPwd"
                                                        />
                                                    </template>
                                                    </q-input>
                                                </ValidationProvider>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Confirm Password *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true, is: formData.password}" name="Confirm Password" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="" v-model="formData.confirm_password" type="password" label="Confirm Password" placeholder="Confirm Password" :error="invalid && validated" :error-message="errors[0]" >
                                                    <template v-slot:append>
                                                        <q-icon
                                                        :name="isPwd ? 'visibility_off' : 'visibility'"
                                                        class="cursor-pointer"
                                                        @click="isPwd = !isPwd"
                                                        />
                                                    </template>
                                                    </q-input>
                                                </ValidationProvider>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Mobile *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true}" name="Mobile" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="ctrlmobile" v-model="formData.mobile"  label="Mobile" type="text" placeholder="Enter Mobile"    
                                                    class="" :error="invalid && validated" :error-message="errors[0]">
                                                    </q-input>
                                                </ValidationProvider>
                                            </div>
                                        </div>
                                    </div>
                                    <div v-if="showSubmitButton" class="text-center q-my-md">
                                        <q-btn    :rounded="false"  color="primary"  no-caps  unelevated   type="submit" :disabled="invalid" icon="las la-paper-plane" :loading="saving">
                                            <q-spinner-oval slot="loading" /> Submit
                                        </q-btn>
                                    </div>
                                </ValidationObserver>
                                <slot :submit="submit" :saving="saving"></slot>
                            </div>
                        </q-card>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
	import { PageMixin } from "../../mixins/page.js";
	import { AddPageMixin } from "../../mixins/addpage.js";
	import { mapActions } from "vuex";
	export default {
		name: 'RegisterComponent',
		components: {
		},
		mixins: [PageMixin, AddPageMixin],
		props:{
			pageName : {
				type : String,
				default : 'users',
			},
			routeName : {
				type : String,
				default : 'usersuserregister',
			},
			apiPath : {
				type : String,
				default : 'auth/register',
			},
		},
		data() {
            return {
				formData: {
					username: "", email: "", password: "", confirm_password: "", mobile: "", 
				},
			}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "Add New Users"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle
			}
		},
		methods: {
			...mapActions('users', ['saveRecord']),
			async startSaveRecord(){
				const isFormValid = await this.$refs.observer.validate();
				if(isFormValid){
					this.saving = true;
					let payload = this.normalizedFormData();
					let url = this.apiUrl;
					let data = { url, payload  }
					this.saveRecord(data).then((response) => {
						this.saving = false;
						this.resetForm();
						let registrationData = response.data;
						if (registrationData.token && registrationData.user) {
							this.$localStore.saveLoginData(registrationData, false);
							window.location = "/";
						}
						else{
							this.flashMsg(registrationData.message);
							this.navigateTo(registrationData.nextpage);
						}
					},
					 (response) => {
						this.saving = false;
						this.showPageRequestError(response);
					});
				}
			},
			resetForm (){
				this.formData = {username: "", email: "", password: "", confirm_password: "", mobile: "", };
				requestAnimationFrame(() => {
					this.$refs.observer.reset();
				});
				this.$EventBus.$emit("resetForm");
			},
		},
		mounted : function() {
		},
	};
	</script>
