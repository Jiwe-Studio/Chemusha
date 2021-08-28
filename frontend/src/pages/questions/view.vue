<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">View Questions</div>
                        </div>
                    </div>
                </div>
            </q-card>
        </template>
        <div class="">
            <div class="container">
                <div class="row q-col-gutter-md">
                    <div class="col comp-grid">
                        <q-card bordered  flat  class=" shadow-1">
                            <div>
                                <div v-if="!loading">
                                    <div v-if="item" class="page-records ">
                                        <q-list clickable>
                                            <q-item clickable v-ripple>
                                                <q-item-section>
                                                    <q-item-label caption>Id: </q-item-label>
                                                    <q-item-label>{{ item.id }}</q-item-label>
                                                </q-item-section>
                                            </q-item>
                                            <q-separator></q-separator>
                                            <q-item clickable v-ripple>
                                                <q-item-section>
                                                    <q-item-label caption>Points: </q-item-label>
                                                    <q-item-label>{{ item.points }}</q-item-label>
                                                </q-item-section>
                                            </q-item>
                                            <q-separator></q-separator>
                                            <q-item clickable v-ripple>
                                                <q-item-section>
                                                    <q-item-label caption>Date: </q-item-label>
                                                    <q-item-label>{{ item.date  | humanDate}}</q-item-label>
                                                </q-item-section>
                                            </q-item>
                                            <q-separator></q-separator>
                                        </q-list>
                                        <div class="q-pa-sm">
                                            <q-btn    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" icon="las la-edit"  class="q-mx-xs" title="Edit This Record"  :to="`/questions/edit/${item.id }`">
                                            </q-btn>
                                            <q-btn    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" icon="las la-times" class="q-mx-xs" @click="deleteItem(item.id)" title="Delete this record">
                                            </q-btn>
                                        </div>
                                    </div>
                                    <!--<div class="q-pa-sm" v-else>
                                        <q-icon name="las la-ban"></q-icon> No Record Found
                                    </div>-->
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
	import { ViewPageMixin } from "../../mixins/viewpage.js";
	import { mapActions, mapGetters, mapState } from "vuex";
	export default {
		name: 'viewQuestionsPage',
		components: {
		},
		mixins: [PageMixin, ViewPageMixin],
		props: {
			pageName: {
				type : String,
				default : 'questions',
			},
			routeName : {
				type : String,
				default : 'questionsview',
			},
			apiPath: {
				type : String,
				default : 'questions/view',
			},
		},
		data() {
            return {
				item: {
					default :{
					},
				},
			}
		},
		computed: {
			pageTitle:{
				get: function () {
					return "View Questions"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle
			}
		},
		methods: {
			...mapActions("questions", [ "fetchRecord", "deleteRecord"]),
		},
		watch: {
			$route (to, from){
				//only fetch data when navigated to this page
				if(to.name == this.routeName){
					this.load();
				}
			},
		},
	};
	</script>
