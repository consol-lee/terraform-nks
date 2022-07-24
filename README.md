# Navercloud Kubernetes Service with Terraform

- 프로바이더 : 테라폼과 외부 서비스를 연결해주는 기능을 하는 모듈
- 리소스 : 특정 프로바이더가 제공해주는 조작 가능한 대상의 최소 단위
  - NCP의 경우 LB, LB Listener, LB TargetGroup, NKS Cluster, NKS NodePool …
- 데이터소스 : 프로바이더에서 가져오는 정보 
- 상태파일 : .tfstate 파일. 구성된 리소스들의 정보

## ncloud(terraform)를 통해 리소스 생성

## kubernetes(terraform)을 통해 어플리케이션 생성