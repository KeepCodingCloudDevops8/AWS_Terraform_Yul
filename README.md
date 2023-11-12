# AWS_Terraform_Yul

## Descripción

La practica consiste en un despliegue de un servidor web **Nginx** en un cluster **ECS** de **AWS** mediante **Terraform**.

## Funcionamiento

### La practica esta compuesta por los siguientes recursos:

- **VPC**
- **Security Group - SG**
- **Load Balanceer - LB**
- **Elastic Container Service - ECS**

## Requisitos

> **Note:** Antes de comenzar, asegúrate de tener instalados los siguientes requisitos en tu sistema:

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Disponer de una cuenta de [AWS](https://repost.aws/es/knowledge-center/create-and-activate-aws-account)


## Estructuración 

Para evitar el conflicto de repetición de variables y presentar una mejor estructuración se ha estructurado en diferentes módulos para cada recurso y un directorio **root** donde están los archivos raíz para desplegar la practica.


![Árbol de directorios]( ./pics/Estructura_AWS_Terraform.png "Tree Files")

## Instrucciones de despliegue

Siga los pasos a continuación para comprobar el funcionamiento de la aplicación:

1. Clona este repositorio en tu sistema:
    - Por `SSH`:

       ```bash
       git clone git@github.com:KeepCodingCloudDevops8/AWS_Terraform_Yul.git

    - Por `HTTP`:

       ```bash
       git clone https://github.com/KeepCodingCloudDevops8/AWS_Terraform_Yul.git

    * Primer paso:


        Se puede editar el fichero `/root/terraform.tfvars` para asignarle un nombre a la practica.
        > **Default: AWS-Yul**


    * Segundo paso:


        Moverse al directorio **/root** y ejecutar:


        
        `terraform init`
        

        ```bash
        terraform plan
        ```

        ```bash
        terraform apply --auto-approve 
        ```
        > **Nota:** La practica tarda un intervalo de tiempo de 2 a 3 minutos. Una vez finalizado se mostrará el endpoint de salida generado por el LB. Lo copiamos y lo pegamos en un navegador. Si no se cargara al momento volver a recargar.


    * Tercero y ultimo paso:


        Destrucción de los recursos


        ```bash
        terraform destroy --auto-approve
        ```    