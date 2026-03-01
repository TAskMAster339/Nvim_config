# Neovim Config

Современный конфиг Neovim на Lua с менеджером пакетов [lazy.nvim](https://github.com/folke/lazy.nvim).

## Установка на Ubuntu

### 1. Зависимости

```bash
# Neovim >= 0.9 (рекомендуется 0.10+)
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install -y neovim

# Обязательные системные зависимости
sudo apt install -y git curl unzip build-essential

# ripgrep — для telescope live_grep
sudo apt install -y ripgrep

# fd — для telescope find_files (быстрый поиск файлов)
sudo apt install -y fd-find
# Создаём алиас, если fd недоступен как fd
ln -sf $(which fdfind) ~/.local/bin/fd 2>/dev/null || true

# Node.js — нужен для некоторых LSP-серверов (pyright и др.)
sudo apt install -y nodejs npm

# Python — для pyright и работы с Python-файлами
sudo apt install -y python3 python3-pip

# Шрифт с иконками (Nerd Font) — для иконок в nvim-tree, lualine и т.д.
# Рекомендуется JetBrainsMono Nerd Font или любой другой Nerd Font:
# https://www.nerdfonts.com/font-downloads
# После установки шрифта — выбери его в настройках терминала!
```

### 2. Клонирование конфига

```bash
# Сохранить старый конфиг, если есть
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# Клонировать этот репозиторий
git clone https://github.com/TAskMAster339/Nvim_config.git ~/.config/nvim
```

> Замени `your-username` на своё имя пользователя на GitHub.

### 3. Первый запуск

```bash
nvim
```

При первом запуске **lazy.nvim** автоматически:
1. Скачает и установит себя
2. Установит все плагины из `lua/core/plugins.lua`

Подождите пока установка завершится. После этого **закройте и снова откройте nvim**.

### 4. Установка LSP-серверов

После второго запуска nvim откройте Mason для установки LSP:

```
:MasonInstall lua-language-server clangd pyright
```

Или просто откройте любой `.lua`, `.c`, `.py` файл — mason-lspconfig установит нужные серверы автоматически (прописано в `lsp_config.lua`).

### 5. Установка парсеров treesitter

Treesitter парсеры устанавливаются автоматически при открытии файлов. Принудительно:

```
:TSInstall lua python c vim
```

---

## Плагины

| Плагин | Назначение |
|--------|-----------|
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Цветовая схема (активна по умолчанию) |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Цветовая схема |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Цветовая схема |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | Файловое дерево |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Строка статуса |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Подсветка синтаксиса |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Менеджер LSP/DAP/линтеров |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Настройка LSP |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Автодополнение |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Сниппеты |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Табы буферов |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Подсветка TODO/FIXME/HACK |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Нечёткий поиск |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Авtozакрытие скобок |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Комментирование кода |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | Подсветка слова под курсором |
| [better-escape.nvim](https://github.com/max397574/better-escape.nvim) | Быстрый выход из Insert Mode |

---

## Горячие клавиши

> `<Leader>` = `Space`

### Общие

| Клавиша | Действие |
|---------|---------|
| `<Leader>q` | Закрыть буфер/выйти |
| `<Ctrl+s>` | Сохранить файл (Normal + Insert) |
| `<Ctrl+a>` | Скопировать весь файл |
| `jk` | Выход из Insert Mode в Normal Mode |

### Файловое дерево (nvim-tree)

| Клавиша | Действие |
|---------|---------|
| `<Ctrl+n>` | Открыть/закрыть nvim-tree |
| `<Ctrl+f>` | Перейти в nvim-tree |

### Буферы (bufferline)

| Клавиша | Действие |
|---------|---------|
| `<Tab>` | Следующий буфер |
| `<Shift+Tab>` | Предыдущий буфер |
| `<Ctrl+b>` | Закрыть все остальные буферы |

### Telescope

| Клавиша | Действие |
|---------|---------|
| `<Ctrl+p>` | Найти файлы |
| `<Space><Space>` | Недавние файлы |
| `<Leader>fg` | Поиск по содержимому (live grep) |
| `<Leader>fh` | Справка |
| `<Leader>cs` | Выбор цветовой схемы |
| `<Leader>gb` | Git ветки |
| `<Leader>gc` | Git коммиты |
| `<Leader>gs` | Git статус |

### LSP

| Клавиша | Действие |
|---------|---------|
| `K` | Показать документацию |
| `gd` | Перейти к определению |
| `gi` | Перейти к реализации |
| `gr` | Показать ссылки |
| `<Leader>rn` | Переименовать символ |
| `<Leader>ca` | Code Action |

### Автодополнение (nvim-cmp)

| Клавиша | Действие |
|---------|---------|
| `<Tab>` | Следующий вариант |
| `<Shift+Tab>` | Предыдущий вариант |
| `<Enter>` | Подтвердить выбор |
| `<Ctrl+Space>` | Открыть меню дополнений |
| `<Ctrl+e>` | Закрыть меню |
| `<Ctrl+b>` | Прокрутить документацию вверх |
| `<Ctrl+f>` | Прокрутить документацию вниз |

### Комментарии (Comment.nvim)

| Клавиша | Действие |
|---------|---------|
| `M` | Переключить строчный комментарий |
| `N` | Переключить блочный комментарий |
| `gcO` | Добавить комментарий выше строки |
| `gco` | Добавить комментарий ниже строки |
| `gcA` | Добавить комментарий в конец строки |

### Подсветка (illuminate)

| Клавиша | Действие |
|---------|---------|
| `<Leader>t` | Включить/выключить подсветку слова |
| `<Leader>h` | Убрать подсветку поиска | 
