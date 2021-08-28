<template>
    <div>
        <div class="">
            <div class="container-fluid">
                <div class="row q-col-gutter-md">
                    <div class="col-md-12 col-sm-12 col-12 comp-grid">
                        <div>
                            <template>
                                <div>
                                    <div class="">
                                        <div class="container">
                                            <div class="row q-col-gutter-md">
                                                <div class="col-md-9 col-12 comp-grid">
                                                    <q-card bordered  flat  class="q-pa-md shadow-1">
                                                        <div>
                                                            <template>
                                                                <div>
                                                                    <div class="">
                                                                        <div class="container">
                                                                            <div class="row q-col-gutter-md">
                                                                                <div class="col-md-9 col-12 comp-grid">
                                                                                    <q-card bordered  flat  class="q-pa-md shadow-1">
                                                                                        <div>
                                                                                            <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md"> <div class="col comp-grid"> <div> <template> <div> <div class=""> <div class="container-fluid"> <div class="row q-col-gutter-md "> <div class="col comp-grid"> <div> <template> <div class="q-pt-lg text-center"><q-btn rounded size="lg" class=" rounded-circle bg-light inset-shadow"><q-icon name="las la-graduation-cap" size="lg"></q-icon></q-btn></div> <div class="q-pt-xl q-pb-lg"><q-separator color="black"/></div><div id="quiz-container" class="card" style="border-radius:0px;"> <span v-if="!startQuiz"> <div class=""> <span class="q-pb-sm text-bold  text-center"> </span> <div class="text-center"> <q-btn flat size="lg" class="text-dark" v-ripple @click="startQuizFunc()"> <q-spinner-rings
                                                                                            color="primary"
                                                                                            size="2em"
                                                                                            /> Take Quiz</q-btn> </div> </div> </span> <span v-else> <!-- New Section for User Statistics --> <div class="correctAnswers"> You have <strong><q-btn color="green" size="xs" rounded>{{ correctAnswers }} pts</q-btn> correct {{ pluralizeAnswer }}!</strong> </div> <div class="correctAnswers q-pb-sm text-bold text-dark"> Currently at question {{ index + 1 }} of <q-btn color="dark" size="xs" rounded>{{ questions.length }}</q-btn> </div> <!---<div class="container-fluid"> <div class="row float-center"> <q-circular-progress show-value class="text-green q-ma-md float-center":value="countDown":max="30"size="70px":color="colorState"/> </div> </div> --> <q-separator color="primary" /> <div class="q-pt-sm"> <q-icon name="las la-quote-left" size="sm" class="text-dark text-bold"></q-icon> <span class="text-dark text-bold" v-html="loading ? 'Loading...' : currentQuestion.question"></span> <form v-if="currentQuestion"> <div class="container-fluid"> <div class="q-pt-sm"> <div class="answer-section "> <q-btn color="dark" size="lg" class="q-pa-sm text-bold text-dark" v-for="answer in currentQuestion.answers":index="currentQuestion.key":key="answer"v-html="answer"@click.prevent="handleButtonClick" style="border-radius:0px;"></q-btn></div></div></div> </form> <hr class="divider" /> </div></span> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template> </div> </div> </div> </div> </div> </div> </template>
                                                                                            <ValidationObserver ref="observer" v-slot="{ invalid }" tag="form" @submit.prevent="startSaveRecord()" @reset="resetForm">
                                                                                                <div class="hidden">
                                                                                                    <input name="ctrluser_id"  ref="ctrluser_id" v-model="formData.user_id" type="hidden" />
                                                                                                    <div class="">
                                                                                                        <div class="row">
                                                                                                            <div class="col-sm-3 col-12">
                                                                                                                Points 
                                                                                                            </div>
                                                                                                            <div class="col-sm-9 col-12">
                                                                                                                <ValidationProvider :rules="{}" name="Points" v-slot="{ errors, invalid, validated }">
                                                                                                                    <q-input outlined dense  ref="ctrlpoints" v-model="formData.points"  label="Points" type="hidden" placeholder="Enter Points"    
                                                                                                                    class="" :error="invalid && validated" :error-message="errors[0]">
                                                                                                                    </q-input>
                                                                                                                </ValidationProvider>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="">
                                                                                                        <div class="row">
                                                                                                            <div class="col-sm-3 col-12">
                                                                                                                Date 
                                                                                                            </div>
                                                                                                            <div class="col-sm-9 col-12">
                                                                                                                <ValidationProvider :rules="{}" name="Date" v-slot="{ errors, invalid, validated }">
                                                                                                                    <q-input outlined dense  ref="ctrldate" v-model="formData.date"  label="Date" type="text" placeholder="Enter Date"    
                                                                                                                    class="" :error="invalid && validated" :error-message="errors[0]">
                                                                                                                    </q-input>
                                                                                                                </ValidationProvider>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="">
                                                                                                        <div class="row">
                                                                                                            <div class="col-sm-3 col-12">
                                                                                                                Username 
                                                                                                            </div>
                                                                                                            <div class="col-sm-9 col-12">
                                                                                                                <ValidationProvider :rules="{}" name="Username" v-slot="{ errors, invalid, validated }">
                                                                                                                    <q-input outlined dense  ref="ctrlusername" v-model="formData.username=$UserName"  label="Username" type="number" placeholder="Enter Username"    
                                                                                                                    class="" :error="invalid && validated" :error-message="errors[0]">
                                                                                                                    </q-input>
                                                                                                                </ValidationProvider>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div></div>
                                                                                                    <div v-if="showScore===true">
                                                                                                        <div class="row">
                                                                                                            <div class="col-12 col-sm-12 col-md-12">
                                                                                                                <q-dialog v-model="seamless" seamless position="bottom" >
                                                                                                                    <q-card class="bg-primary q-pt-xs" style="border-top-right-radius:20px; border-top-left-radius:20px;">
                                                                                                                        <q-card style="height:700px; border-top-right-radius:20px; border-top-left-radius:20px;">
                                                                                                                            <q-btn flat round icon="las la-compress-arrows-alt" class="absolute-top-right" v-close-popup />
                                                                                                                                <div class="row text-center q-pt-lg q-pb-sm">
                                                                                                                                    <div class="col-12 col-sm-12 col-md-12"> 
                                                                                                                                        <q-btn  size="xl" icon="lar la-check-circle" rounded class="inset-shadow text-dark"></q-btn>
                                                                                                                                    </div></div>
                                                                                                                                    <q-separator color="primary" />
                                                                                                                                    <q-separator color="primary" />
                                                                                                                                    <q-card-section class="row items-center no-wrap">
                                                                                                                                    <div class="row text-center"> 
                                                                                                                                        <div class="col-12 col-sm-12 col-md-12 q-pb-xl">
                                                                                                                                            <h5 class="text-dark text-bold text-center text-capitalize">hi there {{ $UserName }}! Here are your stats <q-separator color="primary" /></h5>
                                                                                                                                            <q-chip color="black" class="q-pl-xs"><q-chip><h6 class="text-dark text-center text-bold"> points Earned <q-icon name="las la-chevron-right"></q-icon> {{ correctAnswers }}</h6></q-chip></q-chip>
                                                                                                                                        </div>
                                                                                                                                        <div class="col-12 col-sm-12 col-md-12 q-pt-xl">
                                                                                                                                            <q-btn @click="startSaveRecord"    :rounded="false"  color="dark"  size="xl" no-caps  unelevated   :disabled="invalid" icon="las la-check-circle" :loading="saving"  style="width:100%; border-radius:0px;">
                                                                                                                                                <q-spinner-oval slot="loading" /> Submit Scores
                                                                                                                                            </q-btn>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                                                                                    </q-card-section>
                                                                                                                                </q-card></q-card>
                                                                                                                            </q-dialog></div></div>
                                                                                                                        </div>
                                                                                                                    </ValidationObserver>
                                                                                                                    <slot :submit="submit" :saving="saving"></slot>
                                                                                                                </div>
                                                                                                            </q-card>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </template>
                                                                                </div>
                                                                            </q-card>
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
                            </div>
                        </template>
                        <script>
		//[--PAGE-IMPORT-STATEMENT--]
    import { PageMixin } from "../../mixins/page.js";
    import { AddPageMixin } from "../../mixins/addpage.js";
    import { mapActions } from "vuex";
    export default {
        name: 'addQuestionsPage',
        components: {
            //[--PAGE-COMPONENT-NAME--]
        },
        mixins: [PageMixin, AddPageMixin],
        props:{
            pageName : {
                type : String,
                default : 'questions',
            },
            routeName : {
                type : String,
                default : 'questionsadd',
            },
            apiPath : {
                type : String,
                default : 'questions/add',
            },
        },
        data() {
            return {
                formData: {
                    user_id: this.$UserID,
                    date: this.$utils.dateNow(), 
                    username: this.$UserName,
                    points:""
                },
                      questions: [],
                      loading: true,
                      index: 0,
                      startQuiz: false,
                      colorState: "green",
                      countDown : 30,
                      timer:null,
                      showScore: false,
                      pointer:0,
                      seamless: false
            }
        },
        computed: {
            pageTitle:{
                get: function () {
                    return "Add New Questions"
                }
            },
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
            console.log(pointers.toString())
          }
        });
        return this.formData.points=pointers.toString();
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
        meta () {
            return {
                title: this.pageTitle
            }
        },
        watch: {
    quizCompleted(completed) {
      /*
       * Watcher on quizCompleted fires event "quiz-completed"
       * up to parent App.vue component when completed parameter
       * returned by quizCompleted computed property true
       */
        this.showScore = true;
        this.seamless = true;
      completed &&
        setTimeout(() => {
          this.$emit("quiz-completed", this.score);
        }, 3000); // wait 3 seconds until button animation is over
    },
  },
        methods: {
                startQuizFunc(){
            this.index =0;
            this.startQuiz = true;
            //this.countDownTimer()
        },
            ...mapActions('questions', ['saveRecord']),
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
            async startSaveRecord(){
                const isFormValid = await this.$refs.observer.validate();
                if(isFormValid){
                    this.saving = true;
                    let payload = this.normalizedFormData();
                    let url = this.apiUrl;
                    let data = { url, payload  }
                    this.saveRecord(data).then((response) => {
                        this.record = response.data;
                        this.id = this.record['id'];
                        this.saving = false;
                        this.resetForm();
                        this.closeDialogs();// close page dialog that if opened
                        this.flashMsg(this.msgAfterSave);
                        this.navigateTo(`/mainhome`);
                    },
                     (response) => {
                        this.saving = false;
                        this.showPageRequestError(response);
                    });
                }
            },
            resetForm (){
                this.seamless=false;
                this.startQuiz=false;
                this.formData = {user_id: this.$UserID, points: "", date: this.$utils.dateNow(), username: this.$UserName, };
                requestAnimationFrame(() => {
                    this.$refs.observer.reset();
                });
                this.$EventBus.$emit("resetForm");
            },
        },
        mounted : function() {
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
.ans-option-btn{
    min-width: 50%;
    font-size: 16px;
    color: #ffffff;
    align-items: center;
    cursor: pointer;
    margin-bottom: 5px;


}

.timer-text {
  background: rgb(230, 153, 12);
  padding: 15px;
  margin-top: 20px;
  margin-right: 20px;
  border: 5px solid rgb(255, 189, 67);
  border-radius: 15px;
  text-align: center;
}

.card-img, .card-img-top {
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);
    height: 350px;
}
</style>