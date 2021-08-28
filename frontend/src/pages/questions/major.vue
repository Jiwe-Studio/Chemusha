<template>
    <div>
        <div class="">
            <div class="container-fluid">
                <div class="row q-col-gutter-md">
                    <div class="col comp-grid">
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
		    //[--PAGE-IMPORT-STATEMENT--]
    import quizQuestionsPage from "../questions/quiz.vue";
    import { PageMixin } from "../../mixins/page.js";
    import { ListPageMixin } from "../../mixins/listpage.js";
    import { mapActions, mapGetters, mapState } from "vuex";
    import axios from 'axios';
export default {
  name: "App",
  components: {
   quizQuestionsPage
  },
  data() {
    return {
      quizKey: 0,
      showModal: false,
      quizScore: {
        allQuestions: 0,
        answeredQuestions: 0,
        correctlyAnsweredQuestions: 0,
      },
    };
  },
  methods: {
    handleQuizCompleted(score) {
      this.quizScore = score;
      this.showModal = true;
    },
    updateQuiz() {
      this.showModal = false;
      this.quizKey++;
    },
  },
};
	</script>

<style scoped>
	/* 
	* Page Css 
	*/

</style>
