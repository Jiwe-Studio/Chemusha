<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">Add New Questions</div>
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
                                                User Id *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true}" name="User Id" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  ref="ctrluser_id" v-model="formData.user_id"  label="User Id" type="number" placeholder="Enter User Id"   step="any"  
                                                    class="" :error="invalid && validated" :error-message="errors[0]">
                                                    </q-input>
                                                </ValidationProvider>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="row">
                                            <div class="col-sm-3 col-12">
                                                Points *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true}" name="Points" v-slot="{ errors, invalid, validated }">
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
                                                Date *
                                            </div>
                                            <div class="col-sm-9 col-12">
                                                <ValidationProvider :rules="{required:true}" name="Date" v-slot="{ errors, invalid, validated }">
                                                    <q-input outlined dense  v-model="formData.date" :error="invalid && validated" :error-message="errors[0]" >
                                                    <template v-slot:prepend>
                                                        <q-icon name="las la-calendar" class="cursor-pointer">
                                                        <q-popup-proxy transition-show="scale" transition-hide="scale">
                                                        <q-date     mask="YYYY-MM-DD HH:mm" v-model="formData.date" />
                                                        </q-popup-proxy>
                                                        </q-icon>
                                                    </template>
                                                    <template v-slot:append>
                                                        <q-icon name="las la-clock" class="cursor-pointer">
                                                        <q-popup-proxy transition-show="scale" transition-hide="scale">
                                                        <q-time v-model="formData.date" mask="YYYY-MM-DD HH:mm" />
                                                        </q-popup-proxy>
                                                        </q-icon>
                                                    </template>
                                                    </q-input>
                                                </ValidationProvider>
                                            </div>
                                        </div>
                                    </div>
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
                                    <div v-if="showSubmitButton" class="text-center q-my-md">
                                        <q-btn type="submit"    :rounded="false"  color="primary"  no-caps  unelevated   :disabled="invalid" icon="las la-paper-plane" :loading="saving">
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
		name: 'attemptQuestionsPage',
		components: {
		},
		mixins: [PageMixin, AddPageMixin],
		props:{
			pageName : {
				type : String,
				default : 'questions',
			},
			routeName : {
				type : String,
				default : 'questionsattempt',
			},
			apiPath : {
				type : String,
				default : 'questions/attempt',
			},
		},
		data() {
            return {
				formData: {
					user_id: "", points: "", date: "", username: "", 
				},
				datePicker:false
			}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "Add New Questions"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle
			}
		},
		methods: {
			...mapActions('questions', ['saveRecord']),
			async startSaveRecord(){
				const isFormValid = await this.$refs.observer.validate();
				if(isFormValid){
					this.saving = true;
					let payload = this.normalizedFormData();
					let url = this.apiUrl;
					let data = { url, payload  }
					this.saveRecord(data).then((response) => {
						this.record = response.data;
						this.id = this.record['id'];
						this.saving = false;
						this.resetForm();
						this.closeDialogs();// close page dialog that if opened
						this.flashMsg(this.msgAfterSave);
						this.navigateTo(`/questions`);
					},
					 (response) => {
						this.saving = false;
						this.showPageRequestError(response);
					});
				}
			},
			resetForm (){
				this.formData = {user_id: "", points: "", date: "", username: "", };
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
