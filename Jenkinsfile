pipeline {
	agent any
	
	environment {
		IMAGE_NAME = 'MSI'
		CONTAINER_NAME = 'msi-container'
	}
	
	stages{
		stage('Préparation'){
			steps{
				echo 'Clonage du projet'
			}
		}
		
		stage('Construire Docker'){
			steps{
				script{
					echo 'Construire l`\'image Docker'
					bat "docker build -t ${IMAGE_NAME}."
				}
			}
		}
		
		stage('Déploiement Local'){
			steps{
				script{
					echo 'Lancer l\'image Docker'
					bat "docker rm -f ${CONTAINER_NAME} || exit 0"
					bat "docker run -d -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
				}
			}
		}
		
		stage('Test HTTP'){
			steps{
				script{
					echo 'Execution de l\'application dans la phase de test'
					sleep 5 
					bat "curl http://localhost:3000"
				}
			}
		}
		
		stage('Nettoyage'){
			steps{
				script{
					echo 'Arret du conteneur après Test'
					bat docker rm -f ${CONTAINER_NAME}
				}
			}
		}
	}
}
