<template>
  <div class="container" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="400">
    <div class="row justify-content-center">
      <div class="col-md-8 students-cont">
        <h1 class="text-center mb-4">Students</h1>
        <div class="search">
          <form class="d-flex justify-content-center">
            <div class="input-group search-input justify-content-center">
              <input type="text" v-model="Sea" @keyup="search()" placeholder="Search" />
            </div>
            <i class="bx bx-search light-search-icon"></i>
          </form>
        </div>
        <table
          class="table table-bordered"
          style="background-color: rgb(255 255 255);color: rgb(131 117 117); box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;"
        >
          <thead style="background-color:rgb(126 119 124);color: rgb(255, 255, 255)">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Picture</th>
              <th scope="col">Name</th>
              <th scope="col">Age</th>
              <th scope="col">Added Date</th>
              <th scope="col">Operations</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item ,index) in result.data" :key="item.id">
              <td>{{result.from + index}}</td>
              <td>
                <img
                  :src="`Uploads/${item.img}`"
                  @click="showImg"
                  id="img"
                  style="width: 70px; cursor:pointer"
                  alt
                />
              </td>
              <td>{{item.name}}</td>
              <td>{{item.age}}</td>
              <td>{{item.adate}}</td>
              <td>
                <div class="bx-con">
                  <i
                    @click="getBook(item.id)"
                    class="bx bx-show btn-primary"
                    data-bs-toggle="modal"
                    data-bs-target="#showStudent"
                  ></i>

                  <router-link :to="'/add-book/' + item.id">
                    <i class="bx bxs-book-add btn-primary"></i>
                  </router-link>
                  <router-link :to="'/update-student/' + item.id">
                    <i class="bx bxs-edit btn-primary"></i>
                  </router-link>
                  <i class="bx bx-trash btn-primary" @click="deletestudent(item.id)"></i>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
        <pagination
          class="d-flex justify-content-center"
          :data="result"
          @pagination-change-page="search"
        ></pagination>
        <div style="margin-top: 30px;">
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#addStudent"
            data-bs-whatever="@getbootstrap"
          >Add Student +</button>
        </div>
      </div>
    </div>

    <!-- Add Students -->
    <div
      class="modal fade"
      id="addStudent"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h5 class="modal-title" id="exampleModalLabel">Add New Student</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="mb-3">
                <label for="name" class="col-form-label">Name:</label>
                <input
                  type="text"
                  v-model="name"
                  :class="['form-control', errors.name ? 'is-invalid' : '']"
                  id="name"
                />
                <span
                  class="text-danger"
                  style="font-size: 0.8rem;"
                  v-if="errors.name"
                >{{errors.name[0]}}</span>
              </div>
              <div class="mb-3">
                <label for="age" class="col-form-label">Age:</label>
                <input
                  type="text"
                  v-model="age"
                  :class="['form-control', errors.age ? 'is-invalid' : '']"
                  id="age"
                />
                <span
                  class="text-danger"
                  style="font-size: 0.8rem;"
                  v-if="errors.age"
                >{{errors.age[0]}}</span>
              </div>
              <div class="mb-3">
                <label for="img" class="col-form-label">Picture:</label>
                <input
                  type="file"
                  ref="file"
                  @change="addImage()"
                  :class="['form-control', errors.img ? 'is-invalid' : '']"
                  name="img"
                  id="imginput"
                />
                <span
                  class="text-danger"
                  style="font-size: 0.8rem;"
                  v-if="errors.img"
                >{{errors.img[0]}}</span>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" id="close" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" @click="addstudent()" class="btn btn-primary">Add</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Show book -->
    <div
      class="modal fade"
      id="showStudent"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalScrollableTitle">show Book</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div
              class="card mb-3"
              style="max-width: 540px;"
              v-for="(item ,index) in Books.data"
              :key="index"
            >
              <div class="row g-0">
                <div class="col-md-4">
                  <img :src="`Uploads/Books/${item.img}`" style="width: 150px;height:150px" alt />
                </div>
                <div class="col-md-8">
                  <div class="card-body">
                    <h5 class="card-title">{{item.title}}</h5>
                    <p class="card-text">{{item.description}}</p>
                    <p class="card-text d-flex justify-content-end align-items-center">
                      <i class="bx bx-trash btn-primary" @click="deleteBook(item.id)"></i>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              id="closeBook"
              data-bs-dismiss="modal"
            >Close</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import update_student from "./update-student";

export default {
  name: "students",
  components: {
    update_student
  },
  data: function() {
    return {
      name: "",
      age: "",
      img: "",
      date: new Date(Date.now()).toLocaleString().substring(0, 21),
      result: {},
      Sea: "",
      result_add: "",
      Books: "",
      errors: []
    };
  },
  created() {
    this.search();
  },

  methods: {
    addstudent: function() {
      let formData = new FormData();
      formData.append("name", this.name);
      formData.append("age", this.age);
      formData.append("img", this.img);
      formData.append("adate", this.date);
      var token = JSON.parse(localStorage.getItem("accessToken"));
      axios
        .post("api/addstudent?token=" + token, formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(data => {
          this.result_add = data;
          if (this.result_add.data.status == "success") {
            $("#close").click();
            this.search();
            (this.name = ""), (this.age = "");
            document.getElementById("imginput").value = "";
            Swal.fire({
              toast: true,
              icon: "success",
              title: "Posted successfully",
              animation: false,
              position: "bottom",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
              didOpen: toast => {
                toast.addEventListener("mouseenter", Swal.stopTimer);
                toast.addEventListener("mouseleave", Swal.resumeTimer);
              }
            });
          }
        })
        .catch(error => {
          this.errors = error.response.data.errors;
        });
    },

    addImage() {
      this.img = this.$refs.file.files[0];
    },

    showImg() {
      window.open(document.getElementById("img").src);
    },

    deletestudent(id) {
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
      }).then(result => {
        if (result.isConfirmed) {
          axios
            .post("api/deletestudent/" + id, {})

            .then(data => {
              if (data.status) {
                this.search();
              }
            });
          Swal.fire("Deleted Successfully !");
        }
      });
    },

    search(page = 1) {
      axios.get(`/api/search?page=${page}&search=${this.Sea}`).then(data => {
        this.result = data.data;
      });
    },

    getBook($id) {
      axios.get(`/api/getBook/${$id}`).then(data => {
        if (data.data.status == "success") {
          this.Books = data.data;
        }
      });
    },

    deleteBook(id) {
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
      }).then(result => {
        if (result.isConfirmed) {
          axios
            .post("api/deleteBook/" + id, {})

            .then(data => {
              if (data.data.status == "success") {
                $("#closeBook").click();
                this.getBook();
              }
            });
          Swal.fire("Deleted Successfully !");
        }
      });
    }
  },

  created() {
    let user_token = localStorage.getItem("accessToken");
    if (!user_token) {
      this.$router.push({ path: "/" });
    }
    this.search();
    this.getBook();
  }
};
</script>
