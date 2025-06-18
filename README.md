# 🚀 ReconFury v1.0

A Professional Subdomain Enumeration Tool  
**Author**: Hammad Munir  
**Company**: 6amsolution Private Limited  
**Focus**: Red Teaming | Bug Bounty | Recon Automation

---

## 🔥 Features

| Type       | Tools Used                                  | Highlights                            |
|------------|----------------------------------------------|----------------------------------------|
| Passive    | Subfinder, Assetfinder, Amass (passive)      | API-based, stealthy, wide coverage     |
| Active     | Amass (brute), DNSx                          | Brute-force and DNS resolution         |
| CT Logs    | crt.sh + Python script                       | SSL Certificate scraping               |
| DNS Check  | DNSx                                         | Verifies only live subdomains         |
| Modular    | Easy to add new recon modules                | Plug-and-play style architecture       |

---

## 🛠 Requirements

```bash
# Install Golang Tools
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/OWASP/Amass/v3/...@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/tomnomnom/assetfinder@latest

# Python
pip install -r requirements.txt
