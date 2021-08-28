<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container-fluid">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col-md-auto col-12 ">
                            <q-input debounce="1000" outlined dense  placeholder="Search" v-model="searchText">
                            <template v-slot:append>
                                <q-icon name="las la-search"></q-icon>
                            </template>
                            </q-input>
                        </div>
                    </div>
                </div>
            </q-card>
        </template>
        <div class="">
            <div class="container-fluid">
                <div class="row q-col-gutter-md">
                    <div class="col comp-grid">
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
                                :columns="$menus.QuestionsTableHeader2Items" 
                                :data="records"
                                binary-state-sort
                                separator="none"
                                :dense="true"
                                :selected.sync="selectedItems"
                                selection="multiple"
                                row-key="id" 
                                :pagination.sync="pagination"
                                hide-bottom
                                @request="setPagination"
                                no-data-label="No Record Found"
                                :loading="loading">
                                <!-- Start of Table Layout -->
                                <template v-slot:body="props">
                                    <q-tr :props="props">
                                        <q-td auto-width>
                                            <q-checkbox v-model="props.selected"></q-checkbox>
                                        </q-td>
                                        <q-td key="user_id" :props="props">
                                            <master-detail-btn display-mode="dialog"    :rounded="false"  size=""  color="dark inset-shadow text-dark" no-caps  unelevated   detail-page="questions/users-pages" :detail-page-id="props.row.user_id" >
                                              {{ props.row.users_username }}
                                            </master-detail-btn>
                                        </q-td>
                                        <q-td key="points" :props="props">
                                            {{ props.row.points }}
                                        </q-td>
                                        <q-td key="date" :props="props">
                                            {{ props.row.date  | humanDate}}
                                        </q-td>
                                        <q-td key="btnactions" :props="props">
                                            <q-btn-dropdown  icon="las la-bars" size="sm" padding="xs" color="accent"    :rounded="false"  no-caps  unelevated  >
                                                <q-list  dense rounded nav>
                                                    <q-item link clickable v-ripple :to="`/questions/view/${ props.row.id }`">
                                                        <q-item-section>
                                                            <q-icon color="accent" size="sm" name="las la-eye"></q-icon>
                                                        </q-item-section>
                                                    </q-item>
                                                    <q-item link clickable v-ripple :to="`/questions/edit/${ props.row.id }`">
                                                        <q-item-section>
                                                            <q-icon color="accent"  size="sm" name="las la-edit"></q-icon>
                                                        </q-item-section>
                                                    </q-item>
                                                    <q-item link clickable v-ripple @click="deleteItem(props.row.id)">
                                                        <q-item-section>
                                                            <q-icon color="accent"  size="sm" name="las la-times"></q-icon>
                                                        </q-item-section>
                                                    </q-item>
                                                </q-list>
                                            </q-btn-dropdown>
                                        </q-td>
                                    </q-tr>
                                </template>
                                <!-- End of Table Layout-->
                                </q-table>
                                <q-inner-loading :showing="loading">
                                    <q-spinner color="" size="20px"> 
                                    </q-spinner>
                                </q-inner-loading>
                                <div v-if="showFooter" class="">
                                    <div v-show="!loading" class="q-pa-sm q-my-md">
                                        <div class="row justify-between">
                                            <div class="row q-col-gutter-md">
                                                <div>
                                                    <q-btn display-style="modal"    :rounded="false"  no-caps  unelevated   color="negative" padding="xs" @click="deleteItem(selectedItems)" v-if="selectedItems.length" icon="las la-trash" title="Delete Selected" class="q-mx-xs"></q-btn>
                                                </div>
                                            </div>
                                            <div v-if="paginate && totalRecords > 0" class="row q-col-gutter-md justify-center">
                                                <div class="col-auto" v-if="totalPages > 1">
                                                    <q-chip>Records {{recordsPosition}} of {{totalRecords}}</q-chip>
                                                </div>
                                                <div class="col-auto" v-if="totalPages > 1">
                                                    <q-chip>Page {{pagination.page}} of  {{totalPages}}</q-chip>
                                                </div>
                                                <div class="col-auto">
                                                    <q-select :dense="true" options-dense outlined emit-value  v-model="pagination.rowsPerPage" :options="[5,10,15,20,30,40,50,100,200]"></q-select>
                                                </div>
                                                <div v-if="totalPages > 1">
                                                    <q-pagination v-model="pagination.page" :direction-links="true" :boundary-links="true" :max-pages="5" :boundary-numbers="true" :max="totalPages"></q-pagination>
                                                </div>
                                            </div>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="">
            <div class="container">
                <div class="row q-col-gutter-md">
                    <div class="col comp-grid">
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
		name: 'manageleaderboardQuestionsPage',
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
				default : 'questionsmanage_leaderboard',
			},
			apiPath : {
				type : String,
				default : 'questions/manage_leaderboard',
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
			apiUrl: function () {
				this.load();
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
			load: function() {
				if (!this.loading) {
					this.loading = true;
					let url = this.apiUrl;
					let payload = {
						url,
						merge: false
					}
					this.fetchRecords(payload).then(
						(response) => {
							this.loading = false;
							this.ready = true;
							this.totalRecords = response.total_records;
							this.recordCount = response.record_count;
							this.pagination.rowsNumber = this.totalRecords;
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
