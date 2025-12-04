# Secure Web Development Project

This repository contains the secured version of the Java JSP application used for my Secure Web Development module. The original codebase came from a public educational project that was intentionally vulnerable. My work focused on reviewing the weaknesses, applying server side security controls, and confirming that each issue was fixed.

## Project Overview

The application is built with JSP and a simple relational database. It supports user registration, login, product search, a basket system, and an admin area. The base version allowed several common attacks that appear in older Java web applications.  
The secured version keeps the same features but improves the internal logic so the system behaves safely. The work follows OWASP recommendations and uses practical fixes that can be applied directly in server side JSP logic.

## Main Features

• User registration  
• Login and session handling  
• Product search  
• Basket and user details  
• Admin view of users and basket contents  

## Security Objectives
The goal of the secured version is to give users a safer experience by protecting sensitive data and preventing common web attacks. 
The objectives include:
• making authentication and login safe  
• preventing cross site scripting  
• blocking forged requests  
• limiting access to protected resources  
• improving SQL handling and server side validation  

## Original Application Background
The base code used for this project comes from an intentionally vulnerable training application available in public educational resources. 
It included basic shopping features but lacked secure coding practices. 
My contribution focuses on fixing the vulnerable areas while keeping the original behaviour.


## Security Improvements

I focused on five core vulnerabilities from the OWASP list and fixed each one directly in the JSP pages.

### SQL Injection

The login page used raw string concatenation to build a query. This allowed attackers to change the SQL.  
I replaced this with prepared statements so the values are treated as data only.

### Stored XSS

Registration and contact pages stored user input and displayed it without any checking.  
I added output encoding using `StringEscapeUtils.escapeHtml4()` so the browser only shows text and does not run scripts.

### Reflected XSS

The search page printed whatever the user typed directly into the HTML.  
I applied HTML escaping to the search value so script tags appear as text and cannot run.

### CSRF

The password change feature did not verify the origin of the request.  
A CSRF token is now created on the server, added as a hidden field, and validated before the update is processed.

### Broken Access Control

The admin page could be opened by entering the URL directly.  
I added a server side session and role check. Only the admin account can open the page. Everyone else is redirected to login.

## Technology Stack

• Java JSP  
• JDBC  
• Apache Commons Lang for HTML escaping  
• Simple file based relational database  
• Standard servlet container  

## My Contributions
The original version allowed SQL injection, XSS, weak access control, and missing CSRF protection.  
I reviewed every page touched by user input and added server side fixes. 
All five security features in this project were implemented by me as part of this coursework.

## Repository Structure
• /              – Main JSP pages (login, register, basket, search, admin)
• /WEB-INF       – Deployment descriptors and config files
• /dbconnection.jspf – Database connection logic (JDBC)
• /Dockerfile    – Used to containerise the application
• README.md      – Documentation for setup and security improvements

The layout is kept close to the original project so the application remains easy to understand.

• root folder holds the JSP pages  
• dbconnection.jspf contains the database connection  
• WEB-INF contains configuration files  
• README explains the project and the changes made  
## Setup Instructions

### Option 1: Run with Apache Tomcat

1. Install Apache Tomcat  
2. Clone the repository  
3. Place the project folder inside the Tomcat webapps directory  
4. Start the server  
5. Open the browser and visit  
   http://localhost:8080

Default admin account remains the same:  
admin@thebodgeitstore.com

### Option 2: Run with Docker (Recommended)

These are the same steps I used during development.

1. Install Docker Desktop  
2. Clone the repository  
3. Open the terminal in the project folder  
4. Build the image  
   docker build -t securewebapp .  
5. Run the container  
   docker run -p 8080:8080 securewebapp  
6. Visit  
   http://localhost:8080

Docker handles the build and deployment without extra setup.

## Usage Guide

• Register a new user  
• Log in to access the main features  
• Use the search bar  
• Add products to the basket  
• Update your password using the CSRF protected form  
• The admin page is available only when logged in as the admin account  

## Testing Summary
Automated scan: SonarQube Community Edition used for static review (SAST) to verify code risks were removed.
Static Review
I reviewed the code manually and used IDE warnings and pattern based checks to identify unsafe string concatenation, missing validation, and direct script output. 
This helped confirm that the fixes removed the vulnerable behaviours.
I performed manual testing for each fixed vulnerability.
• SQL injection attempts no longer bypass login  
• Script payloads are shown as text on all pages  
• Password changes require a valid CSRF token  
• Admin page blocks unauthorised access and redirects correctly  
All fixes behaved as expected.

## Contributions and References

The base project is from open educational sources, commonly known as the BodgeIt Store.  
https://github.com/psiinon/bodgeit
All security improvements and server side fixes were implemented by me as part of the Secure Web Development CA at NCI.

