terraform {}

provider "mysql" {
  endpoint = "host.docker.internal:3306"
  username = "root"
  password = ""
  version  = "~> 1.6"
}

resource "mysql_database" "test_db" {
  name = "test_db"
}

resource "mysql_user" "test_user" {
  user               = "test_user"
  host               = "%"
  plaintext_password = "password"
  tls_option         = ""
}

resource "mysql_grant" "test_user_grant" {
  user       = "${mysql_user.test_user.user}"
  host       = "${mysql_user.test_user.host}"
  database   = "${mysql_database.test_db.name}"
  privileges = ["SELECT", "INSERT", "UPDATE", "DELETE", "CREATE", "DROP", "ALTER"]
  table      = ""
  tls_option = ""
}
