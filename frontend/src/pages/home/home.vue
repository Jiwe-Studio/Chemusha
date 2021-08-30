    <template>
        <q-page>
            <div class="">
                <div class="container-fluid">
                    <div class="row q-col-gutter-md">
                        <div class="col comp-grid">
                            <div class=""> <div class="row bg-grey-3 q-col-gutter-md fixed-center inset-shadow" style="border-radius:20px;">
                                <div class="text-center col-12 col-sm-12 col-md-12 comp-grid q-pb-sm">
                                    <q-avatar size="100px" class="inset-shadow" style="border:solid;">
                                        <q-btn class="text-dark" to="mainhome" flat icon="las la-user-graduate" size="xl"></q-btn></q-avatar>
                                    </div>
                                    <q-chip> click your graduation cap to start </q-chip>
                                    <q-separator color="primary" />
                                </div>
                            </div></div>
                        </div>
                    </div>
                </div>
            </div>
        </q-page>
    </template>
    <script>
		import { PageMixin } from "../../mixins/page.js";
		export default {
			name: 'HomeComponent',
			components: {
			},
			mixins: [PageMixin],
			props: {
			},
			data: function() {
				return {
					ready: false,
				}
			},
			methods: {
			},
			mounted: function(){
				this.ready = true;
			}
		};
	</script>
