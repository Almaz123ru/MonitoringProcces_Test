# MonitoringProcces_Test

Monitoring process on Linux system using **bash** and **systemd**.

---

## Предполагаемые пути файлов:

- `monitoring.sh` → `/usr/local/bin/monitoring.sh`  
- `monitoring.service` → `/etc/systemd/system/monitoring.service`  
- `monitoring.timer` → `/etc/systemd/system/monitoring.timer` 

---

Разумеется необходимо выдать права на запуск скрипту с помощью:

```bash
chmod +x /usr/local/bin/monitoring.shh
```