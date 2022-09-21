bool authenticator (dynamic email, dynamic password){
    bool check = false;
    if (email == "teste@teste.com" && password == "senha123") {
      check = true;
    }
    return check;
}