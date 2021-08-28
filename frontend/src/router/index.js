import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter)
let routes = [
	{
		name: 'main',
		path: '/',
		component: () => import('layouts/MainLayout.vue'),
		children: [
			
			{ path: '/questions/', name: 'questionslist', component: () => import('pages/questions/list.vue'), props: true},
			{ path: '/questions/(list|index)/:fieldName?/:fieldValue?', name: 'questionslistfilter', component: () => import('pages/questions/list.vue'), props: true},
			
	
			{ path: '/questions/view/:id', name: 'questionsview', component: () => import('pages/questions/view.vue'), props: true},
			{ path: '/questions/add', name: 'questionsadd' , component: () => import('pages/questions/add.vue'), props: true},
			{ path: '/questions/edit/:id' , name: 'questionsedit' , component: () => import('pages/questions/edit.vue') , props: true},
			{ path: '/questions/quiz', name: 'questionsquiz' , component: () => import('pages/questions/quiz.vue'), props: true},
			{ path: '/questions/major', name: 'questionsmajor' , component: () => import('pages/questions/major.vue'), props: true},
			{ path: '/questions/attempt', name: 'questionsattempt' , component: () => import('pages/questions/attempt.vue'), props: true},
			{ path: '/questions/manage_leaderboard', name: 'questionsmanage_leaderboard' , component: () => import('pages/questions/manage_leaderboard.vue'), props: true},
			{ path: '/leaderboard/', name: 'leaderboardlist', component: () => import('pages/leaderboard/list.vue'), props: true},
			{ path: '/leaderboard/(list|index)/:fieldName?/:fieldValue?', name: 'leaderboardlistfilter', component: () => import('pages/leaderboard/list.vue'), props: true},
			
	
			{ path: '/leaderboard/view/:id', name: 'leaderboardview', component: () => import('pages/leaderboard/view.vue'), props: true},
			{ path: '/leaderboard/add', name: 'leaderboardadd' , component: () => import('pages/leaderboard/add.vue'), props: true},
			{ path: '/leaderboard/edit/:id' , name: 'leaderboardedit' , component: () => import('pages/leaderboard/edit.vue') , props: true},
			{ path: '/users/', name: 'userslist', component: () => import('pages/users/list.vue'), props: true},
			{ path: '/users/(list|index)/:fieldName?/:fieldValue?', name: 'userslistfilter', component: () => import('pages/users/list.vue'), props: true},
			
	
			{ path: '/users/view/:id', name: 'usersview', component: () => import('pages/users/view.vue'), props: true},
			{ path: '/index/register', name: 'usersuserregister' , component: () => import('pages/index/userregister.vue'), props: true},
			{ path: '/account/edit', name: 'usersaccountedit' , component: () => import('pages/account/accountedit.vue'), props: true},
			{ path: '/account', name: 'usersaccountview' , component: () => import('pages/account/accountview.vue'), props: true},
			{ path: '/users/add', name: 'usersadd' , component: () => import('pages/users/add.vue'), props: true},
			{ path: '/users/edit/:id' , name: 'usersedit' , component: () => import('pages/users/edit.vue') , props: true},
			{ path: '/mainhome/', name: 'mainhomelist', component: () => import('pages/mainhome/list.vue'), props: true},
			{ path: '/mainhome/(list|index)/:fieldName?/:fieldValue?', name: 'mainhomelistfilter', component: () => import('pages/mainhome/list.vue'), props: true},
			
	
			{ path: '/mainhome/view/:id', name: 'mainhomeview', component: () => import('pages/mainhome/view.vue'), props: true},
			{ path: '/mainhome/add', name: 'mainhomeadd' , component: () => import('pages/mainhome/add.vue'), props: true},
			{ path: '/mainhome/edit/:id' , name: 'mainhomeedit' , component: () => import('pages/mainhome/edit.vue') , props: true},
			{ path: '/test/', name: 'testlist', component: () => import('pages/test/list.vue'), props: true},
			{ path: '/test/(list|index)/:fieldName?/:fieldValue?', name: 'testlistfilter', component: () => import('pages/test/list.vue'), props: true},
			
	
			{ path: '/test/view/:id', name: 'testview', component: () => import('pages/test/view.vue'), props: true},
			{ path: '/test/add', name: 'testadd' , component: () => import('pages/test/add.vue'), props: true},
			{ path: '/test/edit/:id' , name: 'testedit' , component: () => import('pages/test/edit.vue') , props: true},

			
			{ path: '/index/forgotpassword', name: 'forgotpassword', component: () => import('pages/index/forgotpassword.vue'), props: true},
			{ path: '/index/resetpassword', name: 'resetpassword', component: () => import('pages/index/resetpassword.vue'), props: true},
			{ path: '/index/resetpassword_completed', name: 'resetpassword_completed', component: () => import('pages/index/resetpassword_completed.vue'), props: true},
	
			
			{ path: '/error/forbidden', component: () => import('pages/errors/forbidden.vue') },
			{ path: '/error/notfound', component: () => import('pages/errors/pagenotfound.vue') }
		]
	},
];


/*
 * If not building with SSR mode, you can
 * directly export the Router instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Router instance.
 */

export default async function ({ store, ssrContext }) {
	let mainRoute = routes.find(x => x.name = "main");

	
	let loginToken = store.getters["auth/getLoginToken"];
	if(loginToken){
		try{
			await store.dispatch('auth/getUserData'); //get current user data from api on page load

			mainRoute.children.push({ path: '/(home)?', name: 'home', component: () => import('pages/home/home.vue') });
		}
		catch(e){
			/*
			 * getting current user detail failed
			 * token must be invalid
			*/
			mainRoute.children.push({ path: '/(index)?', name: 'index', component: () => import('pages/index/index.vue') });
		}
	}
	else{
		/*
		 * user has not loggedIn
		 * show login page
		*/
		mainRoute.children.push({ path: '/(index|home)?', name: 'index', component: () => import('pages/index/index.vue') });
	}


	// Always leave this as last one
	if (process.env.MODE !== 'ssr') {
		mainRoute.children.push({path: '*', component: () => import('pages/errors/pagenotfound.vue')});
	}

	const Router = new VueRouter({
		scrollBehavior: () => ({ x: 0, y: 0 }),
		routes,
		// Leave these as they are and change in quasar.conf.js instead!
		// quasar.conf.js -> build -> vueRouterMode
		// quasar.conf.js -> build -> publicPath
		mode: process.env.VUE_ROUTER_MODE,
		base: process.env.VUE_ROUTER_BASE
	});
	return Router
}