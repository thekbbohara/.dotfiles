#!/bin/bash
clock=echo "$(date +%I:%M) $(date +%p)"
echo -e "{\"text\":\"$(date +%I:%M) $(date +%p)\" ,\"tooltip\": \"$(date +%A)\"}"
