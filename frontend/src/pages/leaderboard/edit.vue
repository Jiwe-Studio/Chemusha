<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">Edit Leaderboard</div>
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
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-3 col-12">
                                                    Name *
                                                </div>
                                                <div class="col-sm-9 col-12">
                                                    <ValidationProvider :rules="{required:true}" name="Name" v-slot="{ errors, invalid, validated }">
                                                        <q-input outlined dense  ref="ctrlname" v-model="formData.name"  label="Name" type="text" placeholder="Enter Name"    
                                                        class="" :error="invalid && validated" :error-message="errors[0]">
                                                        </q-input>
                                                    </ValidationProvider>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-3 col-12">
                                                    Rank *
                                                </div>
                                                <div class="col-sm-9 col-12">
                                                    <ValidationProvider :rules="{required:true}" name="Rank" v-slot="{ errors, invalid, validated }">
                                                        <q-input outlined dense  ref="ctrlrank" v-model="formData.rank"  label="Rank" type="number" placeholder="Enter Rank"   step="any"  
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
                                                        <q-input outlined dense  ref="ctrlpoints" v-model="formData.points"  label="Points" type="number" placeholder="Enter Points"   step="any"  
                                                        class="" :error="invalid && validated" :error-message="errors[0]">
                                                        </q-input>
                                                    </ValidationProvider>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="row">
                                                <div class="col-sm-3 col-12">
                                                    User Id *
                                                </div>
                                                <div class="col-sm-9 col-12">
                                                    <ValidationProvider :rules="{required:true}" name="User Id" v-slot="{ errors, invalid, validated }">
                                                        <q-input outlined dense  ref="ctrluser_id" v-model="formData.user_id"  label="User Id" type="text" placeholder="Enter User Id"    
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
		name: 'editLeaderboardPage',
		components: {
		},
		mixins: [PageMixin, EditPageMixin],
		props: {
			pageName: {
				type: String,
				default: 'leaderboard',
			},
			routeName: {
				type: String,
				default: 'leaderboardedit',
			},
			apiPath: {
				type: String,
				default: 'leaderboard/edit',
			},
		},
		data() {
            return {
				formData: {
					name: "", rank: "", points: "", user_id: "", 
				},
        	}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "Edit Leaderboard"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle // set browser page title
			}
		},
		methods: {
			...mapActions('leaderboard', ['updateRecord', 'fetchRecord']),
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
							this.navigateTo(`/leaderboard`);
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
				this.formData = {name: "", rank: "", points: "", user_id: "", };
				requestAnimationFrame(() => {
					this.$refs.observer.reset();
				});
				//raise event to reset other custom form components
				this.$EventBus.$emit("resetForm");
			},
		},
	};
	</script>
