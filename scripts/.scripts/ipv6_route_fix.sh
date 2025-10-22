#!/bin/bash
# Discover default IPv6 gateway from RA and apply it manually

IFACE="wlp3s0"

# Wait until RA installs a default route
TIMEOUT=120
INTERVAL=2
ELAPSED=0
logger -p user.warn "Waiting for IPv6 default route on $IFACE..."
while [ $ELAPSED -lt $TIMEOUT ]; do
    ROUTER=$(ip -6 route show dev "$IFACE" | awk '/^default via/ {print $3; exit}')
    if [ -n "$ROUTER" ]; then
        logger -p user.warn "Found router: $ROUTER"
        break
    fi
    sleep $INTERVAL
    ELAPSED=$((ELAPSED + INTERVAL))
done

if [ -z "$ROUTER" ]; then
    logger -p user.warn "No IPv6 default router found on $IFACE after ${TIMEOUT}s, exiting."
    exit 1
fi

# Apply/replace the route manually
# ip -6 route replace default via "$ROUTER" dev "$IFACE"
ip -6 route del default dev "$IFACE" 2>/dev/null
ip -6 route add default via "$ROUTER" dev "$IFACE"
logger -p user.warn "Default route replaced on $IFACE"

