output "app_url" {
  value = "http://${aws_instance.ml_api.public_ip}:8000"
}

output "public_ip" {
  value = aws_instance.ml_api.public_ip
}