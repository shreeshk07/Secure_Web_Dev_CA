Secure Web Development Continuous Assessment -2
Student: Shreesh Kallihal
ID : 24261335
Course: MSc Cybersecurity
National College of Ireland

Overview

This repository contains my coursework project for the Secure Web Development CA-2.
The work is based on The BodgeIt Store, an intentionally vulnerable Java web application originally created for teaching common web security issues.

My objective in this project is to take the vulnerable application and progressively harden it by applying secure development principles. All improvements follow the module requirements and reflect a structured approach to identifying, analysing, and mitigating security weaknesses.

The project demonstrates practical implementation of secure coding practices, threat modelling, secure architecture, and testing strategies relevant to enterprise-level web applications.

Base Application

Original Repository:
https://github.com/psiinon/bodgeit

Purpose of the Base Code:
The BodgeIt Store is a deliberately insecure web shop designed to expose vulnerable patterns such as SQL injection, XSS, weak authentication, missing access controls, CSRF issues, and poor error handling. It provides a realistic environment for identifying and fixing vulnerabilities within a functioning application.

License:
The original project is publicly available under open usage terms in its GitHub repository. This work builds upon it strictly for academic and educational purposes.

Project Goals

The scope of my project includes:

Reviewing the original application and mapping its main functional and security weaknesses.

Implementing secure coding fixes across authentication, input handling, access control, CSRF, password storage, and error management.

Improving the architecture and documenting key design decisions from a security perspective.

Conducting functional testing and security testing, including manual validation and static analysis.

Producing a detailed report aligned with NCI’s template and assessment requirements.

Providing a video demonstration showing the application before and after security improvements.

Features of the Application

The base application includes:

Product browsing and search

User registration and login

Shopping basket and checkout flow

Basic administrative pages

Scoreboard for challenges (used in training exercises)

These features remain intact while being updated to meet modern security expectations.

Security Objectives and Improvements

This project focuses on strengthening the following areas:

Protection against SQL injection using parameterised queries

Prevention of reflected and stored XSS through validation and output encoding

Introduction of CSRF protection on critical state-changing actions

Strengthening authentication flows and applying secure password hashing

Restricting direct access to hidden or sensitive endpoints

Removing debug information and improving error handling

Reviewing server-side logic to ensure separation of roles and enforcement of privileges

A full list of planned and completed improvements is maintained in the security plan within the repository.