<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container-fluid">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">Users</div>
                        </div>
                        <div class="col-md-auto col-12 ">
                            <q-btn    :rounded="false"  size=""  color="primary"  no-caps  unelevated    to="/users/add" class="full-width">
                                <q-icon name="las la-plus"></q-icon>                                
                                Add New Users 
                            </q-btn>
                        </div>
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
                                        <q-breadcrumbs-el v-if="$route.query.tag" icon="las la-angle-left" class="text-capitalize" :label="$route.query.tag" to="/users"></q-breadcrumbs-el>
                                        <q-breadcrumbs-el v-else icon="las la-angle-left" class="text-capitalize" :label="fieldName|readable" to="/users"></q-breadcrumbs-el>
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
                                :grid="$q.screen.lt.md"
                                :flat="$q.screen.gt.md"
                                table-header-class="text-h4 "
                                :bordered="false"
                                :columns="$menus.UsersTableHeaderItems" 
                                :data="records"
                                binary-state-sort
                                separator="horizontal"
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
                                        <q-td key="id" :props="props">
                                            <q-btn padding="xs"   :rounded="false"  color="primary"  no-caps  unelevated   flat :to="'/users/view/' + props.row.id">{{ props.row.id }}</q-btn>
                                        </q-td>
                                        <q-td key="username" :props="props">
                                            {{ props.row.username }}
                                        </q-td>
                                        <q-td key="email" :props="props">
                                            <q-btn padding="xs"   flat :rounded="false"  size=""  color="primary"  no-caps  unelevated   type="a" :href="'mailto:' + props.row.email">{{ props.row.email }}</q-btn>
                                        </q-td>
                                        <q-td key="mobile" :props="props">
                                            {{ props.row.mobile }}
                                        </q-td>
                                        <q-td key="btnactions" :props="props">
                                            <q-btn icon="las la-eye"    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" title="View Record" :to="`/users/view/${ props.row.id }`">
                                            </q-btn>
                                            <q-btn icon="las la-edit"    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" title="Edit This Record" :to="`/users/edit/${ props.row.id }`" class="q-mx-xs">
                                            </q-btn>
                                            <q-btn    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" icon="las la-times" @click="deleteItem(props.row.id)" title="Delete this record">
                                            </q-btn>
                                        </q-td>
                                    </q-tr>
                                </template>
                                <!-- End of Table Layout-->
                                <!-- Start of Mobile Grid Layout-->
                                <template v-slot:item="props">
                                    <div class="q-pa-xs col-xs-12 col-sm-6 col-md-4 col-lg-3 grid-style-transition" :style="props.selected ? 'transform: scale(0.95);' : ''">
                                        <q-card bordered  flat  class="shadow-1" :class="props.selected ? 'bg-grey-2' : ''">
                                            <div>
                                                <q-checkbox v-model="props.selected"></q-checkbox>
                                            </div>
                                            <q-separator></q-separator>
                                            <q-card-section>
                                            <div class="row q-py-sm q-col-gutter-md justify-content-between">
                                                <div class="col-auto text-weight-light text-caption">
                                                    Id
                                                </div>
                                                <div class="col text-weight-bold text-right">
                                                    <q-btn padding="xs"   :rounded="false"  color="primary"  no-caps  unelevated   flat :to="'/users/view/' + props.row.id">{{ props.row.id }}</q-btn>
                                                </div>
                                            </div>
                                            <div class="row q-py-sm q-col-gutter-md justify-content-between">
                                                <div class="col-auto text-weight-light text-caption">
                                                    Username
                                                </div>
                                                <div class="col text-weight-bold text-right">
                                                    {{ props.row.username }}
                                                </div>
                                            </div>
                                            <div class="row q-py-sm q-col-gutter-md justify-content-between">
                                                <div class="col-auto text-weight-light text-caption">
                                                    Email
                                                </div>
                                                <div class="col text-weight-bold text-right">
                                                    <q-btn padding="xs"   flat :rounded="false"  size=""  color="primary"  no-caps  unelevated   type="a" :href="'mailto:' + props.row.email">{{ props.row.email }}</q-btn>
                                                </div>
                                            </div>
                                            <div class="row q-py-sm q-col-gutter-md justify-content-between">
                                                <div class="col-auto text-weight-light text-caption">
                                                    Mobile
                                                </div>
                                                <div class="col text-weight-bold text-right">
                                                    {{ props.row.mobile }}
                                                </div>
                                            </div>
                                            </q-card-section>
                                            <q-separator></q-separator>
                                            <q-card-actions>
                                            <q-btn icon="las la-eye"    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" title="View Record" :to="`/users/view/${ props.row.id }`">
                                            </q-btn>
                                            <q-btn icon="las la-edit"    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" title="Edit This Record" :to="`/users/edit/${ props.row.id }`" class="q-mx-xs">
                                            </q-btn>
                                            <q-btn    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" icon="las la-times" @click="deleteItem(props.row.id)" title="Delete this record">
                                            </q-btn>
                                            </q-card-actions>
                                        </q-card>
                                    </div>
                                </template>
                                <!-- End of Mobile Grid Layout-->
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
    </div>
</template>
<script>
	import { PageMixin } from "../../mixins/page.js";
	import { ListPageMixin } from "../../mixins/listpage.js";
	import { mapActions, mapGetters, mapState } from "vuex";
	export default {
		name: 'listUsersPage',
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
				default : 'users',
			},
			routeName : {
				type : String,
				default : 'userslist',
			},
			apiPath : {
				type : String,
				default : 'users/index',
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
					return "Users"
				}
			},
			records: {
				get: function () {
					return this.$store.getters["users/records"];
				},
				set: function (value) {
					this.$store.commit("users/setRecords", value);
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
			...mapActions("users", ["fetchRecords", "deleteRecord"]),
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
