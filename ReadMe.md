## Prerequisites
- Install Atmos
    ```bash
    brew install cloudposse/tap/atmos
    # or
    go install github.com/cloudposse/atmos@latest
    ```

## Deployment Steps

### 1. Validate the Stack
```bash
atmos describe stacks --stack mlops-prod-networking
```

### 2. Plan Components
```bash
atmos terraform plan action-group --stack mlops-prod-networking
atmos terraform plan ddos-metric-alert --stack mlops-prod-networking
atmos terraform plan resource-health-alert --stack mlops-prod-networking
```

### 3. Apply Changes
Apply in dependency order:
```bash
atmos terraform apply action-group --stack mlops-prod-networking
atmos terraform apply ddos-metric-alert --stack mlops-prod-networking
atmos terraform apply resource-health-alert --stack mlops-prod-networking
```

Or apply all components at once:
```bash
atmos terraform apply "" --stack mlops-prod-networking --all
```