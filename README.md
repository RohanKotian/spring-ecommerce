# 🛍️ Spring E-Commerce Microservices Backend
![Java](https://img.shields.io/badge/Java-17-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.12-brightgreen)
![Apache Kafka](https://img.shields.io/badge/Apache%20Kafka-Event--Driven-black)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Microservices](https://img.shields.io/badge/Architecture-Microservices-lightgrey)
![API Gateway](https://img.shields.io/badge/API%20Gateway-Spring%20Cloud-blueviolet)

A scalable e-commerce backend built using **Spring Boot microservices**, **Apache Kafka**, **Netflix Eureka**, **API Gateway**, and **Docker**.  
Each service is independently deployable and responsible for a specific business domain, following modern distributed system design principles.

---

## 🚀 Features

- Microservices-based architecture with clear service boundaries
- Service discovery using **Netflix Eureka**
- Centralized routing via **API Gateway**
- Asynchronous, event-driven communication with **Apache Kafka**
- Dockerized services for consistent local development
- Modular design for scalability and maintainability

---

## 🧩 Services Overview

| Service | Description |
|-------|-------------|
| **Service Registry** | Eureka server for service discovery |
| **API Gateway** | Single entry point for routing client requests |
| **Product Service** | Manages product catalog and inventory |
| **Order Service** | Handles order creation and processing |
| **Payment Service** | Manages payment workflows |
| **Identity Service** | Handles user authentication and identity |
| **Email Service** | Sends order and notification emails |

---

## 🧠 Architecture

- **Synchronous communication:** REST APIs between services
- **Asynchronous communication:** Kafka events for order and notification flows
- **Service discovery:** Dynamic service registration via Eureka
- **Gateway pattern:** API Gateway routes requests to downstream services

This architecture improves:
- Scalability
- Fault isolation
- Independent service deployment

---

## 🛠️ Tech Stack

- **Java 17**
- **Spring Boot**
- **Spring Cloud Gateway**
- **Netflix Eureka**
- **Apache Kafka**
- **Docker & Docker Compose**
- **MySQL**
- **Microservices Architecture**

---

## 📦 Prerequisites

Make sure you have the following installed:

- Java 17+
- Docker & Docker Compose
- Git

---

## ▶️ Running the Project Locally

### 1️⃣ Clone the repository
```bash
git clone https://github.com/RohanKotian/spring-ecommerce
cd spring-ecommerce
```
### 2️⃣ Start all services
```bash
docker compose up --build
```
## 🌐 Access Points
| Component |	URL |
|--------|--------|
| API Gateway |	http://localhost:8080 |
| Eureka Dashboard	| http://localhost:8761 |

## 📁 Project Structure
```text
spring-ecommerce
├── api-gateway
├── service-registry
├── product-service
├── order-service
├── payment-service
├── identity-service
├── email-service
├── docker-compose.yml
└── README.md
```

## 🎯 Learning Outcomes

- Designing and implementing microservices with Spring Boot
- Event-driven architecture using Apache Kafka
- Service discovery and centralized routing with Eureka and API Gateway
- Containerized microservices using Docker
- Building cloud-ready backend systems


## 🤝 Contributing
Contributions, suggestions, and improvements are welcome.
Feel free to fork the repository and open a pull request.
