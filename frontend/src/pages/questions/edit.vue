<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">Edit Questions</div>
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
                                <div v-if="!loading">
                                    <ValidationObserver ref="observer" v-slot="{ invalid }" tag="form" @submit.prevent="startRecordUpdate()">
                                        <input name="ctrluser_id"  ref="ctrluser_id" v-model="formData.user_id" type="hidden" />
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-3 col-12">
                                                    Points 
                                                </div>
                                                <div class="col-sm-9 col-12">
                                                    <ValidationProvider :rules="{}" name="Points" v-slot="{ errors, invalid, validated }">
                                                        <q-input outlined dense  ref="ctrlpoints" v-model="formData.points"  label="Points" type="text" placeholder="Enter Points"    
                                                        class="" :error="invalid && validated" :error-message="errors[0]">
                                                        </q-input>
                                                    </ValidationProvider>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-3 col-12">
                                                    Date 
                                                </div>
                                                <div class="col-sm-9 col-12">
                                                    <ValidationProvider :rules="{}" name="Date" v-slot="{ errors, invalid, validated }">
                                                        <q-input outlined dense  ref="ctrldate" v-model="formData.date"  label="Date" type="text" placeholder="Enter Date"    
                                                        class="" :error="invalid && validated" :error-message="errors[0]">
                                                        </q-input>
                                                    </ValidationProvider>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-3 col-12">
                                                    Username 
                                                </div>
                                                <div class="col-sm-9 col-12">
                                                    <ValidationProvider :rules="{}" name="Username" v-slot="{ errors, invalid, validated }">
                                                        <q-input outlined dense  ref="ctrlusername" v-model="formData.username"  label="Username" type="text" placeholder="Enter Username"    
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
                        </q-card>
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
		name: 'editQuestionsPage',
		components: {
		},
		mixins: [PageMixin, EditPageMixin],
		props: {
			pageName: {
				type: String,
				default: 'questions',
			},
			routeName: {
				type: String,
				default: 'questionsedit',
			},
			apiPath: {
				type: String,
				default: 'questions/edit',
			},
		},
		data() {
            return {
				formData: {
					user_id: this.$UserID, points: "", date: this.$utils.dateNow(), username: this.$UserName, 
				},
        	}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "Edit Questions"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle // set browser page title
			}
		},
		methods: {
			...mapActions('questions', ['updateRecord', 'fetchRecord']),
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
							this.navigateTo(`/questions`);
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
				this.formData = {user_id: this.$UserID, points: "", date: this.$utils.dateNow(), username: this.$UserName, };
				requestAnimationFrame(() => {
					this.$refs.observer.reset();
				});
				//raise event to reset other custom form components
				this.$EventBus.$emit("resetForm");
			},
		},
	};
	</script>
