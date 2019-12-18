##################################################本地创建docker镜像#############################################
cd C:\Users\XinBinCui\CUIXINBIN\GitHub\sample-web_spring-boot
#根据dockerfile创建镜像
docker build -t esmtjavademo:v1 .
#启动镜像
docker create esmtjavademo:v1


##################################################在K8S上启动POD#############################################
#登陆IBM Cloud
ibmcloud login –sso
#创建镜像并发送到cloud命名空间
ibmcloud cr build -t us.icr.io/esmt/esmtjavademo:1 .
#将镜像部署到k8s集群
kubectl create deployment esmt-java-demo-deployment --image=us.icr.io/esmt/esmtjavademo:1
#启动集群中的镜像
kubectl expose deployment/esmt-java-demo-deployment --type=NodePort --port=8099 --name=esmtdemo-service --target-port=8099
#查看已启动的服务信息
kubectl describe service esmtdemo-service