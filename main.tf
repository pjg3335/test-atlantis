# 모듈(≈함수)의 input
variable "content_text" {
  type = string
}

# 모듈(≈함수) 본체
resource "local_file" "example" {
  content  = var.content_text
  filename = "${path.module}/result.txt"
}