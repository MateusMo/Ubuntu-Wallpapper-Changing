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

## 📁 Estrutura de diretórios

O projeto deve estar localizado em:

```
~/PersonalProjects/WallpapperChanging/
├── wallpaper_changer.sh
└── wallpaper.service
```

As imagens devem estar em:

```
~/Imagens/wallpapers/
├── foto1.jpg
├── foto2.png
└── ...
```

> ⚠️ O diretório `~/Imagens/wallpapers/` **precisa existir e ter imagens** antes de iniciar o serviço.
> Crie-o se necessário: `mkdir -p ~/Imagens/wallpapers`

---

## ⚙️ Requisitos

* Ubuntu com GNOME
* `gsettings` (já incluso no Ubuntu com GNOME)
* `systemd`
* Sessão gráfica ativa (o serviço depende do ambiente de desktop)

---

## ▶️ Instalação

### 1. Clonar repositório

```bash
git clone https://github.com/MateusMo/Ubuntu-Wallpapper-Changing
cd WallpapperChanging
```

---

### 2. Criar diretório de wallpapers e adicionar imagens

```bash
mkdir -p ~/Imagens/wallpapers
# Copie suas imagens para ~/Imagens/wallpapers/
```

> Formatos suportados pelo GNOME: `.jpg`, `.jpeg`, `.png`, `.webp`

---

### 3. Dar permissão ao script

```bash
chmod +x wallpaper_changer.sh
```

---

### 4. Criar diretório de serviços do usuário

```bash
mkdir -p ~/.config/systemd/user
```

---

### 5. Copiar o service

```bash
cp wallpaper.service ~/.config/systemd/user/
```

---

### 6. Recarregar o systemd

```bash
systemctl --user daemon-reload
```

---

### 7. Iniciar o serviço

```bash
systemctl --user start wallpaper.service
```

---

### 8. Ativar na inicialização (boot)

```bash
systemctl --user enable wallpaper.service
```

> 👉 Isso faz o script rodar automaticamente ao iniciar o Ubuntu.
> Para funcionar no boot, o **lingering** do usuário precisa estar ativo (veja Observações).

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

## 🔍 Ver status / logs

```bash
systemctl --user status wallpaper.service
```

```bash
journalctl --user -u wallpaper.service -f
```

> Use `journalctl` para depurar caso o wallpaper não mude.

---

## 📌 Observações importantes

### ⚠️ DBUS / gsettings em serviço systemd

O `gsettings` depende do barramento de sessão gráfica (`DBUS_SESSION_BUS_ADDRESS`).
Se o serviço iniciar **antes da sessão gráfica estar pronta**, o wallpaper não será alterado.

Caso isso ocorra, adicione um atraso no início do script ou use `ExecStartPre` no `.service`:

```ini
[Service]
ExecStartPre=/bin/sleep 5
ExecStart=%h/PersonalProjects/WallpapperChanging/wallpaper_changer.sh
```

---

### 🔁 Autostart no boot (lingering)

Para que serviços `--user` rodem automaticamente no boot (sem necessidade de login gráfico prévio), ative o lingering:

```bash
loginctl enable-linger $USER
```

> Sem isso, o serviço só sobe após o primeiro login.

---

### 🖼️ Formatos de imagem

O GNOME aceita os seguintes formatos como wallpaper:
`.jpg`, `.jpeg`, `.png`, `.webp`

Evite `.gif`, `.bmp` ou outros formatos incomuns — podem não ser reconhecidos.

---

### 🌙 Modo escuro

O script já define `picture-uri-dark`, então o wallpaper muda tanto no tema claro quanto no escuro.
Ambos recebem a mesma imagem. Para comportamentos diferentes por tema, seria necessário adaptar o script.

---

### 📂 Wallpapers em outro diretório

Se preferir outro caminho para as imagens, edite a variável no início do script:

```bash
WALLPAPER_DIR="$HOME/Imagens/wallpapers"
```

Troque pelo caminho desejado, por exemplo:

```bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
```

---

### 🔤 Nomes de arquivo com espaços

O script usa `mapfile` com `find`, o que lida corretamente com espaços em nomes de arquivo.
Não há necessidade de renomear suas imagens.

---
