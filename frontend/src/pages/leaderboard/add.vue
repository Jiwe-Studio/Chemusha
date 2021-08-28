<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">Add New Leaderboard</div>
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
			//[--PAGE-IMPORT-STATEMENT--]
	import { PageMixin } from "../../mixins/page.js";
	import { AddPageMixin } from "../../mixins/addpage.js";
	import { mapActions } from "vuex";
	export default {
		name: 'addLeaderboardPage',
		components: {
			//[--PAGE-COMPONENT-NAME--]
		},
		mixins: [PageMixin, AddPageMixin],
		props:{
			pageName : {
				type : String,
				default : 'leaderboard',
			},
			routeName : {
				type : String,
				default : 'leaderboardadd',
			},
			apiPath : {
				type : String,
				default : 'leaderboard/add',
			},
		},
		data() {
            return {
				formData: {
					name: "", rank: "", points: "", 
				},
			}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "Add New Leaderboard"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle
			}
		},
		methods: {
			...mapActions('leaderboard', ['saveRecord']),
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
						this.navigateTo(`/leaderboard`);
					},
					 (response) => {
						this.saving = false;
						this.showPageRequestError(response);
					});
				}
			},
			resetForm (){
				this.formData = {name: "", rank: "", points: "", };
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

<style scoped>
	/* 
	* Page Css 
	*/

</style>
