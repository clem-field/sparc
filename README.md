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
- Ruby ~>3.2.1 (see https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md to install without brew)
- Rails ~>8.0.2
- view sparc/Gemfile.rb for all gems used in SPARC

* Configuration
- Environment variables are set up in either the .env or sparc.yaml. (see SPARC_ENVIRONMENT_VARIABLES for available configurations)
- SPARC uses openauth for enabling OpenID MFA. There are 2 available configurations [ OKTA, GitHub ] at this time.

* Existing control import
- scripts/* contains a simple python script that will import NIST R4 and R5 compliant catalogs from .xlsx into SPARC's catalog database. This allows users
to import their existing catalogs as needed. There are required file names, locations and columns for the import to be successful.

* Example files to update and where they are located

| File Name | File Location | File Type |
|-----------|---------------|-----------|
| 800-53-rev-controls.xlsx | sparc\lib | intput |
| 800-53-r4.xlsx | sparc\lib\ | output |
| 800-53a-rev4-objectives.xlsx | sparc\lib | intput |
| 800-53a-r4.xlsx | sparc\lib\ | output |

---

- Required Columns
Note: order of columns does not matter for either file and null/NaN will be filled in with "Not Available at creation"

Catalog File Columns:

| Column Name | Description | Example |
|-------------|-------------|---------|
| family | NIST or other control family | ACCESS CONTROL |
| control_id | the control name | AC-1 |
| title | control title | ACCESS CONTROL POLICY AND PROCEDURES |
| priority | the prioritiy of implementing the control | P1 |
| overlay | which baselines or overlays the control applies to | LOW, MODERATE, HIGH |
| language | the base control language | The organization: |
| related_controls | any controls that are considered part of the control | PM-9 |
| supplemental_guidance | any supplemental guidance for the control | This control addresses the establishment of policy and proceedure... |
| implementation_guidance | any implementation guidance to satisfy the control | to be added |
| nist_references | any supporting NIST references | NIST-800-53v4, NIST-800-53a-v4 |
| internal_references | any applicable internal policies related to the control | PR.AC-001 |
| check | how is the control checked/validated | Examine supporting policy documents |
| fix | how can a failing control be fixed | Ensure that policy establishes policy sufficient to implement RACI and frequency of review |

---

Part A columns: 

| Columne Name | Description | Example |
|--------------|-------------|---------|
| family | NIST or other control family | ACCESS CONTROL |
| control_id | the control name | AC-1 |
| title | control title | ACCESS CONTROL POLICY AND PROCEDURES |
| decision | what determines pass/fail | Determine if the organization: ... |
| examine | What needs to be reviewed/tested | Access control policy and proceedures reference... |
| test | the test to be performed | Organizational processes account management on the information ... |
| interview | what the output of the test is | Organizational personnel with access control responsibilities... |

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