# 🛡️ Phishing Email Detection System
## 📊 Project Overview

The **Phishing Email Detection** System is a Machine Learning–based web application that detects whether an email is Phishing or Legitimate.
The system analyzes email content, URLs, and attachments using Natural Language Processing (NLP) and machine learning models.

This project demonstrates how AI can improve email security, helping users identify phishing attacks, analyze suspicious links, and check attachments in real time.

---
##🛠 Tools & Technologies
*Python – Backend programming and ML model development
*Flask – Web application framework
*Scikit-learn – Machine learning model creation
*Pandas & NumPy – Data preprocessing and manipulation
*SQLite – Database management for logs and users
*HTML, CSS, JavaScript – Frontend interface
*NLP Techniques – Email text preprocessing and feature extraction

---

##📂 Dataset
*The dataset contains emails labeled as Phishing or Legitimate, including:
*Email Content (text)
*URLs contained in the email
*Attachments
*Email Labels (Phishing / Legitimate)

---
##🔎 Machine Learning Workflow
*Email Input: User enters email text (and optionally URLs or attachments).
*Text Preprocessing: Emails are cleaned using NLP techniques.
*Feature Extraction: Important features extracted from text, URLs, and attachments.
*Model Prediction: Trained ML model predicts whether the email is phishing or legitimate.
*Result Display: Dashboard shows the prediction with clear classification and details about suspicious links or attachments.

---
##📈 Key Features
*User Authentication (Login & Signup)
*Phishing Detection via ML
*URL Analysis to detect malicious links
*Attachment Analysis to check for harmful files
*Prediction results displayed clearly on the dashboard
*Logs to track previous email analyses
*Model Retraining for improved accuracy
*Simple, user-friendly web interface

---
##🎯 Key Insights
*Phishing emails often contain urgent or threatening language.
*Suspicious URLs and attachments are strong indicators of phishing.
*The system improves cybersecurity awareness and reduces risk of attacks.
*Model accuracy improves with regular retraining on new email datasets.

---
##🚀 How to Run This Project
*1️⃣ Clone Repository
git clone https://github.com/Vasantlohar0504/phishing-email-detection.git
cd phishing-email-detection

*2️⃣ Create Virtual Environment
python -m venv venv
# Windows
venv\Scripts\activate
# Mac / Linux
source venv/bin/activate

*3️⃣ Install Dependencies
pip install -r requirements.txt

*4️⃣ Start Flask Server
python app.py


Open your browser and visit:
http://127.0.0.1:5000

##📊 Example Usage
Input Email:
Dear user,
Your account has been suspended. Click here to verify your account immediately.
Prediction Result:
⚠️ Phishing Email Detected

URLs & Attachments Checked: Suspicious link detected, attachment safe

##👨‍💻 Author
Vasant Lohar
Data Analyst | Data Science Enthusiast
