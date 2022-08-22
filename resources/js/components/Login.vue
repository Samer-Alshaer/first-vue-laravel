<template>
  <div class="container" data-aos="zoom-in">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card" style="margin:230px 0">
          <div class="card-header">
            <div class="card-body">
              <form>
                <h2 class="text-center mb-2">Login</h2>
                <div class="row mb-1 justify-content-center">
                  <div class="col-md-6">
                    <label for="Email" class="col-md-4 col-form-label text-md-start">Email</label>
                    <input
                      id="Email"
                      type="email"
                      :class="['form-control', errors.email ? 'is-invalid' : '']"
                      required
                      autocomplete="Email"
                      autofocus
                      v-model="student.email"
                    />
                    <span
                      class="text-danger"
                      style="font-size: 0.8rem;"
                      v-if="errors.email"
                    >{{errors.email[0]}}</span>
                  </div>
                </div>

                <div class="row mb-3 justify-content-center">
                  <div class="col-md-6">
                    <label for="Password" class="col-md-4 col-form-label text-md-start">Password</label>
                    <input
                      id="Password"
                      type="password"
                      :class="['form-control', errors.password ? 'is-invalid' : '']"
                      name="Password"
                      v-model="student.password"
                      autocomplete="current-password"
                    />
                    <span
                      class="text-danger"
                      style="font-size: 0.8rem;"
                      v-if="errors.password"
                    >{{errors.password[0]}}</span>
                  </div>
                </div>

                <div class="row mb-0">
                  <div class="d-flex justify-content-center">
                    <button type="button" @click="login()" class="btn btn-primary px-5">Login</button>
                  </div>
                  <small class="text-center mt-3">If you not have an account</small>
                  <div class="d-flex justify-content-center mt-2">
                    <router-link to="Sign-up">
                      <button type="button" class="btn btn-primary px-5">Sign up!</button>
                    </router-link>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "Login",
  data: function() {
    return {
      student: {
        email: null,
        password: null
      },
      result: null,
      errors: []
    };
  },

  methods: {
    login: function() {
      axios.post("api/login", this.student, {}).then(data => {
        this.result = data;
        try {
          if (this.result && this.result.data.data.status == "success") {
            localStorage.setItem(
              "accessToken",
              JSON.stringify(this.result.data.data.token)
            );
            this.$router.push({ path: "/" });
            this.$store.state.currentUser.isLogin = true;
            Swal.fire({
              toast: true,
              icon: "success",
              title: "Signed in Successfully",
              animation: false,
              position: "top-right",
              showConfirmButton: false,
              timer: 2000,
              timerProgressBar: true,
              didOpen: toast => {
                toast.addEventListener("mouseenter", Swal.stopTimer);
                toast.addEventListener("mouseleave", Swal.resumeTimer);
              }
            });
          }
        } catch (error) {
          if ((this.result.data.status = "error")) {
            this.errors = this.result.data.errors;
          } else {
            this.errors = [];
          }
        }
      });
    }
  },

  mounted() {
    let usertoken = localStorage.getItem("accessToken");
    if (usertoken) {
      this.$router.push({ path: "/" });
    }
  }
};
</script>
