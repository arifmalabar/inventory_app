class Session {
  String sessnama = "";
  String sessemail = "";
  String sesspassword = "";

  set setNama(String nama) {
    this.sessnama = nama;
  }

  set setEmail(String email) {
    this.sessemail = email;
  }

  set setPassword(String password) {
    this.sesspassword = password;
  }

  String getNama() {
    return this.sessnama;
  }

  String getEmail() {
    return this.sessemail;
  }

  String getPassword() {
    return this.sesspassword;
  }
}
