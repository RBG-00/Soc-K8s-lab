# SOC-K8s-Lab

> **A Kubernetes-Based Security Operations Center (SOC) Lab for Threat Detection, Infrastructure Monitoring, and Incident Response using Wazuh, TheHive, Prometheus, and Grafana.**

---

# Architecture

<p align="center">
  <img src="Soc-K8s-lab/docs/architecture.png" alt="SOC Architecture" width="900">
</p>

> Save the architecture diagram as `docs/architecture.png`.

---

# Overview

SOC-K8s-Lab is a complete Security Operations Center (SOC) laboratory built on Kubernetes. It demonstrates how multiple open-source security and monitoring platforms can work together to detect attacks, monitor infrastructure, and manage security incidents in real time.

The environment integrates:

- Wazuh SIEM
- TheHive Incident Response Platform
- Prometheus
- Grafana
- Alertmanager
- Apache Exporter
- Node Exporter
- MariaDB
- DVWA (Damn Vulnerable Web Application)
- Kubernetes
- Docker

---

# Architecture Components

### Security Monitoring

- Wazuh Manager
- Wazuh Indexer
- Wazuh Dashboard
- Wazuh Agents

### Incident Response

- TheHive

### Infrastructure Monitoring

- Prometheus
- Grafana
- Alertmanager

### Exporters

- Node Exporter
- Apache Exporter

### Target Infrastructure

- Ubuntu Server
- DVWA Web Server
- Windows Server (Active Directory)

---

# Project Structure

```
SOC-K8s-Lab
│
├── docker
│   ├── ubuntu-monitor
│   └── vulnerable-web
│
├── ingress
│
├── linux
│   ├── ubuntu
│   └── node-exporter
│
├── monitoring
│   ├── prometheus
│   ├── grafana
│   ├── alertmanager
│   └── kube-state-metrics
│
├── namespaces
│
├── wazuh-docker
│   ├── single-node
│   │   ├── config
│   │   ├── thehive-stack
│   │   ├── docker-compose.yml
│   │   ├── generate-indexer-certs.yml
│   │   └── README.md
│   │
│   └── wazuh-agent
│
└── web
    ├── deployment
    ├── service
    ├── apache-exporter
    ├── mariadb
    └── mariadb-pvc.yaml
```

---

# Features

- Kubernetes Deployment
- Containerized Infrastructure
- Wazuh SIEM Integration
- Incident Response using TheHive
- Infrastructure Monitoring
- Security Monitoring
- Metrics Collection
- Dashboard Visualization
- Alert Management
- SQL Injection Detection
- SSH Brute Force Detection
- Malware Detection
- File Integrity Monitoring
- Apache Monitoring
- Linux Monitoring

---

# Technologies

| Technology | Purpose |
|------------|---------|
| Kubernetes | Container Orchestration |
| Docker | Containerization |
| Wazuh | SIEM Platform |
| TheHive | Incident Response |
| Prometheus | Metrics Collection |
| Grafana | Dashboards |
| Alertmanager | Alerting |
| Apache Exporter | Apache Metrics |
| Node Exporter | Linux Metrics |
| MariaDB | Database |
| NGINX Ingress | Traffic Routing |

---

# Prerequisites

Install the following software before deploying the project.

- Docker Desktop
- Minikube
- kubectl
- Git

Verify installation

```bash
docker --version
minikube version
kubectl version --client
git --version
```

---

# Deployment Guide

## 1. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/SOC-K8s-Lab.git

cd SOC-K8s-Lab
```

---

## 2. Start Minikube

```bash
minikube start
```

Verify

```bash
kubectl get nodes
```

---

## 3. Build Docker Images

```bash
docker build -t ubuntu-monitor:latest ./docker/ubuntu-monitor

docker build -t vulnerable-web:latest ./docker/vulnerable-web
```

---

## 4. Load Images into Minikube

```bash
minikube image load ubuntu-monitor:latest

minikube image load vulnerable-web:latest
```

---

## 5. Create Kubernetes Namespaces

```bash
kubectl apply -f namespaces/
```

---

## 6. Deploy Monitoring Components

```bash
kubectl apply -f monitoring/
```

---

## 7. Deploy Linux Components

```bash
kubectl apply -f linux/
```

---

## 8. Deploy Web Application

```bash
kubectl apply -f web/
```

---

## 9. Configure Ingress

Enable Ingress

```bash
minikube addons enable ingress
```

Deploy

```bash
kubectl apply -f ingress/
```

---

## 10. Deploy Wazuh

Navigate to

```bash
cd wazuh-docker/single-node
```

Start Wazuh

```bash
docker compose up -d
```

---

## 11. Deploy TheHive

Navigate to

```bash
cd thehive-stack
```

Start TheHive

```bash
docker compose up -d
```

---

## 12. Verify Deployment

Pods

```bash
kubectl get pods -A
```

Services

```bash
kubectl get svc -A
```

Ingress

```bash
kubectl get ingress -A
```

---

## 13. Start Minikube Tunnel

```bash
minikube tunnel
```

---

# Attack Scenarios

The lab supports multiple attack simulations including:

- SQL Injection
- SSH Brute Force
- Reverse Shell
- Malware Execution
- Privilege Escalation
- File Integrity Violations
- Web Server Monitoring
- Linux Host Monitoring

---

# Monitoring Workflow

Infrastructure

↓

Exporters

↓

Prometheus

↓

Grafana

---

Servers

↓

Wazuh Agents

↓

Wazuh Manager

↓

Wazuh Indexer

↓

Wazuh Dashboard

↓

TheHive

---

# Dashboards

The project includes dashboards for:

- Wazuh Security Dashboard
- Grafana Infrastructure Dashboard
- Prometheus Metrics
- Alertmanager Alerts
- TheHive Incident Management

---

# Screenshots

## System Architecture

Place the architecture image here.

```
docs/architecture.png
```

You can also add screenshots of:

- Wazuh Dashboard
- Grafana Dashboard
- TheHive Cases
- Prometheus
- Attack Detection

---

# Future Improvements

- Kubernetes-native deployment for Wazuh
- Kubernetes-native deployment for TheHive
- Slack Notifications
- Email Notifications
- Active Response Automation
- CI/CD Pipeline
- MITRE ATT&CK Mapping
- Falco Integration

---

# Authors

Graduation Capstone Project

Faculty of Information Technology

Cybersecurity Department

---

# License

This project is intended for educational and research purposes only.
