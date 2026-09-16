# LiftTrace 🏋️‍♂️

> A full-stack strength training and progressive overload analytics platform designed to track performance metrics, visualize strength adaptation, and deliver exercise technique resources.

---

## 📌 Product Vision

The primary challenge in resistance training and muscle hypertrophy is sustaining and accurately measuring **progressive overload** across time. **LiftTrace** provides a centralized system for lifters and coaches to log training sessions, analyze objective performance trends, and master exercise mechanics.

### Core Capabilities
* **Granular Overload Tracking**: Monitors historical set-level performance to detect progression across multiple vectors:
    * *Load Progression*: Increased weight lifted within targeted rep ranges across chronological sessions.
    * *Volume Progression*: Additional repetitions achieved at identical loads over time.
    * *Tonnage Accumulation*: Cumulative workload increases across training blocks.
* **Temporal Analytics & Progression Insights**: Time-series evaluation of strength curves, estimated 1-Rep Max (1RM) trends, and weekly muscle volume distribution.
* **Movement & Technique Library**: Comprehensive catalog of resistance movements categorized by target muscle groups, complete with form cues and video demonstrations.
* **User Isolation & Security**: Authentication and authorization layer ensuring private session logging, personalized routines, and isolated historical metrics.
* **In-Session Historical Benchmarking**: Instant recall of previous session metrics (weight, sets, reps) for any chosen exercise, giving the user their exact historical target to beat in the current workout.

---

## 💡 Key Engineering Highlights

* **Domain-Driven Design (DDD) Principles**: Strong encapsulation across core models (`Workout`, `Exercise`, `WorkoutSet`) separating pure domain calculations from database entities.
* **Algorithmic Analytics**: Progression tracking and personal records (PR) computed using native Java Collections (`PriorityQueue` for top-k lifts, `TreeMap` for chronological window analyses).
* **Defensive Programming & Validation**: Server-side request boundary validations (`@Valid`) preventing corrupt training metrics (negative loads, zero reps, invalid date bounds).
* **Containerized Environment**: One-command reproducible infrastructure via Docker Compose for local database persistence and runtime isolation.

---

## 🛠️ Tech Stack & Architecture

LiftTrace is engineered using a containerized, decoupled multi-tier architecture to ensure modularity, scalability, and reproducibility:

* **Backend Core & REST API**: Java 21, Spring Boot (Spring Web, Spring Data JPA, Spring Security).
* **Database & Persistence**: MySQL 8.x (Normalized relational schema, foreign key integrity, indexed time-series queries).
* **Containerization & DevOps**: Docker & Docker Compose (Multi-container orchestration for the API and isolated MySQL service).
* **Testing & Integrity**: JUnit 5, Mockito (Unit testing for overload algorithms and integration testing for persistence layers).
* **API Documentation & Interactive Client**: OpenAPI / Swagger UI & Postman Collections (Interactive execution for the MVP).
* **Frontend Interface (Post-MVP)**: React 18, TypeScript, Tailwind CSS, Recharts (Interactive visualization dashboard).

---

## 🏗️ Architecture & Domain Hierarchy

The platform's business logic is modeled in Java, enforcing strict domain boundaries, temporal consistency, and encapsulation:

```
[ User ] 1 ──* [ Workout ] 1 ──* [ Exercise ] 1 ──* [ WorkoutSet ]
```

* **`User`**: Account owner holding personal records, custom routines, and historic training logs.
* **`Workout`**: A concrete training session bound to a temporal record (`LocalDate`), aggregating total session tonnage and serving as the historical baseline for progression queries.
* **`Exercise`**: A distinct movement instance referencing the global exercise catalog, holding an ordered list of sets.
* **`WorkoutSet`**: The atomic execution unit tracking load (*weight*) and repetitions (*reps*), calculating set tonnage: $\text{Volume} = \text{weight} \times \text{reps}$.

---

## 📡 MVP API Specification (Target Endpoints)

| Method | Endpoint                                             | Description |
| :--- |:-----------------------------------------------------| :--- |
| `POST` | `/api/v1/workouts`                                   | Log a completed workout session with exercises and sets. |
| `GET` | `/api/v1/workouts/history`                           | Retrieve chronological training sessions within a date range. |
| `GET` | `/api/v1/workouts/previous-performance/{exerciseId}` | Fetch most recent performance metrics for a specific exercise baseline. |
| `GET` | `/api/v1/analytics/progression/{exerciseId}`         | Evaluate overload metrics, 1RM progression, and volume delta. |
| `GET` | `/api/v1/exercises`                                  | List exercise catalog filtered by target muscle group. |

---

## 📐 Domain Metrics & Progression Calculations

To maintain analytical consistency, all performance formulas are formally defined and enforced in domain services:

* **Session & Set Volume**: $\text{Set Volume} = \text{weight} \times \text{reps}$
* **Estimated 1-Rep Max (Epley Formula)**: $\text{e1RM} = \text{weight} \times \left(1 + \frac{\text{reps}}{30}\right) \quad (\text{for } 1 < \text{reps} \le 30)$
* **Progressive Overload Trigger Logic**: A session achieves progressive overload over its baseline if:
    1. $\Delta\text{Load} > 0$ with identical or higher repetitions.
    2. $\Delta\text{Reps} > 0$ at equivalent load.
    3. $\Delta\text{Volume} > 0$ across matching exercise movements.
* **Measurement Standards**:
    * Default weight metric: Pounds (`lbs`) represented as floating decimals (`DECIMAL(5,2)`).
    * Bodyweight movements benchmarked with `weight = 0.0` or positive added resistance.

---

## 🗺️ System Roadmap

### Phase 1: Core Domain Engine *(Completed)*
- [x] Object-Oriented domain hierarchy (`Workout`, `Exercise`, `WorkoutSet`).
- [x] Interactive console driver with Scanner buffer sanitization.
- [x] Production-ready repository structure and version control workflow.

### Phase 2: Relational Persistence & Docker *(Target: Weeks 1–2)*
- [ ] Relational schema in SQL (`users`, `workouts`, `workout_exercises`, `workout_sets`, `exercise_catalog`).
- [ ] Chronological indexing on session dates (`workout_date`) for historical queries.
- [ ] Multi-container environment setup using Docker Compose (MySQL service).
- [ ] Repository integration via Spring Data JPA / JDBC.

### Phase 3: Analytics Core & REST API *(Target: Weeks 3–5 — MVP Milestone)*
- [ ] Progressive overload engine in Java (1RM estimation, top-k PR tracking via `PriorityQueue`).
- [ ] Time-series session comparisons using Java Collections (`TreeMap`, `HashMap`) and Stream API pipelines.
- [ ] REST API endpoints with server-side validation (`@Valid`) and Swagger UI documentation.
- [ ] Comprehensive unit test suite with JUnit 5 & Mockito.

### Phase 4: Web Client & Dynamic Dashboards *(Target: Weeks 6–8+ / Post-MVP)*
- [ ] Single Page Application (SPA) built with React, TypeScript, and Tailwind CSS.
- [ ] Dynamic visualization graphs (tonnage trends, rep-progression matrices via Recharts).
- [ ] Exercise catalog explorer with embedded video demos and muscle group filtering.
- [ ] Multi-stage production containerization with Nginx reverse proxy.

---

## 🚀 Getting Started (Core CLI Engine)

### Prerequisites
* **Java Development Kit (JDK)**: 17 or 21+
* **Git**

### Installation & Execution

1. Clone the repository:
   ```bash
   git clone https://github.com/DerekFarraro/LiftTrace.git
   cd LiftTrace
   ```

2. Compile source files:
   ```bash
   javac src/*.java -d out/
   ```

3. Run the application:
   ```bash
   java -cp out/ Main
   ```

---

## 📄 License
This project is open-source and available under the [MIT License](LICENSE).