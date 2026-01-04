#!/bin/bash
# Prototype Signing Ceremony Script
# Usage: ./sign-artifact.sh <image-tag>

IMAGE=$1
KEY="cosign.key"

echo "Signing artifact: $IMAGE"
cosign sign --key $KEY $IMAGE

echo "Generating SBOM..."
syft $IMAGE -o spdx-json > sbom.spdx.json

echo "Signing SBOM..."
cosign sign-blob --key $KEY --bundle sbom.bundle.json sbom.spdx.json
