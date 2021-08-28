<template>
    <div>
        <div class="">
            <div class="container">
                <div class="row q-col-gutter-md">
                    <div class="col-md-9 col-12 comp-grid">
                        <div>
                            <div v-if="!loading">
                                <ValidationObserver ref="observer" v-slot="{ invalid }" tag="form" @submit.prevent="startRecordUpdate()">
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Username *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true}" name="Username" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="ctrlusername" v-model="formData.username"  label="Username" type="text" placeholder="Enter Username"    
                                                    class="" :error="invalid && validated" :error-message="errors[0]">
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
                                            <q-spinner-oval slot="loading" /> Update
                                        </q-btn>
                                    </div>
                                </ValidationObserver>
                                <slot :submit="submit" :saving="saving"></slot>
                            </div>
                            <div v-else class="q-pa-sm text-center">
                                <q-spinner
                                :size="40"
                                color="accent"
                                indeterminate>
                                </q-spinner>
                                Loading...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
	import { PageMixin } from "../../mixins/page.js";
	import { EditPageMixin } from "../../mixins/editpage.js";
	import { mapActions } from "vuex";
	export default {
		name: 'accounteditUsersPage',
		components: {
		},
		mixins: [PageMixin, EditPageMixin],
		props: {
			pageName: {
				type: String,
				default: 'users',
			},
			routeName: {
				type: String,
				default: 'usersaccountedit',
			},
			apiPath: {
				type: String,
				default: 'account/edit',
			},
		},
		data() {
            return {
				formData: {
					username: "", mobile: "", 
				},
        	}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "My Account"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle // set browser page title
			}
		},
		methods: {
			...mapActions('users', ['updateRecord', 'fetchRecord']),
			async startRecordUpdate(){
				const isFormValid = await this.$refs.observer.validate();
				if(isFormValid){
					this.saving = true;
					let id = this.id;
					let url = this.apiUrl;
					let payload = this.normalizedFormData();
					let data = { id, url, payload }
					this.updateRecord(data).then(
						(response) => {
							this.saving = false;
							this.flashMsg(this.msgAfterUpdate);
							this.resetForm();
							this.closeDialogs();// close page dialog that if opened
							window.location.reload();
						},
						(response) => {
							this.saving = false;
							this.showPageRequestError(response);
						}
					);
				}
			},
			updateFormFields: function(){
				//update form fields value after load from api
				//e.g convert fieldvalue (value,value2,value2) to array 
            },
			resetForm (){
				//reset form fields value
				this.formData = {username: "", mobile: "", };
				requestAnimationFrame(() => {
					this.$refs.observer.reset();
				});
				//raise event to reset other custom form components
				this.$EventBus.$emit("resetForm");
			},
		},
	};
	</script>
