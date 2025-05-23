# 🔐 Password Manager 9000

Welcome to **Password Manager 9000** — the last password manager you'll ever need.

🚀 Strong, secure, and stylish passwords generated from the terminal.  
🛡️ Export as `.csv`, store safely, and even sync with your browser.  
⚡ Works offline, respects your privacy, and keeps things simple.

---

## 🖼️ Features

- ✅ Interactive terminal interface with colored prompts
- 🔐 Generates strong random passwords
- 💾 Saves your passwords to a `.txt` file and exports to `.csv`
- 🗂️ Choose your save directory (defaults to `~/Desktop/password/`)
- 🔒 Password file access requires `sudo`
- 🌐 Add and export to Chrome, Brave, or Firefox-compatible `.csv` format
- 🧰 Cross-platform (Linux/macOS with Bash)

---

## 🚀 Installation & Setup

### 1. Clone this repository

```bash
git clone https://github.com/MANAWADUGE/password-manager-9000.git
cd password-manager-9000
````

### 2. Make the script executable

```bash
chmod +x passwordGenerator.sh
```

### 3. Add it as a terminal command (`password`)

```bash
sudo mv passwordGenerator.sh /usr/local/bin/password
```

> 💡 Now you can run it anywhere by typing:
>
> ```bash
> password
> ```

---

## 🛠️ Usage

Launch the script:

```bash
password
```

Follow the colorful prompts to:

* Enter the number and length of passwords to generate
* Choose your favorite from the list
* Enter the website/application and username
* Automatically save the password securely

---

## 💾 Where Passwords Are Saved

By default:

```
~/Desktop/password/password.txt
```

You will be prompted to choose a custom directory if you like.

Passwords are also exported to:

```
~/Desktop/password/passwords.csv
```

> ⚠️ This folder requires `sudo` access to view or modify, adding a layer of local protection.

---

## 🌍 Browser Integration

To import your generated passwords into browsers:

1. Open Chrome/Brave/Firefox settings
2. Look for **Import Passwords**
3. Select the exported `.csv` file from:

   ```
   ~/Desktop/password/passwords.csv
   ```

You’re now synced and secure!

---

## 🧑‍💻 Contributing

Pull requests are welcome! Feel free to fork the repo and submit your improvements.

To contribute:

1. Fork this repository
2. Create a new branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

---

## 📄 License

MIT License
See [`LICENSE`](LICENSE) for more information.

---

## 🙏 Acknowledgments

* Built with 💻 and ❤️ by [MANAWADUGE](https://github.com/MANAWADUGE)
* Inspired by the need for terminal-native, private password management

---

🔐 Stay safe, stay secure — with **Password Manager 9000**

```

---
