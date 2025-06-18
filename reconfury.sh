#!/bin/bash

# ┌────────────────────────────────────────┐
# │        ReconFury v1.0 by 6amsolution   │
# └────────────────────────────────────────┘

DOMAIN=$1
OUTPUT="output/subdomains-$DOMAIN.txt"
TEMP_DIR="tmp"
mkdir -p $TEMP_DIR output

if [ -z "$DOMAIN" ]; then
  echo "[!] Usage: ./reconfury.sh example.com"
  exit 1
fi

echo " Starting ReconFury for: $DOMAIN"
echo " Passive Recon..."

# Passive
subfinder -d $DOMAIN -silent > $TEMP_DIR/passive1.txt
assetfinder --subs-only $DOMAIN >> $TEMP_DIR/passive1.txt
amass enum -passive -d $DOMAIN >> $TEMP_DIR/passive1.txt

echo " Gathering Certificate Transparency logs..."
python3 modules/ct_log_scraper.py $DOMAIN > $TEMP_DIR/ct.txt

echo " Active Enumeration (Bruteforce with Amass)..."
amass enum -brute -active -d $DOMAIN -w wordlists/top-1000.txt >> $TEMP_DIR/active.txt

echo " Validating subdomains using DNSx..."
cat $TEMP_DIR/*.txt | sort -u | dnsx -silent > $OUTPUT

echo "Total Valid Subdomains: $(wc -l < $OUTPUT)"
echo " Output saved to: $OUTPUT"

# Cleanup (optional)
# rm -rf $TEMP_DIR
