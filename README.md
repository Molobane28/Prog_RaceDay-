\# RaceDay – Race Event Management System



\## 1. Project Overview



RaceDay is a race event management system designed to manage race events, organisers, participants, event categories, enrolments and race results.



This repository contains the design and documentation completed for \*\*RaceDay Part 1\*\*.



The project focuses on:



\* Database design

\* Entity Relationship Diagram (ERD)

\* RESTful API Endpoint Plan

\* SQL database script

\* GitHub repository organisation

\* GitHub Actions Continuous Integration (CI)



\---



\# 2. Part 1 Objectives



The objectives of Part 1 are to:



1\. Design a relational database for the RaceDay system.

2\. Identify the required entities and attributes.

3\. Define primary keys and foreign keys.

4\. Define relationships between database entities.

5\. Create an Entity Relationship Diagram (ERD).

6\. Develop a RESTful API Endpoint Plan.

7\. Create and test the RaceDay SQL database.

8\. Organise the project using Git and GitHub.

9\. Configure GitHub Actions to validate the repository structure.

10\. Document the completed work in this README.



\---



\# 3. Repository Structure



The RaceDay repository is organised as follows:



```text

Prog\\\_RaceDay-

│

├── .github/

│   └── workflows/

│       └── ci.yml

│

├── docs/

│   ├── Race day ERD.pdf

│   ├── RaceDay API Endpoint Plan.pdf

│   └── RaceDay\\\_Database.sql

│

├── RaceDay/

│   └── RaceDay.slnx

│

├── .gitignore

│

└── README.md

```



\### Repository Files and Folders



| File/Folder                          | Description                                                              |

| ------------------------------------ | ------------------------------------------------------------------------ |

| `.github/workflows/ci.yml`           | GitHub Actions workflow for validating the required repository structure |

| `docs/`                              | Contains the Part 1 documentation and SQL database script                |

| `docs/Race day ERD.pdf`              | Completed Entity Relationship Diagram                                    |

| `docs/RaceDay API Endpoint Plan.pdf` | Completed RESTful API Endpoint Plan                                      |

| `docs/RaceDay\\\_Database.sql`          | SQL script for the RaceDay database                                      |

| `RaceDay/RaceDay.slnx`               | RaceDay Visual Studio solution                                           |

| `.gitignore`                         | Specifies files and folders that should not be tracked by Git            |

| `README.md`                          | Project documentation                                                    |



\---



\# 4. Database Design



The RaceDay database is designed as a relational database for managing race events and the people involved in those events.



The database consists of the following main entities:



\* USERS

\* ORGANISERS

\* PARTICIPANTS

\* EVENTS

\* CATEGORIES

\* EVENT\_ENROLMENTS

\* RESULTS



Primary keys are used to uniquely identify records, while foreign keys are used to establish relationships between related tables.



\---



\## 4.1 USERS



The `USERS` table stores the main information about users of the RaceDay system.



\### Main attributes



\* `UserID` – Primary Key

\* `FirstName`

\* `LastName`

\* `Email`

\* `Password`

\* `Role`

\* `DateRegistered`



\---



\## 4.2 ORGANISERS



The `ORGANISERS` table stores information about race event organisers.



\### Main attributes



\* `OrganiserID` – Primary Key

\* `UserID` – Foreign Key

\* `OrganisationName`

\* `ContactPhone`

\* `ContactEmail`



The `UserID` links the organiser to the corresponding user account.



\---



\## 4.3 PARTICIPANTS



The `PARTICIPANTS` table stores information about people participating in race events.



\### Main attributes



\* `ParticipantID` – Primary Key

\* `UserID` – Foreign Key

\* `DateOfBirth`

\* `Gender`

\* `EmergencyContact`

\* `MedicalConditions`



The `UserID` links the participant to the corresponding user account.



\---



\## 4.4 EVENTS



The `EVENTS` table stores information about race events.



\### Main attributes



\* `EventID` – Primary Key

\* `OrganiserID` – Foreign Key

\* `EventName`

\* `EventDescription`

\* `EventDate`

\* `RegistrationDeadline`

\* `Location`

\* `Status`

\* `MaxParticipants`



Each event is associated with an organiser.



\---



\## 4.5 CATEGORIES



The `CATEGORIES` table stores the different race categories available within an event.



\### Main attributes



\* `CategoryID` – Primary Key

\* `EventID` – Foreign Key

\* `CategoryName`

\* `Distance`

\* `EntryFee`

\* `AgeGroup`

\* `GenderRestriction`



Each category is associated with an event.



\---



\## 4.6 EVENT\_ENROLMENTS



The `EVENT\\\_ENROLMENTS` table records participant enrolments in race events and categories.



The table connects participants with the relevant event and category.



\### Main attribute



\* `EnrolmentID` – Primary Key



The table also contains foreign keys that establish relationships with the participant, category and event records.



\---



\## 4.7 RESULTS



The `RESULTS` table stores race results associated with participant enrolments.



\### Main information includes



\* Finish time

\* Finishing position

\* Disqualification status

\* Related enrolment



The results are connected to the corresponding event enrolment.



\---



\# 5. Entity Relationship Diagram



The RaceDay Entity Relationship Diagram represents the database structure.



The ERD shows:



\* Entities

\* Attributes

\* Primary keys

\* Foreign keys

\* Relationships

\* Relationships between the database tables



The completed ERD is available in the `docs` folder.



\### ERD Document



\[View the RaceDay ERD](docs/Race%20day%20ERD.pdf)



```



\---



\# 6. SQL Database Script



The RaceDay SQL database script is stored in:



```text

docs/RaceDay\\\_Database.sql

```



The SQL script contains the commands required to create and populate the RaceDay database.



The database was created and tested using \*\*SQL Server Management Studio (SSMS)\*\*.



\### Database Script



\[View the RaceDay SQL Database Script](docs/RaceDay\_Database.sql)



\---



\# 7. Database Testing and Results



The RaceDay database was tested using SQL Server Management Studio.



SQL queries were used to verify that the database tables could be accessed and that data could be retrieved.



Example verification queries include:



```sql

USE RaceDay;

GO



SELECT \\\* FROM USERS;

SELECT \\\* FROM ORGANISERS;

SELECT \\\* FROM PARTICIPANTS;

SELECT \\\* FROM EVENTS;

SELECT \\\* FROM CATEGORIES;

SELECT \\\* FROM EVENT\\\_ENROLMENTS;

SELECT \\\* FROM RESULTS;

```



These queries were used to verify the contents of the RaceDay database tables.



\## SQL Database Results Screenshot



The screenshot below will show the successful SQL queries and their returned results in SQL Server Management Studio.



```text

<img width="792" height="606" alt="image" src="https://github.com/user-attachments/assets/5d5c271c-59af-4857-b58d-00a6cc0b0b18" />


```



\---



\# 8. RESTful API Endpoint Plan



The RaceDay RESTful API Endpoint Plan provides the design for the API required by the system.



The endpoint plan is based on the RaceDay database entities and relationships.



The plan identifies:



\* HTTP methods

\* API endpoints

\* Purpose of each endpoint

\* User roles

\* Request information

\* Response information

\* HTTP status codes



The API Endpoint Plan covers the main RaceDay resources, including:



\* Users

\* Organisers

\* Participants

\* Events

\* Categories

\* Event Enrolments

\* Results



\### API Endpoint Plan



\[View the RaceDay API Endpoint Plan](docs/RaceDay%20API%20Endpoint%20Plan.pdf)



\---



\# 9. API Endpoint Design



The API Endpoint Plan defines endpoints for the main RaceDay resources.



Examples of the planned endpoints include:



\### Users



```text

GET    /api/users/{id}

PUT    /api/users/{id}

GET    /api/users/me

```



\### Organisers



```text

GET    /api/organisers/{id}

PUT    /api/organisers/{id}

```



\### Participants



```text

GET    /api/participants/{id}

PUT    /api/participants/{id}

```



\### Events



```text

GET     /api/events

GET     /api/events/{id}

POST    /api/events

PUT     /api/events/{id}

DELETE  /api/events/{id}

GET     /api/events/{id}/enrolments

```



\### Categories



```text

GET     /api/categories

GET     /api/categories/{id}

POST    /api/categories

PUT     /api/categories/{id}

DELETE  /api/categories/{id}

```



\### Event Enrolments



```text

POST    /api/enrolments

GET     /api/enrolments/{id}

GET     /api/participants/{id}/enrolments

PUT     /api/enrolments/{id}

DELETE  /api/enrolments/{id}

```



\### Results



```text

GET     /api/results/{id}

GET     /api/events/{id}/results

GET     /api/participants/{id}/results

GET     /api/categories/{id}/results

POST    /api/results

PUT     /api/results/{id}

DELETE  /api/results/{id}

```



The complete endpoint specifications are provided in the \*\*RaceDay API Endpoint Plan PDF\*\*.



\---



\# 10. User Roles



The RaceDay database includes a `Role` attribute in the `USERS` table.



The system identifies different types of users who interact with the RaceDay system.



Examples include:



\* Participant

\* Organiser

\* Administrator



Different roles are associated with different responsibilities within the system.



| Action              | Participant | Organiser | Administrator |

| ------------------- | ----------: | --------: | ------------: |

| View events         |         Yes |       Yes |           Yes |

| Enrol in an event   |         Yes |        No |           Yes |

| Create events       |          No |       Yes |           Yes |

| Manage events       |          No |       Yes |           Yes |

| Manage race results |          No |       Yes |           Yes |

| Manage users        |          No |        No |           Yes |



\---



\# 11. Git and GitHub



Git is used for version control of the RaceDay project.



The project repository is hosted on GitHub.



Git is used to:



\* Track project changes

\* Store project files

\* Manage versions

\* Maintain the project history

\* Publish the project to GitHub



\### GitHub Repository



\[Open the RaceDay GitHub Repository](https://github.com/Molobane28/Prog\_RaceDay-)



\---



\# 12. Continuous Integration – GitHub Actions



GitHub Actions is used to validate the RaceDay repository structure.



The workflow is located at:



```text

.github/workflows/ci.yml

```



The workflow checks that the required `docs` folder exists and contains the required Part 1 files.



The workflow checks for:



```text

docs/

├── Race day ERD.pdf

├── RaceDay API Endpoint Plan.pdf

└── RaceDay\\\_Database.sql

```



If the `docs` folder or any required file is missing, the workflow fails.



If all required files are found, the workflow completes successfully.



\---



\# 13. CI Workflow Validation



The GitHub Actions workflow was pushed to the GitHub repository and successfully executed.



The successful workflow run is represented by a green checkmark in GitHub Actions.



The workflow verifies:



```text

✓ docs folder found

✓ Race day ERD.pdf found

✓ RaceDay API Endpoint Plan.pdf found

✓ RaceDay\\\_Database.sql found

✓ Repository structure is valid

✓ All required Part 1 files found

✓ CI CHECK PASSED

```



\## Successful CI Workflow Screenshot



\*\*The screenshot below shows the successful GitHub Actions workflow with the green checkmark.\*\*



<img width="1027" height="193" alt="image" src="https://github.com/user-attachments/assets/a7f10c07-2165-4fa8-9b39-ae78d0ff1d44" />




```



\---



\# 14. YouTube Demonstration



A YouTube video demonstrating the RaceDay Part 1 work is provided below.



\### YouTube Link



```text

\\\[PASTE YOUR YOUTUBE LINK HERE]

```



The video link can demonstrate the relevant Part 1 work, including:



\* Database design

\* ERD

\* API Endpoint Plan

\* SQL database testing

\* GitHub repository

\* GitHub Actions CI workflow



\---



\# 15. Part 1 Deliverables



The following Part 1 deliverables are included in the repository:



| Requirement             | Location                              | Status         |

| ----------------------- | ------------------------------------- | -------------- |

| README                  | `/README.md`                          | Complete       |

| ERD                     | `/docs/Race day ERD.pdf`              | Complete       |

| API Endpoint Plan       | `/docs/RaceDay API Endpoint Plan.pdf` | Complete       |

| Database SQL Script     | `/docs/RaceDay\\\_Database.sql`          | Complete       |

| GitHub Repository       | GitHub                                | Complete       |

| GitHub Actions Workflow | `/.github/workflows/ci.yml`           | Tested         |

| CI Success Screenshot   | README                                | To be inserted |

| SQL Results Screenshot  | README                                | To be inserted |

| YouTube Link            | README                                | To be inserted |



\---



\# 16. Project Links



\### GitHub



\[RaceDay GitHub Repository](https://github.com/Molobane28/Prog\_RaceDay-)



\### ERD



\[RaceDay ERD](docs/Race%20day%20ERD.pdf)



\### API Endpoint Plan



\[RaceDay API Endpoint Plan](docs/RaceDay%20API%20Endpoint%20Plan.pdf)



\### Database Script



\[RaceDay Database SQL Script](docs/RaceDay\_Database.sql)



\### YouTube



\*\*YouTube demonstration:\*\* `\\\[PASTE YOUR YOUTUBE LINK HERE]`



\---



\# 17. Conclusion



The RaceDay Part 1 project establishes the required database design, system documentation, API endpoint design, repository structure and continuous integration workflow.



The completed Part 1 work includes:



\* A relational database design

\* An Entity Relationship Diagram

\* A tested SQL database script

\* A RESTful API Endpoint Plan

\* A structured GitHub repository

\* A GitHub Actions workflow for repository validation

\* Successful CI validation



The repository contains the required documentation and supporting files for the RaceDay Part 1 submission.



\---



\## Author



\*\*Molobane Ramakgolo\*\*



IIE Diploma in Software Development

