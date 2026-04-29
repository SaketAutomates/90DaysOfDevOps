# Day 14 – Networking Basics & Troubleshooting

## Quick Concepts
- **OSI vs TCP/IP**
  - OSI: Physical → Data Link → Network → Transport → Session → Presentation → Application
  - TCP/IP: Link → Internet → Transport → Application
- **Protocol placement**
  - IP → Internet layer  
  - TCP/UDP → Transport layer  
  - HTTP/HTTPS, DNS → Application layer
- **Example**
  - `curl https://example.com` → Application layer (HTTP) over TCP over IP

---

## Hands-on Checklist

- **Identity**  
  `hostname -I` → My IP: `192.168.1.10`

- **Reachability**  
  `ping google.com` → Latency ~45ms, 0% packet loss  
  *Scenario:* If a site feels “down,” ping confirms if packets reach it.

- **Path**  
  `traceroute google.com` → 12 hops, one long delay at hop 8  
  *Scenario:* Useful when latency spikes — shows where the slowdown happens.

- **Ports**  
  `ss -tulpn` → Found SSH listening on port 22  
  *Scenario:* When remote login fails, check if SSH is actually listening.

- **Name Resolution**  
  `dig google.com` → Resolved to `142.250.183.206`  
  *Scenario:* If DNS fails, you’ll see no IP returned.

- **HTTP Check**  
  `curl -I https://google.com` → Status `200 OK`  
  *Scenario:* If you get `500`, the server is up but misbehaving.

- **Connections Snapshot**  
  `netstat -an | head` → 5 ESTABLISHED, 3 LISTEN  
  *Scenario:* Quick view of active vs listening sockets.

---

## Mini Task: Port Probe
- Listening port: SSH on 22  
- Test: `nc -zv localhost 22` → Reachable ✅  
- If not reachable → Next check: `systemctl status sshd` or firewall rules

---

## Reflection
- **Fastest signal when broken** → `ping` (reachability check)  
- **If DNS fails** → Inspect Internet layer (IP routing)  
- **If HTTP 500 shows up** → Application layer (web server logs)  
- **Follow-up checks in real incident**  
  1. `journalctl -u <service>` for logs  
  2. Firewall rules (`iptables -L` or `firewalld`) for blocked traffic

---

## Learn in Public
Day 14 was about making networking real: mapping OSI/TCP-IP to actual troubleshooting.  
One interesting finding: `traceroute google.com` showed a long delay at hop 8 — a reminder that path visibility helps pinpoint bottlenecks.  

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham #Networking

