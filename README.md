# Secure IoT Edge Gateway (Prototype)

This repository contains the infrastructure configuration, security scripts, and source code for the Agramkow Secure Remote Access prototype.

## 🛡️ Security Features

- **Infrastructure as Code:** Azure IoT Edge deployment manifests with restricted port bindings.
- **Network Hardening:** Automated `iptables` scripts to enforce "Outbound-Only" architecture on the host level.
- **Supply Chain Security:** Scripts for cryptographic signing (Cosign) and SBOM generation (Syft).

## 📂 Repository Structure

- `/edge-deployment`: Configuration for the Azure IoT Edge runtime.
- `/security`: Bash scripts used for hardening the Ubuntu VM and performing the signing ceremony.
- `/src`: Source code for the `SimulatedTemperatureSensor` module.

## 🚀 Usage

**1. Network Hardening**
Run the hardening script on the Edge Gateway to close external ports:

```bash
sudo ./security/firewall-hardening.sh
```

## 🔐 Verification

To run the verification command successfully, you must authenticate with the **Read-Only Credentials** provided in **Appendix A** of the project report.

1. **Login:**

   ```bash
   docker login acrladsecure.azurecr.io -u <UUID_FROM_REPORT> -p <PASSWORD_FROM_REPORT>

   ```

2. Verify Image:

   ```bash
   cosign verify --key cosign.pub acrladsecure.azurecr.io/simulatedtemperaturesensor:latest
   ```
