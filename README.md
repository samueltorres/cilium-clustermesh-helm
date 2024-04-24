# cilium-clustermesh-helm

This is a project where we can connect multiple kubernetes clusters through cilium clustermesh using the cilium helm chart.

## Requirements

- Kind
- Helm
- OpenSSL
- cilium-cli

## Setup

### 1. Generate clustermesh certificates

```bash
make generate-certificates
```

### 2. Create Kind clusters

```bash
make create-clusters
```

### 3. Install Cilium

```bash
make install-cilium
```

### 4. Install Metallb for Cilium Clustermesh APIServer Loadbalancer

```bash
make install-metallb
```

## Testing


### 1. Install test bed services on both clusters

```bash
make install-test-bed
```

### 2. Run some curls against a global service

```bash
make test-clustermesh
```

## Troubleshooting

TBD