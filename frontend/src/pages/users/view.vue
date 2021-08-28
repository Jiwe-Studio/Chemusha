<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">View Users</div>
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
                                <div class="bg-primary text-white q-pa-lg q-my-md">
                                    <div class="row q-col-gutter-lg">
                                        <div class="col-auto">
                                            <q-avatar font-size="48px" icon="las la-user"></q-avatar>
                                        </div>
                                        <div class="col">
                                            <div class="text-h4 text-weight-bold"> {{ item.username }}</div>
                                            <!--<div class="text-subtitle2">{{ item.email }}</div>-->
                                        </div>
                                    </div>
                                </div>
                                <div v-if="!loading">
                                    <q-item clickable v-ripple>
                                        <q-item-section>
                                            <q-item-label caption>Id: </q-item-label>
                                            <q-item-label>{{ item.id }}</q-item-label>
                                        </q-item-section>
                                    </q-item>
                                    <q-separator></q-separator>
                                    <q-item clickable v-ripple>
                                        <q-item-section>
                                            <q-item-label caption>Username: </q-item-label>
                                            <q-item-label>{{ item.username }}</q-item-label>
                                        </q-item-section>
                                    </q-item>
                                    <q-separator></q-separator>
                                    <q-item clickable v-ripple>
                                        <q-item-section>
                                            <q-item-label caption>Email: </q-item-label>
                                            <q-item-label>{{ item.email }}</q-item-label>
                                        </q-item-section>
                                    </q-item>
                                    <q-separator></q-separator>
                                    <q-item clickable v-ripple>
                                        <q-item-section>
                                            <q-item-label caption>Mobile: </q-item-label>
                                            <q-item-label>{{ item.mobile }}</q-item-label>
                                        </q-item-section>
                                    </q-item>
                                    <q-separator></q-separator>
                                    <div class="q-pa-md">
                                        <q-btn    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" icon="las la-edit"  class="q-mx-xs" title="Edit This Record"  :to="`/users/edit/${item.id }`">
                                        </q-btn>
                                        <q-btn    :rounded="false"  no-caps  unelevated   size="sm" padding="xs" color="accent" icon="las la-times" class="q-mx-xs" @click="deleteItem(item.id)" title="Delete this record">
                                        </q-btn>
                                    </div>
                                </div>
                                <div v-else class="q-pa-sm text-center">
                                    <q-spinner :size="40" color="primary" indeterminate></q-spinner>
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
		name: 'viewUsersPage',
		components: {
		},
		mixins: [PageMixin, ViewPageMixin],
		props: {
			pageName: {
				type : String,
				default : 'users',
			},
			routeName : {
				type : String,
				default : 'usersview',
			},
			apiPath: {
				type : String,
				default : 'users/view',
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
					return "View Users"
				}
			}
		},
		meta () {
			return {
				title: this.pageTitle
			}
		},
		methods: {
			...mapActions("users", [ "fetchRecord", "deleteRecord"]),
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
