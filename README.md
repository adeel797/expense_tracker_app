# 💰 Expense Tracker App (Android)

## 🌟 Introduction

Welcome to the **Expense Tracker App** — your ultimate solution for managing personal finances on the go! 📊💸 Built with **Flutter**, this app allows you to track income and expenses, categorize transactions, and sync data to the cloud for seamless access across devices.

With a sleek, gradient-based UI and offline support, it’s designed for **usability and reliability**. 🚀

The app organizes your financial transactions into **local and cloud-synced views**, supports **user authentication**, and provides a **summary of your income, expenses, and balance**. Powered by **Firebase** for authentication and cloud storage, and **Hive** for local persistence, your data stays secure and accessible even offline. 📱🔒

---

## ✅ Key Features

### 🔐 User Authentication

* Sign up and log in with **email and password** using Firebase Authentication.
* Logout functionality with automatic closure of user-specific Hive boxes.

### 💸 Transaction Management

* Add transactions, categorized as **Income** or **Expense**.
* View recent transactions (last 3 days) or all transactions, grouped by date.
* Categorize transactions with predefined or custom categories (e.g., Salary, Food, Rent).

### 📂 Local Storage

* Store transactions and categories in **user-specific Hive boxes** for offline access.
* Automatically add default categories for new users.
* Real-time UI updates when local data changes.

### ☁️ Cloud Syncing

* Sync local transactions and categories to **Firestore** when online.
* Fetch synced transactions from Firestore for cloud-based access.
* Handles connectivity issues gracefully with fallback to local data.

### 📊 Financial Summary

* Display **total income, expenses, and net balance** in a concise dashboard.
* Color-coded indicators for positive or negative balance.

### 🌗 Responsive UI

* Gradient backgrounds for a modern look.
* Custom widgets for forms, buttons, and tiles for consistent styling.
* Animated category selection and smooth navigation transitions.

### 🔄 Refreshable Views

* Pull-to-refresh for recent transactions, all transactions, and cloud-synced transactions.
* Real-time updates using Hive’s listenable boxes.

### 👤 User Profile

* Display user **name and email** fetched from Firestore or Firebase Authentication.
* Gradient-bordered avatar with a logout option.

---

## 🛠 Tech Stack & Dependencies

### Framework & Architecture

* **Flutter**
* **Stacked Architecture** (`stacked`, `stacked_services`)

### Plugins & Packages

* `firebase_auth` – Firebase Authentication
* `cloud_firestore` – Firestore for cloud storage
* `hive_flutter` – Local storage for transactions and categories
* `uuid` – Generate unique IDs
* `intl` – Date formatting
* `fluttertoast` – Toast notifications
* `connectivity_plus` – Check internet connectivity
* `path_provider` – Access device storage for Hive initialization

---

## 📸 App Screenshots

| Splash | Login | Signup | Profile |
| ------ | ----- | ------ | ------- |
| <img src="https://github.com/user-attachments/assets/4b1a587f-1177-40d6-a02b-289b61f5ee32" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/9472c0dc-8a8b-4ecb-81a1-14daf4404e01" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/0570afd7-0268-4cc6-890e-a43a6366e39c" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/89bb8e3d-a897-4062-89a3-56149b24728e" width="150" height="300" /> |

| Transactions (offline) | Transactions (online) | Add Transactions |
| ---------------------- | --------------------- | ---------------- |
| <img src="https://github.com/user-attachments/assets/9c444469-0332-48b8-898e-90921091f4e1" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/8d9ab25f-8df5-4274-b16d-a7b89646e2a6" width="150" height="300" /> | <img src="https://github.com/user-attachments/assets/bd05abd5-f30e-4917-823d-22233b1203ec" width="150" height="300" /> |


---

## 📲 Download the App

The Expense Tracker App is **open-source** and ready for you to explore, modify, and improve.
Perfect for learning **Flutter, Firebase, and Hive integration**, or as a base for a personal finance project.
**[Download for Android](https://drive.google.com/file/d/1cE7tFsfc1NLNalAMOStPC0Pwqkdpieee/view?usp=drive_link)** 📱

---

## 🤝 Contribute

We welcome contributions to improve the app!

* **🐛 Submit Issues:** Report bugs or suggest enhancements.
* **🔧 Pull Requests:** Send improvements with detailed descriptions.
* **💡 Feature Ideas:** Suggest new features like transaction charts, budget tracking, or multi-currency support.

---
