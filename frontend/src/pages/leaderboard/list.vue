<template>
    <div>
        <div class="">
            <div class="container-fluid">
                <div class="row q-col-gutter-md">
                    <div class="q-pt-lg col-12 col-sm-12 col-md-12 comp-grid">
                        <div class=""><div class=""><q-card class="my-card shadow-21"><q-list class="rounded-borders" >
                            <q-item-label header class="text-bold text-dark">leader board </q-item-label>
                            <q-separator />
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #1
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">{{ $UserName }}</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    2000 pts
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #2
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900 pts
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #3
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #4
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900 pts
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #5
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900 pts
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #6
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900 pts
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #7
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900 pts
                                </q-item-section>
                            </q-item>
                            <q-item clickable v-ripple >
                                <q-item-section avatar>
                                    #8
                                </q-item-section>
                                <q-item-section>
                                    <q-item-label lines="1" class="text-bold">julian njoki</q-item-label>
                                </q-item-section>
                                <q-item-section side top>
                                    1,900 pts
                                </q-item-section>
                            </q-item>
                        </q-list></q-card></div></div>
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
		name: 'listLeaderboardPage',
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
				default : 'leaderboard',
			},
			routeName : {
				type : String,
				default : 'leaderboardlist',
			},
			apiPath : {
				type : String,
				default : 'leaderboard/index',
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
					return "Leaderboard"
				}
			},
			records: {
				get: function () {
					return this.$store.getters["leaderboard/records"];
				},
				set: function (value) {
					this.$store.commit("leaderboard/setRecords", value);
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
			...mapActions("leaderboard", ["fetchRecords", "deleteRecord"]),
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
