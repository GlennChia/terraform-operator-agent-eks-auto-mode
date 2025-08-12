resource "time_sleep" "first_wait_30_seconds" {
  create_duration = "30s"
}

resource "time_sleep" "second_wait_30_seconds" {
  depends_on = [time_sleep.first_wait_30_seconds]

  create_duration = "30s"
}