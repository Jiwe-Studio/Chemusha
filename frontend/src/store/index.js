import Vue from 'vue'
import Vuex from 'vuex'
import { pageComponents } from "./page_components.js"
import { auth } from "./auth.js"
import { questions } from "./questions.js"
import { leaderboard } from "./leaderboard.js"
import { users } from "./users.js"
import { mainhome } from "./mainhome.js"
import { test } from "./test.js"
Vue.use(Vuex)
export default function (/* { ssrContext } */) {
	const Store = new Vuex.Store({
		modules: {
			pageComponents,
			auth,
		questions,
		leaderboard,
		users,
		mainhome,
		test
		},
		// enable strict mode (adds overhead!)
		// for dev mode only
		strict: process.env.DEV
	})
	return Store
}