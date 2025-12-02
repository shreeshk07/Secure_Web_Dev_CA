# Developer Notes  
## Analysis of Original Vulnerable Application  
## Student: Shreesh Kallihal  

This document records initial observations from running and analysing the original BodgeIt Store code before implementing any security fixes.

---

## 1. Environment Setup

* Application built locally from original source  
* Running on: http://localhost:8080/bodgeit  
* Deployment via standard Java servlet container  

---

## 2. Functional Behaviour (Baseline)

The following features work without modification:

* Product list and product detail pages  
* Search  
* User registration  
* Login  
* Shopping basket  
* Checkout  
* Scoreboard page (accessible without restrictions)  

---

## 3. Baseline Vulnerability Observations

### SQL Injection  
* Login can be bypassed using payload `' OR '1'='1`  
* Confirms raw string concatenation in SQL queries  

### Reflected XSS  
* `<script>alert(1)</script>` executed in search page output  

### Stored XSS  
* Username with script tags renders unescaped  

### CSRF  
* No token in any form  
* Sensitive actions can be performed via forged requests  

### Debug Information Exposure  
* `?debug=true` reveals stack traces or internal information  

### Access Control Issues  
* Scoreboard viewable by unauthenticated users  
* No role verification  

### IDOR  
* Product IDs modifyable manually  
* No validation  

---

## 4. Planned Enhancements  
* Prepared statements for SQL queries  
* Output encoding for user-controlled fields  
* CSRF tokens on all state-changing actions  
* bcrypt for password hashing  
* Access control enforcement  
* Remove debug leakage  
* Input validation on all forms  
* Ownership checks for ID-based resources  

---

## 5. Screenshot Logs  
* All baseline vulnerability screenshots stored in `/screenshots/before/`

---

## 6. Next Steps  
* Begin with SQL injection fix  
* Implement one fix per commit  
* Capture “after fix” screenshots for verification  
