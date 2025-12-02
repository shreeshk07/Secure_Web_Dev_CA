# Security Plan  
## Secure Web Development CA  
## Student: Shreesh Kallihal  

This document outlines all planned security improvements for the BodgeIt Store web application.  
The goal is to identify high-impact vulnerabilities, implement targeted fixes, and validate the improvements through testing.

---

## 1. Identified Vulnerabilities

The original BodgeIt Store contains multiple weaknesses commonly observed in insecure web applications:

1. SQL Injection in login and query logic  
2. Reflected XSS in search results  
3. Stored XSS in user fields such as username and feedback  
4. Missing CSRF protection for state-changing actions  
5. No role-based access control on hidden or sensitive pages  
6. Plaintext or weak password storage  
7. Debug information leakage via `?debug=true` parameter and stack traces  
8. Insecure Direct Object References (IDOR) in product pages  
9. Lack of input validation on several forms  
10. Weak error handling that exposes internal behaviour  

---

## 2. Security Requirements

### Requirement 1: SQL Injection Prevention
* Replace all SQL string concatenation with prepared statements  
* Reject invalid or malicious characters in inputs  

### Requirement 2: XSS Mitigation
* Apply output encoding to all dynamic values  
* Validate and sanitise input  

### Requirement 3: CSRF Protection
* Generate CSRF token per session  
* Validate token for every sensitive POST request  

### Requirement 4: Authentication & Password Security
* Hash passwords using bcrypt  
* Validate password strength at registration  
* Update login logic to compare hashed values  

### Requirement 5: Access Control
* Restrict direct URL access  
* Protect scoreboard and internal pages  

### Requirement 6: Debug and Error Handling
* Disable debug parameters  
* Replace stack traces with safe messages  

### Requirement 7: IDOR Prevention
* Enforce ownership checks and validate all IDs  

---

## 3. Implementation Plan (in commit order)

1. Fix SQL injection using prepared statements  
2. Add output encoding and input validation to prevent XSS  
3. Add CSRF token generation and verification  
4. Implement bcrypt hashing for passwords  
5. Add strict access control checks  
6. Remove or disable debug features  
7. Add IDOR validation  
8. Additional improvements found during testing  

---

## 4. Testing Strategy

### Functional Tests  
* Register  
* Login  
* Search  
* Add to basket  
* Checkout  

### Security Tests  
* SQL payloads  
* Reflected and stored XSS payloads  
* CSRF replay tests  
* IDOR attempts  
* Access control bypass attempts  
* Error message inspection  

### Automated / SAST  
* OWASP ZAP baseline scan  
* Review of logs and exceptions  

---

## 5. Completion Table

| ID | Requirement | Status | Progress |
|----|-------------|--------|----------|
| 1 | SQL Injection Fix | In progress | 20% |
| 2 | XSS Fixes | In progress  | 0% |
| 3 | CSRF Protection | Planned | 0% |
| 4 | Password Hashing | Planned | 0% |
| 5 | Access Control | Planned | 0% |
| 6 | Debug Handling | Planned | 0% |
| 7 | IDOR Fix | Planned | 0% |

---
