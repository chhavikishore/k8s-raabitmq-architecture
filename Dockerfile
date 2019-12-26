FROM hashicorp/terraform:light


# WORKDIR /app

COPY . .


# ENV TF_VAR_url


RUN terraform init

VOLUME [ "/data/tfstate" ]

ENTRYPOINT [ "terraform", "apply", "-auto-approve", "-state=/data/tfstate/terraform.tfstate" ]