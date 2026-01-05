warning: in the working copy of 'api-gateway/pom.xml', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'api-gateway/src/main/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplication.java', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'api-gateway/src/test/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplicationTests.java', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'order-service/pom.xml', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'payment-service/pom.xml', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'product-service/pom.xml', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'service-registry/pom.xml', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'service-registry/src/main/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplication.java', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'service-registry/src/test/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplicationTests.java', LF will be replaced by CRLF the next time Git touches it
[1mdiff --git a/api-gateway/pom.xml b/api-gateway/pom.xml[m
[1mindex 5c131cd..25642a4 100644[m
[1m--- a/api-gateway/pom.xml[m
[1m+++ b/api-gateway/pom.xml[m
[36m@@ -28,10 +28,9 @@[m
 	</scm>[m
 	<properties>[m
 		<java.version>17</java.version>[m
[31m-		<spring-cloud.version>2024.0.3</spring-cloud.version>[m
[32m+[m[32m        <spring-cloud.version>2024.0.3</spring-cloud.version>[m
 	</properties>[m
     <dependencies>[m
[31m-        <!-- Reactive Gateway -->[m
         <dependency>[m
             <groupId>org.springframework.boot</groupId>[m
             <artifactId>spring-boot-starter-webflux</artifactId>[m
[36m@@ -42,13 +41,11 @@[m
             <artifactId>spring-cloud-starter-gateway</artifactId>[m
         </dependency>[m
 [m
[31m-        <!-- Eureka Client -->[m
         <dependency>[m
             <groupId>org.springframework.cloud</groupId>[m
             <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>[m
         </dependency>[m
 [m
[31m-        <!-- Tests -->[m
         <dependency>[m
             <groupId>org.springframework.boot</groupId>[m
             <artifactId>spring-boot-starter-test</artifactId>[m
[36m@@ -65,8 +62,8 @@[m
 			<dependency>[m
 				<groupId>org.springframework.cloud</groupId>[m
 				<artifactId>spring-cloud-dependencies</artifactId>[m
[31m-				<version>${spring-cloud.version}</version>[m
[31m-				<type>pom</type>[m
[32m+[m[32m                <version>${spring-cloud.version}</version>[m
[32m+[m[32m                <type>pom</type>[m
 				<scope>import</scope>[m
 			</dependency>[m
 		</dependencies>[m
[1mdiff --git a/api-gateway/src/main/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplication.java b/api-gateway/src/main/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplication.java[m
[1mindex 300d261..cbcbbd0 100644[m
[1m--- a/api-gateway/src/main/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplication.java[m
[1m+++ b/api-gateway/src/main/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplication.java[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.ecommerce.api_gateway;[m
[32m+[m[32mpackage com.rohan.ecommerce.api_gateway;[m
 [m
 import org.springframework.boot.SpringApplication;[m
 import org.springframework.boot.autoconfigure.SpringBootApplication;[m
[1mdiff --git a/api-gateway/src/test/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplicationTests.java b/api-gateway/src/test/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplicationTests.java[m
[1mindex bf1e696..ca0d86e 100644[m
[1m--- a/api-gateway/src/test/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplicationTests.java[m
[1m+++ b/api-gateway/src/test/java/com/rohan/ecommerce/api_gateway/ApiGatewayApplicationTests.java[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.ecommerce.api_gateway;[m
[32m+[m[32mpackage com.rohan.ecommerce.api_gateway;[m
 [m
 import org.junit.jupiter.api.Test;[m
 import org.springframework.boot.test.context.SpringBootTest;[m
[1mdiff --git a/order-service/pom.xml b/order-service/pom.xml[m
[1mindex f375d15..3ffd9c6 100644[m
[1m--- a/order-service/pom.xml[m
[1m+++ b/order-service/pom.xml[m
[36m@@ -74,8 +74,8 @@[m
 			<dependency>[m
 				<groupId>org.springframework.cloud</groupId>[m
 				<artifactId>spring-cloud-dependencies</artifactId>[m
[31m-				<version>${spring-cloud.version}</version>[m
[31m-				<type>pom</type>[m
[32m+[m[32m                <version>${spring-cloud.version}</version>[m
[32m+[m[32m                <type>pom</type>[m
 				<scope>import</scope>[m
 			</dependency>[m
 		</dependencies>[m
[1mdiff --git a/order-service/src/main/java/com/rohan/ecommerce/order_service/controller/OrderController.java b/order-service/src/main/java/com/rohan/ecommerce/order_service/controller/OrderController.java[m
[1mindex b441694..d956eb2 100644[m
[1m--- a/order-service/src/main/java/com/rohan/ecommerce/order_service/controller/OrderController.java[m
[1m+++ b/order-service/src/main/java/com/rohan/ecommerce/order_service/controller/OrderController.java[m
[36m@@ -20,7 +20,7 @@[m [mpublic class OrderController {[m
     @PostMapping[m
     public Order save(@RequestBody Order order) {[m
         Order saved = repository.save(order);[m
[31m-        producer.sendOrder(saved);[m
[32m+[m[32m//        producer.sendOrder(saved);[m
         return saved;[m
     }[m
 }[m
[1mdiff --git a/order-service/src/main/java/com/rohan/ecommerce/order_service/entity/Order.java b/order-service/src/main/java/com/rohan/ecommerce/order_service/entity/Order.java[m
[1mindex c1421c4..9d81303 100644[m
[1m--- a/order-service/src/main/java/com/rohan/ecommerce/order_service/entity/Order.java[m
[1m+++ b/order-service/src/main/java/com/rohan/ecommerce/order_service/entity/Order.java[m
[36m@@ -1,17 +1,14 @@[m
 package com.rohan.ecommerce.order_service.entity;[m
 [m
[31m-import jakarta.persistence.Entity;[m
[31m-import jakarta.persistence.GeneratedValue;[m
[31m-import jakarta.persistence.GenerationType;[m
[31m-import jakarta.persistence.Id;[m
[31m-import lombok.AllArgsConstructor;[m
[31m-import lombok.Data;[m
[31m-import lombok.NoArgsConstructor;[m
[32m+[m[32mimport jakarta.persistence.*;[m
[32m+[m[32mimport lombok.*;[m
 [m
 @Entity[m
[31m-@Data[m
[32m+[m[32m@Getter[m
[32m+[m[32m@Setter[m
 @NoArgsConstructor[m
 @AllArgsConstructor[m
[32m+[m[32m@Table(name="orders")[m
 public class Order {[m
 [m
     @Id[m
[36m@@ -20,4 +17,4 @@[m [mpublic class Order {[m
     private String productName;[m
     private int quantity;[m
     private double price;[m
[31m-}[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/payment-service/pom.xml b/payment-service/pom.xml[m
[1mindex 9fb23e6..a4d9063 100644[m
[1m--- a/payment-service/pom.xml[m
[1m+++ b/payment-service/pom.xml[m
[36m@@ -50,6 +50,13 @@[m
             <artifactId>lombok</artifactId>[m
             <optional>true</optional>[m
         </dependency>[m
[32m+[m
[32m+[m[32m        <dependency>[m
[32m+[m[32m            <groupId>org.springframework.boot</groupId>[m
[32m+[m[32m            <artifactId>spring-boot-starter-test</artifactId>[m
[32m+[m[32m            <scope>test</scope>[m
[32m+[m[32m        </dependency>[m
[32m+[m
     </dependencies>[m
 [m
 [m
[1mdiff --git a/product-service/pom.xml b/product-service/pom.xml[m
[1mindex bc5c5e8..928392f 100644[m
[1m--- a/product-service/pom.xml[m
[1m+++ b/product-service/pom.xml[m
[36m@@ -20,44 +20,37 @@[m
 [m
     <properties>[m
         <java.version>17</java.version>[m
[31m-        <!-- ✅ Compatible with Spring Boot 3.4.x -->[m
         <spring-cloud.version>2024.0.3</spring-cloud.version>[m
     </properties>[m
 [m
     <dependencies>[m
[31m-        <!-- Web -->[m
         <dependency>[m
             <groupId>org.springframework.boot</groupId>[m
             <artifactId>spring-boot-starter-web</artifactId>[m
         </dependency>[m
 [m
[31m-        <!-- JPA -->[m
         <dependency>[m
             <groupId>org.springframework.boot</groupId>[m
             <artifactId>spring-boot-starter-data-jpa</artifactId>[m
         </dependency>[m
 [m
[31m-        <!-- Eureka Client -->[m
         <dependency>[m
             <groupId>org.springframework.cloud</groupId>[m
             <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>[m
         </dependency>[m
 [m
[31m-        <!-- MySQL -->[m
         <dependency>[m
             <groupId>com.mysql</groupId>[m
             <artifactId>mysql-connector-j</artifactId>[m
             <scope>runtime</scope>[m
         </dependency>[m
 [m
[31m-        <!-- Lombok -->[m
         <dependency>[m
             <groupId>org.projectlombok</groupId>[m
             <artifactId>lombok</artifactId>[m
             <optional>true</optional>[m
         </dependency>[m
 [m
[31m-        <!-- Tests -->[m
         <dependency>[m
             <groupId>org.springframework.boot</groupId>[m
             <artifactId>spring-boot-starter-test</artifactId>[m
[36m@@ -79,7 +72,6 @@[m
 [m
     <build>[m
         <plugins>[m
[31m-            <!-- Lombok annotation processing -->[m
             <plugin>[m
                 <groupId>org.apache.maven.plugins</groupId>[m
                 <artifactId>maven-compiler-plugin</artifactId>[m
[36m@@ -93,7 +85,6 @@[m
                 </configuration>[m
             </plugin>[m
 [m
[31m-            <!-- Spring Boot plugin -->[m
             <plugin>[m
                 <groupId>org.springframework.boot</groupId>[m
                 <artifactId>spring-boot-maven-plugin</artifactId>[m
[1mdiff --git a/product-service/src/main/java/com/rohan/ecommerce/product_service/entity/Product.java b/product-service/src/main/java/com/rohan/ecommerce/product_service/entity/Product.java[m
[1mindex 746d179..f2e37be 100644[m
[1m--- a/product-service/src/main/java/com/rohan/ecommerce/product_service/entity/Product.java[m
[1m+++ b/product-service/src/main/java/com/rohan/ecommerce/product_service/entity/Product.java[m
[36m@@ -2,6 +2,7 @@[m [mpackage com.rohan.ecommerce.product_service.entity;[m
 [m
 import jakarta.persistence.Entity;[m
 import jakarta.persistence.GeneratedValue;[m
[32m+[m[32mimport jakarta.persistence.GenerationType;[m
 import jakarta.persistence.Id;[m
 import lombok.AllArgsConstructor;[m
 import lombok.Data;[m
[36m@@ -14,7 +15,7 @@[m [mimport lombok.NoArgsConstructor;[m
 public class Product {[m
 [m
     @Id[m
[31m-    @GeneratedValue[m
[32m+[m[32m    @GeneratedValue(strategy = GenerationType.IDENTITY)[m
     private Long id;[m
     private String name;[m
     private double price;[m
[1mdiff --git a/service-registry/pom.xml b/service-registry/pom.xml[m
[1mindex 9c6372c..2acd8ce 100644[m
[1m--- a/service-registry/pom.xml[m
[1m+++ b/service-registry/pom.xml[m
[36m@@ -6,7 +6,7 @@[m
 		<groupId>org.springframework.boot</groupId>[m
 		<artifactId>spring-boot-starter-parent</artifactId>[m
 		<version>3.4.12</version>[m
[31m-		<relativePath/> <!-- lookup parent from repository -->[m
[32m+[m		[32m<relativePath/>[m
 	</parent>[m
 	<groupId>com.ecommerce</groupId>[m
 	<artifactId>service-registry</artifactId>[m
[36m@@ -28,7 +28,7 @@[m
 	</scm>[m
 	<properties>[m
 		<java.version>17</java.version>[m
[31m-		<spring-cloud.version>2024.0.3</spring-cloud.version>[m
[32m+[m[32m        <spring-cloud.version>2024.0.3</spring-cloud.version>[m
 	</properties>[m
 	<dependencies>[m
 		<dependency>[m
[36m@@ -51,8 +51,8 @@[m
 			<dependency>[m
 				<groupId>org.springframework.cloud</groupId>[m
 				<artifactId>spring-cloud-dependencies</artifactId>[m
[31m-				<version>${spring-cloud.version}</version>[m
[31m-				<type>pom</type>[m
[32m+[m[32m                <version>${spring-cloud.version}</version>[m
[32m+[m[32m                <type>pom</type>[m
 				<scope>import</scope>[m
 			</dependency>[m
 		</dependencies>[m
[1mdiff --git a/service-registry/src/main/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplication.java b/service-registry/src/main/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplication.java[m
[1mindex 1564844..88c6d1f 100644[m
[1m--- a/service-registry/src/main/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplication.java[m
[1m+++ b/service-registry/src/main/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplication.java[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.ecommerce.service_registry;[m
[32m+[m[32mpackage com.rohan.ecommerce.service_registry;[m
 [m
 import org.springframework.boot.SpringApplication;[m
 import org.springframework.boot.autoconfigure.SpringBootApplication;[m
[1mdiff --git a/service-registry/src/test/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplicationTests.java b/service-registry/src/test/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplicationTests.java[m
[1mindex 9a681ab..5f78aab 100644[m
[1m--- a/service-registry/src/test/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplicationTests.java[m
[1m+++ b/service-registry/src/test/java/com/rohan/ecommerce/service_registry/ServiceRegistryApplicationTests.java[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.ecommerce.service_registry;[m
[32m+[m[32mpackage com.rohan.ecommerce.service_registry;[m
 [m
 import org.junit.jupiter.api.Test;[m
 import org.springframework.boot.test.context.SpringBootTest;[m
