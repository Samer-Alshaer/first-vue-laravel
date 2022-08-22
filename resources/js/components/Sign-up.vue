<template>
  <div class="container" data-aos="zoom-in">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card" style="margin:230px 0">
          <div class="card-header">
            <div class="card-body">
              <form method="POST" action>
                <h2 class="text-center mb-4">Sign Up !</h2>

                <div class="row justify-content-center mb-1">
                  <div class="col-md-6">
                    <label for="Username" class="col-md-4 col-form-label text-md-start">Username</label>
                    <input
                      id="Username"
                      type="text"
                      :class="['form-control', errors.username ? 'is-invalid' : '']"
                      required
                      autocomplete="Username"
                      v-model="student.username"
                      autofocus
                    />
                    <span
                      class="text-danger"
                      style="font-size: 0.8rem;"
                      v-if="errors.username"
                    >{{errors.username[0]}}</span>
                  </div>
                </div>

                <div class="row mb-1 justify-content-center">
                  <div class="col-md-6">
                    <label for="Email" class="col-md-4 col-form-label text-md-start">Email</label>
                    <input
                      id="Email"
                      type="email"
                      :class="['form-control', errors.email ? 'is-invalid' : '']"
                      required
                      autocomplete="Email"
                      v-model="student.email"
                      autofocus
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
                      required
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
                    <button type="button" class="btn btn-primary px-5" @click="register()">Sign Up</button>
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
import axios from "axios";

export default {
  name: "Sign-up",
  data() {
    return {
      student: {
        username: "",
        email: "",
        password: ""
      },
      result: "",
      errors: []
    };
  },

  methods: {
    register() {
      axios.post("api/register", this.student).then(data => {
        this.result = data;
        try {
          if (this.result && this.result.data.data.status == 200) {
            Swal.fire({
              position: "top-end",
              icon: "success",
              title: "تمت عملية التسجيل بنجاح",
              showConfirmButton: false,
              timer: 2000
            });
            localStorage.setItem(
              "accessToken",
              JSON.stringify(this.result.data.data.token)
            );
            this.$router.push({ path: "/" });
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
    let user_token = localStorage.getItem("accessToken");
    if (user_token) {
      this.$router.push({ path: "/" });
    }
  }
};
</script>
