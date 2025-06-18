import requests
import sys
import json

def get_ct_subdomains(domain):
    url = f"https://crt.sh/?q=%25.{domain}&output=json"
    try:
        res = requests.get(url, timeout=10)
        data = json.loads(res.text)
        subs = set()
        for entry in data:
            for name in entry.get("name_value", "").split("\n"):
                if domain in name:
                    subs.add(name.strip())
        return subs
    except Exception as e:
        print(f"[!] Error fetching from crt.sh: {e}")
        return set()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 ct_log_scraper.py example.com")
        sys.exit(1)

    domain = sys.argv[1]
    for sub in sorted(get_ct_subdomains(domain)):
        print(sub)
