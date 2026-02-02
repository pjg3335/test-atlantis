# .hcl에서 .tf를 불러오는 include문
terraform {
  source = "." # 모듈은 경로로 가져온다.
}

# 불러온 .tf를 호출 할 때 쓸 input
inputs = {
  content_text = "이것은 테라그룬트가 주입한 텍스트입니다(수정됨2)"
}