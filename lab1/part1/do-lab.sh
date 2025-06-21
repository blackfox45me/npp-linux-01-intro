#!/usr/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
#!/usr/bin/bash

# COMPLETE LAB 1 SOLUTION - Network Bridge Configuration
# This script configures a Linux bridge inside the 'switch' container
# to enable Layer 2 communication between all four hosts.

echo "--- Running Lab Solution: Configuring Network Bridge ---"

# 1. Create the bridge interface named 'mybridge' inside the switch container
echo "[1/6] Creating bridge interface 'mybridge'..."
docker exec clab-lab1-part1-switch ip link add name mybridge type bridge

# 2. Bring the 'mybridge' interface up
echo "[2/6] Activating bridge interface..."
docker exec clab-lab1-part1-switch ip link set mybridge up

# 3. Attach host1's interface (eth1) to the bridge
echo "[3/6] Connecting host1 (eth1) to the bridge..."
docker exec clab-lab1-part1-switch ip link set eth1 master mybridge

# 4. Attach host2's interface (eth2) to the bridge
echo "[4/6] Connecting host2 (eth2) to the bridge..."
docker exec clab-lab1-part1-switch ip link set eth2 master mybridge

# 5. Attach host3's interface (eth3) to the bridge
echo "[5/6] Connecting host3 (eth3) to the bridge..."
docker exec clab-lab1-part1-switch ip link set eth3 master mybridge

# 6. Attach host4's interface (eth4) to the bridge
echo "[6/6] Connecting host4 (eth4) to the bridge..."
docker exec clab-lab1-part1-switch ip link set eth4 master mybridge

echo "--- Verification ---"
echo "Bridge status:"
docker exec clab-lab1-part1-switch ip link show mybridge
echo ""
echo "Bridge connections:"
docker exec clab-lab1-part1-switch bridge link show

echo "--- Lab Solution Complete ---"
# This file will get called from capture_submission.sh

