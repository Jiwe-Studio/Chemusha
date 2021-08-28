<template>
    <div>
        <div class="">
            <div class="container-fluid">
                <div class="row q-col-gutter-md">
                    <div class="col comp-grid">
                        <div>
                            <template>
                                <div>
                                    <div class="">
                                        <div class="container-fluid">
                                            <div class="row q-col-gutter-md">
                                                <div class="col comp-grid">
                                                    <div>
                                                        <template>
                                                            <div>
                                                                <div class="">
                                                                    <div class="container-fluid">
                                                                        <div class="row q-col-gutter-md">
                                                                            <div class="col comp-grid">
                                                                                <div>
                                                                                    <template>
                                                                                        <q-page>
                                                                                            <div class="">
                                                                                                <div class="container-fluid">
                                                                                                    <div class="row q-col-gutter-md q-pt-sm">
                                                                                                        <div class="col-12 col-md-12 col-sm-12 comp-grid text-center">
                                                                                                            <span class="text-dark h5  text-bold ">{{ $UserName }} </span>
                                                                                                            <q-btn  class="bg-light inset-shadow text-dark" rounded>2000pts</q-btn>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <!--tabs start-->
                                                                                                <div class="q-pa-md">
                                                                                                    <div class="q-gutter-y-md" style="max-width: 600px">
                                                                                                        <div class="fixed-bottom">
                                                                                                            <q-card class="bg-primary q-pt-xs" style="border-top-left-radius:20px;  border-top-right-radius:20px  " >
                                                                                                                <q-tab-panels v-model="tab" animated style="height:640px; border-top-left-radius:20px;  border-top-right-radius:20px ">
                                                                                                                <q-tab-panel name="mails">
                                                                                                                <div class="text-center q-pt-xl">
                                                                                                                    <div class="q-pt-xl q-pb-xl"></div>
                                                                                                                    <q-card class="my-card bg-primary q-pl-xs ">
                                                                                                                        <q-card class="my-card q-pa-md q-pb-xl">
                                                                                                                            <div class="q-pt-sm">
                                                                                                                                <div class="row text-right">
                                                                                                                                    <div class="col-sm-12 col-12 col-md-12">
                                                                                                                                        <q-btn to="account" class=""  size="sm" color="black" label="edit account" icon="las la-user-edit"></q-btn>
                                                                                                                                    </div>
                                                                                                                                </div>
                                                                                                                                <div class="row justify-content-center">
                                                                                                                                    <div class="col-sm-16 col-12 col-md-12">
                                                                                                                                        <q-icon name="las la-user-circle" size="xl" class="text-center text-primary"></q-icon>
                                                                                                                                    </div>
                                                                                                                                </div>
                                                                                                                                <q-chip><span class="text-dark text-bold"> {{ $UserName }} </span></q-chip>
                                                                                                                                <q-separator color="primary" />
                                                                                                                                <div class="q-pt-lg">
                                                                                                                                    <q-card class="my-card bg-primary q-pl-xs">
                                                                                                                                        <q-card class="my-card q-pa-xs">
                                                                                                                                            <span class="text-dark "> {{ $User.email }}</span>
                                                                                                                                        </q-card>
                                                                                                                                    </q-card>
                                                                                                                                    <div class="q-pt-sm"></div>
                                                                                                                                    <q-card class="my-card bg-primary q-pl-xs">
                                                                                                                                        <q-card class="my-card q-pa-xs">
                                                                                                                                            <span class="text-dark "> {{ $User.mobile }}</span>
                                                                                                                                        </q-card>
                                                                                                                                    </q-card>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </q-card>
                                                                                                                    </q-card>
                                                                                                                    <div class="q-pt-lg">
                                                                                                                        <div class="row justify-content-center">
                                                                                                                            <div class="col-12 col-sm-12 col-md-12">
                                                                                                                                <q-card class="my-card bg-primary q-pr-xs">
                                                                                                                                    <q-card class="my-card show-header q-pa-lg" >
                                                                                                                                        <span class="text-dark text-bold h4">Active Trivia</span>
                                                                                                                                        <q-separator color="primary" />
                                                                                                                                        <div class="row">
                                                                                                                                            <div class="col-12 col-sm-12 col-md-12">
                                                                                                                                                <q-expansion-item
                                                                                                                                                    v-model="expanded"
                                                                                                                                                    icon="lar la-check-circle"
                                                                                                                                                    label="How To Play"
                                                                                                                                                    color="primary"
                                                                                                                                                    >
                                                                                                                                                    <q-card-section>
                                                                                                                                                    <q-chip rounded class="bg-green text-white"><q-icon name="lar la-check-circle" class="text-primary"></q-icon></q-chip>
                                                                                                                                                    Answer as many Correct Answers for the 10 questions Provided! each Question is worth 5 points.
                                                                                                                                                    </q-card-section>
                                                                                                                                                </q-expansion-item> 
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                    </q-card></q-card>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    </q-tab-panel>
                                                                                                                    <q-tab-panel name="alarms">
                                                                                                                    <div class="text-h6"></div>
                                                                                                                    <div class="q-pt-lg text-center"><q-btn rounded size="lg" class=" rounded-circle bg-light inset-shadow"><q-icon name="las la-trophy" size="lg"></q-icon></q-btn></div>
                                                                                                                    <list-questions-page ref="leaderboardListPage"  :limit="20" sort-type="DESC" :show-header="true" :show-breadcrumbs="true" :show-footer="true" :paginate="true" v-if="ready">
                                                                                                                    </list-questions-page>
                                                                                                                    </q-tab-panel>
                                                                                                                    <q-tab-panel name="movies">
                                                                                                                    <div class="text-h6"></div>
                                                                                                                    <add-questions-page ref="questionsListPage"  :limit="20" sort-type="DESC" :show-header="true" :show-breadcrumbs="true" :show-footer="true" :paginate="true" v-if="ready">
                                                                                                                    </add-questions-page>
                                                                                                                    </q-tab-panel>
                                                                                                                    </q-tab-panels>
                                                                                                                    <q-separator />
                                                                                                                    <q-tabs
                                                                                                                    v-model="tab"
                                                                                                                    dense
                                                                                                                    class="bg-grey-3"
                                                                                                                    align="justify"
                                                                                                                    narrow-indicator
                                                                                                                    >
                                                                                                                    <q-tab name="mails" icon="las la-home" label="Home" />
                                                                                                                    <q-tab name="alarms" icon="las la-trophy" label="Leader Board" />
                                                                                                                    <q-tab name="movies" icon="las la-calendar-week" label="Live Schedule" />
                                                                                                                    </q-tabs>
                                                                                                                </q-card>
                                                                                                            </div>
                                                                                                        </div></div>
                                                                                                        <!--tabs end-->
                                                                                                    </div>
                                                                                                </q-page>
                                                                                            </template>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </template>
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
		 import addQuestionsPage from "../questions/add.vue";
import listQuestionsPage from "../questions/list.vue";
    import { PageMixin } from "../../mixins/page.js";
    import { ListPageMixin } from "../../mixins/listpage.js";
    import { mapActions, mapGetters, mapState } from "vuex";
    export default {
        name: 'listMainhomePage',
        components: {
            addQuestionsPage,listQuestionsPage
        },
        mixins: [PageMixin, ListPageMixin],
        props: {
            primaryKey : {
                type : String,
                default : 'id',
            },
            pageName : {
                type : String,
                default : 'mainhome',
            },
            routeName : {
                type : String,
                default : 'mainhomelist',
            },
            apiPath : {
                type : String,
                default : 'mainhome/index',
            },
            msgBeforeDelete: {
                type: String,
                default: "Are you sure you want to delete this record?",
            },
        },
        data() {
            return {
                 tab: 'mails'
            }
        },
        computed: {
            pageTitle:{
                get: function () {
                    //set browser page title
                    return "Mainhome"
                }
            },
            records: {
                get: function () {
                    return this.$store.getters["mainhome/records"];
                },
                set: function (value) {
                    this.$store.commit("mainhome/setRecords", value);
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
            ...mapActions("mainhome", ["fetchRecords", "deleteRecord"]),
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

<style scoped>
	/* 
	* Page Css 
	*/

</style>
