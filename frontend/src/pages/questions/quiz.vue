<template>
    <div>
        <template v-if="showHeader">
            <q-card bordered  flat  class="q-pa-md q-mb-md no-border-radius shadow-1">
                <div class="container-fluid">
                    <div class="row justify-between q-col-gutter-md">
                        <div class="col ">
                            <div class="text-h6 text-bold record-title">Questions</div>
                        </div>
                        <div class="col-md-auto col-12 ">
                            <q-btn    :rounded="false"  size=""  color="primary"  no-caps  unelevated    to="/questions/add" class="full-width">
                                <q-icon name="las la-plus"></q-icon>                                
                                Add New Questions 
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
                            <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md "> <div class="col comp-grid"> <div> <template> <div class="q-pt-lg text-center"><q-btn rounded size="lg" class=" rounded-circle bg-light inset-shadow"><q-icon name="las la-graduation-cap" size="lg"></q-icon></q-btn></div> <div class="q-pt-xl q-pb-lg"><q-separator color="black"/></div><div id="quiz-container" class="card" style="border-radius:0px;"> <span v-if="!startQuiz"> <div class=""> <span class="q-pb-sm text-bold  text-center"> </span> <div class="text-center"> <q-btn flat size="lg" class="text-dark" v-ripple @click="startQuizFunc()"> <q-spinner-rings
                            color="primary"
                            size="2em"
                            /> Take Quiz</q-btn> </div> </div> </span> <span v-else> <!-- New Section for User Statistics --> <div class="correctAnswers"> You have <strong><q-btn color="green" size="xs" rounded>{{ correctAnswers }} pts</q-btn> correct {{ pluralizeAnswer }}!</strong> </div> <div class="correctAnswers q-pb-sm text-bold text-dark"> Currently at question {{ index + 1 }} of <q-btn color="dark" size="xs" rounded>{{ questions.length }}</q-btn> </div> <!---<div class="container-fluid"> <div class="row float-center"> <q-circular-progress show-value class="text-green q-ma-md float-center":value="countDown":max="30"size="70px":color="colorState"/> </div> </div> --> <q-separator color="primary" /> <div class="q-pt-sm"> <q-icon name="las la-quote-left" size="sm" class="text-dark text-bold"></q-icon> <span class="text-dark text-bold" v-html="loading ? 'Loading...' : currentQuestion.question"></span> <form v-if="currentQuestion"> <div class="container-fluid"> <div class="q-pt-sm"> <div class="answer-section "> <q-btn color="dark" size="lg" class="q-pa-sm text-bold text-dark" v-for="answer in currentQuestion.answers":index="currentQuestion.key":key="answer"v-html="answer"@click.prevent="handleButtonClick" style="border-radius:0px;"></q-btn></div></div></div> </form> <hr class="divider" /> </div></span> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
		export default {
  name: "Quiz",
  data() {
    return {
      questions: [],
      loading: true,
      index: 0,
      startQuiz: false,
      colorState: "green",
      countDown : 30,
      timer:null,
      showScore: false,
      pointers:0,
    };
  },
  computed: {
    currentQuestion() {
      if (this.questions !== []) {
        return this.questions[this.index];
      }
      return null;
    },
    score() {
      if (this.questions !== []) {
        // Here, we want to collect data in an object about the users statistics - later be emitted on an event when users finishes quiz
        return {
          allQuestions: this.questions.length,
          answeredQuestions: this.questions.reduce((count, currentQuestion) => {
            if (currentQuestion.userAnswer) {
              // userAnswer is set when user has answered a question, no matter if right or wrong
              count++;
            }
            return count;
          }, 0),
          correctlyAnsweredQuestions: this.questions.reduce(
            (count, currentQuestion) => {
              if (currentQuestion.rightAnswer) {
                // rightAnswer is true, if user answered correctly
                count++;
              }
              return count;
            },
            0
          ),
        };
      } else {
        return {
          allQuestions: 0,
          answeredQuestions: 0,
          correctlyAnsweredQuestions: 0,
        };
      }
    },
    correctAnswers() {
      if (this.questions && this.questions.length > 0) {
        let streakCounter = 0;
        let pointers = 0;
        this.questions.forEach(function(question) {
          if (!question.rightAnswer) {
            return;
          } else if (question.rightAnswer === true) {
            streakCounter++;
            pointers=pointers+5;
            console.log(pointers)
          }
        });
        return pointers;
        return streakCounter;
      } else {
        return "--";
      }
    },
    pluralizeAnswer() {
      // For grammatical correctness
      return this.correctAnswers === 1 ? "Answer" : "Answers";
    },
    quizCompleted() {
      if (this.questions.length === 0) {
        return false;
      }
      /* Check if all questions have been answered */
      let questionsAnswered = 0;
      this.questions.forEach(function(question) {
        question.rightAnswer !== null ? questionsAnswered++ : null;
      });
      return questionsAnswered === this.questions.length;
    },
  },
  watch: {
    quizCompleted(completed) {
      /*
       * Watcher on quizCompleted fires event "quiz-completed"
       * up to parent App.vue component when completed parameter
       * returned by quizCompleted computed property true
       */
      completed &&
        setTimeout(() => {
          this.$emit("quiz-completed", this.score);
        }, 3000); // wait 3 seconds until button animation is over
    },
  },
  methods: {
      // countDownTimer() {
      //       if(this.countDown  < 5){
      //           this.colorState = "red";
      //       }
      //           if(this.countDown > 0) {
      //               this.timer = setTimeout(() => {
      //                   this.countDown -= 1
      //                   this.countDownTimer()
      //               }, 1000)
      //           }
      //           else{
      //               this.index++;
      //               clearTimeout(this.timer);
      //           this.countDown = 30;
      //       this.colorState ="green";
      //       this.countDownTimer();
      //           }
      //       },
        startQuizFunc(){
            this.index =0;
            this.startQuiz = true;
            //this.countDownTimer()
        },
    async fetchQuestions() {
        //this.countDownTimer();
      this.loading = true;
      let response = await fetch(
      "https://opentdb.com/api.php?amount=10&category=18&difficulty=hard"
      );
      let jsonResponse = await response.json();
      let index = 0; // index is used to identify single answer
      let data = jsonResponse.results.map((question) => {
        // put answers on question into single array
        question.answers = [
          question.correct_answer,
          ...question.incorrect_answers,
        ];
        /* Shuffle question.answers array */
        for (let i = question.answers.length - 1; i > 0; i--) {
          const j = Math.floor(Math.random() * (i + 1));
          [question.answers[i], question.answers[j]] = [
            question.answers[j],
            question.answers[i],
          ];
        }
        // mention in Step 1
        question.rightAnswer = null;
        question.key = index;
        index++;
        return question;
      });
      this.questions = data;
      this.loading = false;
    },
    handleButtonClick: function(event) {
      /* Find index to identiy question object in data */
      let index = event.target.getAttribute("index");
      let pollutedUserAnswer = event.target.innerHTML; // innerHTML is polluted with decoded HTML entities e.g ' from &#039;
      /* Clear from pollution with ' */
      let userAnswer = pollutedUserAnswer.replace(/'/, "&#039;");
      /* Set userAnswer on question object in data */
      this.questions[index].userAnswer = userAnswer;
      /* Set class "clicked" on button with userAnswer -> for CSS Styles; Disable other sibling buttons */
      event.target.classList.add("clicked");
      let allButtons = document.querySelectorAll(`[index="${index}"]`);
      for (let i = 0; i < allButtons.length; i++) {
        if (allButtons[i] === event.target) continue;
        allButtons[i].setAttribute("disabled", "");
      }
      /* Invoke checkAnswer to check Answer */
      this.checkAnswer(event, index);
    },
    checkAnswer: function(event, index) {
      let question = this.questions[index];
      if (question.userAnswer) {
        if (this.index < this.questions.length - 1) {
          setTimeout(
            function() {
                 // clearTimeout(this.timer);
               // this.countDown = 30;
            //this.colorState ="green";
            //this.countDownTimer();
              this.index += 1;
            }.bind(this),
            3000
          );
        }
        if (question.userAnswer === question.correct_answer) {
          /* Set class on Button if user answered right, to celebrate right answer with animation joyfulButton */
          event.target.classList.add("rightAnswer");
          /* Set rightAnswer on question to true, computed property can track a streak out of 10 questions */
          this.questions[index].rightAnswer = true;
        } else {
          /* Mark users answer as wrong answer */
          event.target.classList.add("wrongAnswer");
          this.questions[index].rightAnswer = false;
          /* Show right Answer */
          let correctAnswer = this.questions[index].correct_answer;
          let allButtons = document.querySelectorAll(`[index="${index}"]`);
          allButtons.forEach(function(button) {
            if (button.innerHTML === correctAnswer) {
              button.classList.add("showRightAnswer");
            }
          });
        }
      }
    },
  },
  mounted() {
    this.fetchQuestions();
  },
};
	</script>
<style scoped>
    /* 
    * Page Css 
    */
.answer-section {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.card{
    min-width: 100%;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 10px 10px 42px 0px rgba(0, 0, 0, 0.75);
}
.card-q{
    min-width: 60%;
}
</style>
