<template>
    <div class="container">
        <div class="row justify-center">
            <div class="col-md-6 col-12">
                <q-card  flat bordered class="q-my-lg  text-center">
                    <q-card-section>
                        <div class="text-h5 text-bold text-positive">
                             <q-icon name="las la-check-circle"></q-icon> Your password has been changed successfully
                        </div>
                        <br />
                        <q-btn to="/" flat color="info">Click here to login</q-btn>
                    </q-card-section>
                </q-card>
            </div>
        </div>
    </div>
</template>
<script>
	export default {
		props: {},
		data: function () {
			return {
				email: "",
			};
		},
		methods: {},
	};
</script>