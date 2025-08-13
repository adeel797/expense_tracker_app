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

| Light Mode | Dark Mode |
| ---------- | --------- |
| <img src="https://github.com/user-attachments/assets/81ab83df-5743-485e-9827-c3eee1dfd548" width="200" height="400" /> | <img src="https://github.com/user-attachments/assets/d424ec8a-338e-46d6-a5de-b732c65b3e90" width="200" height="400" /> |
| <img src="https://github.com/user-attachments/assets/e5d1fd6e-a359-484f-8b39-9f071a04d78a" width="200" height="400" /> | <img src="https://github.com/user-attachments/assets/2df014e3-9d96-4cbe-a96d-8a1bbb56a48f" width="200" height="400" /> |
| <img src="https://github.com/user-attachments/assets/08189a60-c0ab-4ea7-aa55-034b325fbdba" width="200" height="400" /> | <img src="https://github.com/user-attachments/assets/2bc904bb-64c5-4d99-8b25-183f21f50917" width="200" height="400" /> |

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
