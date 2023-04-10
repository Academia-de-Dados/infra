# ---------------------------- Kubernetes ----------------------------
K8S_CLUSTER_NAME := academia-de-dados
K8S_NAMESPACE := academia-de-dados

.PHONY: k8s-cluster
k8s-cluster:  ## Cria um cluster Kubernetes local usando 'nós' do contêiner Docker
	@ kind create cluster --config=manifests/cluster.yml --name=$(K8S_CLUSTER_NAME)

.PHONY: k8s-create
k8s-create:  ## Cria os recursos dos manifestos kubernetes.
	@ kubectl create --kustomize=manifests

.PHONY: k8s-sh-backend
k8s-sh-backend:
	@ kubectl --namespace $(K8S_NAMESPACE) exec -it deployments/app-backend -- bash

.PHONY: k8s-sh-pgsql
k8s-sh-pgsql:
	@ kubectl --namespace $(K8S_NAMESPACE) exec -it deployments/pgsql-backend -- bash


# ---------------------------- Terraform ----------------------------
TF_DIR := terraform
TF_VAR_FILE := dev.tfvars
TF_PLAN := tfplan.out
TF := terraform -chdir=$(TF_DIR)

.PHONY: tf
tf: tf-init tf-plan tf-apply  ## Cria os recursos via Terraform

.PHONY: tf-init
tf-init:  ## Inicialize um diretório de trabalho Terraform novo ou existente criando arquivos iniciais, carregando qualquer estado remoto, baixando módulos, etc.
	@ $(TF) init -upgrade

.PHONY: tf-plan
tf-plan:  ##  Gera um plano de execução especulativo, mostrando quais ações o Terraform levaria para aplicar a configuração atual.
	@ $(TF) plan -out=$(TF_PLAN) -var-file=$(TF_VAR_FILE)

.PHONY: tf-apply
tf-apply:  ## Cria ou atualiza a infraestrutura de acordo com as configurações do Terraform
	@ $(TF) apply -auto-approve $(TF_PLAN)

.PHONY: tf-destroy
tf-destroy:  ## Destroi a infraestrutura gerenciada pelo Terraform
	@ $(TF) destroy -auto-approve -var-file=$(TF_VAR_FILE)


# ---------------------------- Utils ----------------------------
.PHONY: help
help:  ## Exibe a ajuda dos comandos
	@ python -c \
		'import fileinput, re; \
		off, white, darkcyan = "\033[0m", "\033[1;37m", "\033[36m"; \
		lines = (re.search("([a-zA-Z_-]+):.*?## (.*)$$", line) for line in fileinput.input()); \
        methods = filter(None, lines); \
        template = "  "+darkcyan+"  {:10}"+off+" {}"; \
        formated_methods = sorted(template.format(*method.groups()) for method in methods); \
        print(f"\n  usage: make {darkcyan}<command> [s=service]\n"); \
        print(f"{white}COMMANDS:"); \
        print("\n".join(formated_methods))\
        ' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
