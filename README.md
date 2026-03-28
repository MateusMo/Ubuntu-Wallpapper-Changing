# 🖼️ Wallpaper Changer (Ubuntu / GNOME)

Script Bash para trocar automaticamente o wallpaper no Ubuntu (GNOME), sem repetição e com suporte a modo escuro.

---

## 🚀 Funcionalidades

* Troca automática de wallpapers
* Intervalo de 20 segundos
* Não repete imagens até completar o ciclo
* Suporte a `picture-uri-dark`
* Execução como serviço systemd

---

## 📁 Estrutura

WallpapperChanging/
├── wallpaper_changer.sh
├── wallpaper.service

---

## ⚙️ Requisitos

* Ubuntu com GNOME
* gsettings
* systemd

---

## ▶️ Instalação

### 1. Clonar repositório

```bash
git clone https://github.com/SEU_USUARIO/WallpapperChanging.git
cd WallpapperChanging
```

---

### 2. Dar permissão ao script

```bash
chmod +x wallpaper_changer.sh
```

---

### 3. Criar diretório de serviços do usuário

```bash
mkdir -p ~/.config/systemd/user
```

---

### 4. Copiar o service

```bash
cp wallpaper.service ~/.config/systemd/user/
```

---

### 5. Recarregar o systemd

```bash
systemctl --user daemon-reload
```

---

### 6. Iniciar o serviço

```bash
systemctl --user start wallpaper.service
```

---

### 7. Ativar na inicialização (boot)

```bash
systemctl --user enable wallpaper.service
```

👉 Isso faz o script rodar automaticamente ao iniciar o Ubuntu

---

## 🛑 Parar o serviço

```bash
systemctl --user stop wallpaper.service
```

---

## 🔄 Reiniciar o serviço

```bash
systemctl --user restart wallpaper.service
```

---

## 🔍 Ver status

```bash
systemctl --user status wallpaper.service
```

---

## 📌 Observações

* Funciona no GNOME
* Necessário usar `picture-uri-dark` em tema escuro
* Wallpapers devem estar em `~/Imagens/wallpapers`

---

