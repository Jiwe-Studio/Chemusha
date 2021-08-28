<template>
    <div>
        <div class="">
            <div class="container-fluid">
                <div class="row q-col-gutter-md">
                    <div class="col comp-grid">
                        <div class=""><div></div>
                    </div>
                    <div>
                        <template v-if="showBreadcrumbs">
                            <q-breadcrumbs class="q-pa-md" v-if="searchText || fieldName">
                                <template v-if="fieldName">
                                    <q-breadcrumbs-el v-if="$route.query.tag" icon="las la-angle-left" class="text-capitalize" :label="$route.query.tag" to="/questions"></q-breadcrumbs-el>
                                    <q-breadcrumbs-el v-else icon="las la-angle-left" class="text-capitalize" :label="fieldName|readable" to="/questions"></q-breadcrumbs-el>
                                    <q-breadcrumbs-el v-if="$route.query.label" :label="$route.query.label"></q-breadcrumbs-el>
                                    <q-breadcrumbs-el v-else :label="fieldValue"></q-breadcrumbs-el>
                                </template>
                                <template v-if="searchText">
                                    <q-breadcrumbs-el icon="las la-search" label="Search"></q-breadcrumbs-el>
                                    <span class="text-caption text-bold">
                                    <q-chip square removable @remove="searchText='';$route.query.search=''">{{ searchText }}</q-chip>
                                    </span>
                                </template>
                            </q-breadcrumbs>
                        </template>
                        <div class="relative-position">
                            <q-table 
                            :flat="true"
                            table-header-class="text-h4 "
                            :bordered="false"
                            :columns="$menus.QuestionsTableHeaderItems" 
                            :data="records"
                            binary-state-sort
                            separator="horizontal"
                            :dense="true"
                            row-key="id" 
                            :pagination.sync="pagination"
                            hide-bottom
                            @request="setPagination"
                            no-data-label="No Record Found"
                            :loading="loading">
                            <!-- Start of Table Layout -->
                            <template v-slot:body="props">
                                <q-tr :props="props">
                                    <q-td key="username" :props="props">
                                        {{ props.row.username }}
                                    </q-td>
                                    <q-td key="points" :props="props">
                                        {{ props.row.points }}
                                    </q-td>
                                    <q-td key="date" :props="props">
                                        {{ props.row.date  | humanDate}}
                                    </q-td>
                                </q-tr>
                            </template>
                            <!-- End of Table Layout-->
                            </q-table>
                            <div v-show="loading" class="load-indicator text-center q-pa-md">
                                <q-spinner color="" size="20px"> 
                                </q-spinner>
                                Loading...
                            </div>
                            <div v-if="showFooter" class="">
                                <div class="q-pa-sm q-my-md text-center">
                                    <q-btn v-if="canLoadMore" @click="load"    :rounded="false"  size=""  color="primary"  no-caps  unelevated  >  Load More 
                                    </q-btn>
                                    <div v-if="finishedLoading">No more content to load</div>
                                </div>
                            </div>
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
	import { ListPageMixin } from "../../mixins/listpage.js";
	import { mapActions, mapGetters, mapState } from "vuex";
	export default {
		name: 'listQuestionsPage',
		components: {
        },
		mixins: [PageMixin, ListPageMixin],
		props: {
			primaryKey : {
				type : String,
				default : 'id',
			},
			pageName : {
				type : String,
				default : 'questions',
			},
			routeName : {
				type : String,
				default : 'questionslist',
			},
			apiPath : {
				type : String,
				default : 'questions/index',
			},
			editButton: {
				type: Boolean,
				default: false,
			},
			deleteButton: {
				type: Boolean,
				default: false,
			},
			viewButton: {
				type: Boolean,
				default: false,
			},
			listSequence: {
				type: Boolean,
				default: false,
			},
			multiCheckbox: {
				type: Boolean,
				default: false,
			},
			msgBeforeDelete: {
				type: String,
				default: "Are you sure you want to delete this record?",
			},
		},
		data() {
            return {
			}
		},
		computed: {
			pageTitle:{
				get: function () {
					//set browser page title
					return "Questions"
				}
			},
			records: {
				get: function () {
					return this.$store.getters["questions/records"];
				},
				set: function (value) {
					this.$store.commit("questions/setRecords", value);
				},
			},
		},
		meta () {
			return {
				title: this.pageTitle
			}
		},
		watch: {
			filters: {
				handler: function (newValue, oldValue) {
					this.reload();
				},
				deep: true 
			},
			searchText: function(){
				this.reload();
			},
			$route (to, from){
				//only fetch data when navigated to this page
				if(to.name == this.routeName){
					this.load();
				}
			},
		},
		methods: {
			...mapActions("questions", ["fetchRecords", "deleteRecord"]),
			load: function () {
			if (this.canLoadMore) {
				this.loading = true;
				let url = this.apiUrl;
				let payload = {
					url,
					merge: true
				}
				this.fetchRecords(payload).then(
					(response) => {
						this.loading = false;
						this.ready = true;
						this.totalRecords = response.total_records;
						this.recordCount = response.record_count;
						this.pagination.rowsNumber = this.totalRecords;
						this.pagination.page++;
					},
					(response) => {
						this.loading = false;
						this.showPageRequestError(response);
					}
				);
			}
        },
		}
	};
	</script>
