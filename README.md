# SentinelOps: Automated Multi-Cloud Observability Platform

SentinelOps is a production-focused observability platform designed to run in both local and cloud environments.

It provides a consistent way to deploy and manage monitoring tools, whether you're running a local test setup or connecting to a live Kubernetes cluster in production.

---

## 🚀 What This Project Does

* Provisions infrastructure using Terraform (AWS / reusable design for other providers)
* Configures systems using Ansible
* Deploys a full observability stack (metrics, logs, alerting)
* Runs on Kubernetes (K3s) for lightweight orchestration
* Supports both standalone monitoring and external cluster monitoring

---

## 🧱 Tech Stack

| Category       | Tools               |
| -------------- | ------------------- |
| Cloud          | AWS, Azure          |
| Infrastructure | Terraform           |
| Configuration  | Ansible             |
| Containers     | Docker              |
| Orchestration  | Kubernetes, (K3s)    |
| Monitoring     | Prometheus, Grafana |
| Logging        | Loki, Promtail      |
| Alerting       | Alertmanager        |
| CI/CD          | GitHub Actions      |

---

## ⚡ Quick Start

```bash
git clone https://github.com/your-username/sentinelops.git
cd sentinelops

terraform init
terraform apply

ansible-playbook -i monitoring-stack/inventory/hosts playbook.yml
```

---

## 🏗 How It Works

1. Terraform provisions infrastructure (or prepares reusable environment)
2. Ansible configures the system and installs required components
3. K3s provides a lightweight Kubernetes environment
4. Monitoring services are deployed as containers
5. Prometheus collects metrics (local or external targets)
6. Loki aggregates logs
7. Grafana visualizes system and application data
8. Alertmanager manages alerts and notifications

---

## 🌍 Deployment Modes

SentinelOps supports two main usage scenarios:

### 1. Local Monitoring (Standalone Mode)

Run the full stack locally (WSL2 or VM).

Use cases:

* Testing and validation
* Learning environment
* Simulating production setups

---

### 2. Remote Monitoring (Production Mode)

Use SentinelOps to monitor an existing Kubernetes cluster (AWS, Azure, or any provider).

In this mode:

* Prometheus scrapes metrics from external clusters
* Loki collects logs from running workloads
* Grafana provides centralized dashboards
* Alertmanager handles real alerts

---

### 🔁 Switching Between Modes

No changes to core logic are required.

You only need to:

* Update `inventory/hosts` (target servers or clusters)
* Adjust variables (IPs, endpoints, credentials)
* Configure access to the Kubernetes cluster

---

## 📁 Project Structure

```
sentinelops/
│
├── terraform/                # Infrastructure provisioning
├── monitoring-stack/
│   ├── inventory/            # Environment targets
│   └── roles/
│       ├── common/           # Base system setup
│       ├── docker/           # Container runtime
│       ├── k3s/              # Kubernetes setup
│       └── monitoring/       # Observability stack
│
├── .github/workflows/        # CI/CD pipelines
```

---

## 🔒 Security Notes

* Uses OIDC for authentication with GitHub Actions (no static credentials)
* Restricts access to dashboards using network rules
* Remote Terraform state with locking to prevent conflicts

---

## 👨‍💻 About

Built and maintained by Nehad, focused on designing practical DevOps systems and reliable infrastructure automation.

* [LinkedIn](https://linkedin.com/in/nehad-shamali-b677ba24b/?locale=en-US)
* [GitHub](https://github.com/nehadjsh)

---

> One setup. Multiple environments. Same experience.
