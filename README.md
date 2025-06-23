# README
# SPARC - Systemized Policy and Regulatory Controls

SPARC is a powerful control catalog management platform purpose-built to streamline and modernize how organizations manage, track, and implement NIST 800-53 (and related) security and privacy controls. SPARC empowers security and compliance teams by transforming static control catalogs into dynamic, machine-readable, policy-as-code artifacts that integrate directly into DevSecOps pipelines.

---

## 🚀 What is SPARC?

**SPARC (Systemized Policy and Regulatory Controls)** is a control catalog management solution that centralizes, normalizes, and operationalizes compliance frameworks such as:

- NIST 800-53 Rev. 5
- Baselines (Low, Moderate, High)
- ISO 27001, CIS Benchmarks (via mappings)
- Custom internal control overlays

SPARC helps teams manage the lifecycle of controls while enabling automation through structured, versioned control data in **machine-readable formats** such as [OSCAL (Open Security Controls Assessment Language)](https://pages.nist.gov/OSCAL/).

---

## 🔧 Key Features

- **📚 Unified Control Catalog**: Centralized management of one or many control baselines (NIST, FedRAMP, custom overlays)
- **🧩 Control Mappings**: Support for cross-framework mappings (e.g., NIST to ISO or CIS)
- **⚙️ Policy-as-Code Generation**: Export control requirements as YAML, Rego, JSON, or HCL to integrate into:
  - Infrastructure-as-code
  - CI/CD pipeline enforcement
  - Runtime security policies
- **🔍 Traceability and Justification**: Attach test plans, automated evidence, or manual assertions to controls
- **📤 OSCAL Native**: Import and export OSCAL-formatted control catalogs, system security plans (SSPs), and implementation plans
- **🔐 RBAC & Audit Trails**: Ensure integrity and oversight of catalog updates

---

## 🧠 Why SPARC?

Traditional compliance methods are manual, siloed, and slow. SPARC replaces spreadsheets and static documents with a **machine-actionable source of truth**, enabling:

| Benefit | Description |
|--------|-------------|
| 🔄 Automation | Drive real-time enforcement of security controls via policy-as-code |
| 📈 Scalability | Manage thousands of controls and mappings across multiple environments |
| ✅ Audit Readiness | Generate OSCAL-aligned artifacts for faster ATO (Authority to Operate) |
| 🧪 Integration | Plug into GitLab, Terraform, OPA/Gatekeeper, Jenkins, and more |

---

## 🛠️ Example Use Case

🔗 Related Projects
	•	MITRE OSCAL
	•	Open Policy Agent (OPA)
	•	Terraform Compliance


Requirements:

* System dependencies
- Ruby ~>3.2.1
- Rails ~>8.0.2
- view sparc/Gemfile.rb for all gems used in SPARC

* Configuration
- Environment variables are set up in either the .env or sparc.yaml. (see SPARC_ENVIRONMENT_VARIABLES for available configurations)
- SPARC uses openauth for enabling OpenID MFA. There are 2 available configurations [ OKTA, GitHub ] at this time.

* Existing control import
- scripts/* contains a simple python script that will import NIST R4 and R5 compliant catalogs from .xlsx into SPARC's catalog database. This allows users
to import their existing catalogs as needed. There are required file names, locations and columns for the import to be successful.

| File Name | File Location |
|-----------|---------------|
| 800-53-r4.xlsx | sparc\lib\ |
| 800-53-r5.xlsx | sparc\lib\ |
| 800-53a-r4.xlsx | sparc\lib\ |
| 800-53a-r5.xlsx | sparc\lib\ |

---

- Required Columns
Note: order of columns does not matter for either file

Catalog File Columns:

| Column Name | Description |
|-------------|-------------|
| family | NIST or other control family |
| control_id | the control name (e.g. - AC-1) |
| language | the base control language |
| supplemental_guidance | any supplemental guidance for the control |
| implementation_guidance | any implementation guidance to satisfy the control |
| nist_references | any supporting NIST references (e.g. - NIST-800-53v4, NIST-800-53a-v4)
| internal_references | any applicable internal policies related to the control |
| priority | the prioritiy of implementing the control |
| check | how is the control checked/validated |
| fix | how can a failing control be fixed |

---

Part A columns: (need to revisit) 

| Columne Name | Description |
|--------------|-------------|
| family | NIST or other control family |
| control_id | the control name (e.g. - AC-1) |
| test | the test to be performed |
| expected_results | what the output of the test is |

---




* Database creation
  db:migrate

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
- git clone 
- cd ./sparc
- bundle install (required for local development)
- configure environment variables
- bin/rails server
- navigate to https://127.0.0.1:3000
 

🤝 Contributing

We welcome contributions! Please read the contributing guide and code of conduct.