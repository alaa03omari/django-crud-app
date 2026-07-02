# django-crud-app

A simple yet robust Django web application demonstrating Create, Read, Update, and Delete (CRUD) operations, specifically for managing tasks. It's containerized with Docker and features automated deployment using GitHub Actions, providing a streamlined development and deployment workflow.

## Table of Contents

-   [Key Features & Benefits](#key-features--benefits)
-   [Technologies Used](#technologies-used)
-   [Prerequisites & Dependencies](#prerequisites--dependencies)
-   [Installation & Setup Instructions](#installation--setup-instructions)
    -   [Using Docker Compose (Recommended)](#using-docker-compose-recommended)
    -   [Local Setup (Alternative)](#local-setup-alternative)
-   [Usage Examples](#usage-examples)
-   [Configuration Options](#configuration-options)
-   [Project Structure](#project-structure)
-   [Deployment](#deployment)
-   [Contributing Guidelines](#contributing-guidelines)
-   [License Information](#license-information)
-   [Acknowledgments](#acknowledgments)

## Key Features & Benefits

*   **CRUD Operations**: Full functionality for managing tasks (create, view, edit, delete) through an intuitive web interface.
*   **Django Framework**: Leverages Django's robust Model-View-Template (MVT) architecture for rapid development, clean code, and built-in security features.
*   **Containerized Environment**: Utilizes Docker for consistent development and production environments, ensuring portability and ease of deployment.
*   **Automated Deployment**: Features a CI/CD pipeline with GitHub Actions, enabling seamless and automated deployments upon code changes.
*   **Scalable Architecture**: Built with best practices that allow for future scaling, feature additions, and integration with other services.

## Technologies Used

The `django-crud-app` project is built using a modern stack of technologies:

### Languages

*   Python (3.12)

### Frameworks

*   Django (6.0.6)

### Tools & Technologies

*   Docker
*   GitHub Actions
*   (Potential for MySQL/MariaDB database integration based on `Dockerfile` dependencies)

## Prerequisites & Dependencies

Before you begin, ensure you have the following installed:

*   **Git**: For cloning the repository.
*   **Docker & Docker Compose**: For running the application in a containerized environment (recommended).
    *   [Install Docker Engine](https://docs.docker.com/engine/install/)
    *   [Install Docker Compose](https://docs.docker.com/compose/install/)

## Installation & Setup Instructions

Choose your preferred method to set up and run the project.

### Using Docker Compose (Recommended)

This method simplifies the setup process by containerizing the application and its dependencies.

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/alaa03omari/django-crud-app.git
    cd django-crud-app
    ```

2.  **Build and run Docker services**:
    ```bash
    docker-compose build
    docker-compose up -d
    ```
    This command builds the Docker image for your Django app and starts the containers in detached mode.

3.  **Perform database migrations**:
    ```bash
    docker-compose exec web python manage.py migrate
    ```
    This applies the necessary database schema changes.

4.  **Create a superuser (optional, for accessing Django Admin)**:
    ```bash
    docker-compose exec web python manage.py createsuperuser
    ```
    Follow the prompts to create an admin user.

5.  **Access the application**:
    Open your web browser and navigate to:
    ```
    http://localhost:8000
    ```
    You should see the Django CRUD application running.

### Local Setup (Alternative)

If you prefer to run the application directly on your machine without Docker:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/alaa03omari/django-crud-app.git
    cd django-crud-app
    ```

2.  **Create and activate a Python virtual environment**:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  **Install Python dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4.  **Perform database migrations**:
    ```bash
    python manage.py migrate
    ```

5.  **Create a superuser (optional)**:
    ```bash
    python manage.py createsuperuser
    ```

6.  **Run the Django development server**:
    ```bash
    python manage.py runserver
    ```

7.  **Access the application**:
    Open your web browser and navigate to:
    ```
    http://localhost:8000
    ```

## Usage Examples

Once the server is running, you can interact with the application:

*   **Homepage (`http://localhost:8000`)**: Displays a list of existing tasks.
*   **Creating a Task**: Look for a form or button to "Add New Task". Fill in the details and submit.
*   **Viewing Task Details**: Click on a task title or a "View" button to see its full details.
*   **Editing a Task**: Find an "Edit" button next to a task. This will typically take you to a form pre-filled with the task's current data.
*   **Deleting a Task**: Locate a "Delete" button next to a task. Confirm the deletion if prompted.
*   **Django Admin (`http://localhost:8000/admin/`)**: If you created a superuser, you can log in here to manage tasks and other models directly through Django's administrative interface.

## Configuration Options

Key configuration settings can be found and modified in `crudproject/settings.py` and potentially through environment variables for production deployments.

*   **`SECRET_KEY`**: Essential for Django's security. In production, this should be read from an environment variable.
*   **`DEBUG`**: Set to `True` for development, `False` for production. When `False`, you must configure `ALLOWED_HOSTS`.
*   **`ALLOWED_HOSTS`**: A list of strings representing the host/domain names that this Django site can serve. Must be set in production when `DEBUG` is `False`.
*   **`DATABASES`**: By default, Django uses SQLite. To connect to a different database (e.g., MySQL, PostgreSQL), update this dictionary with your database credentials. If using Docker Compose, you would typically add a database service to `docker-compose.yaml` and configure environment variables for the Django application container to connect to it.
*   **Environment Variables**: For sensitive data like `SECRET_KEY` or database credentials, it's highly recommended to use environment variables. With Docker Compose, you can define these in a `.env` file or directly in `docker-compose.yaml`.

## Project Structure

The repository follows a standard Django project layout with Dockerization and CI/CD elements:

```
├── .github/                       # GitHub Actions workflows
│   └── workflows/
│       └── deploy.yml             # CI/CD pipeline for deployment
├── .gitignore                     # Specifies intentionally untracked files to ignore
├── Dockerfile                     # Defines the Docker image for the Django application
├── crudproject/                   # Main Django project configuration
│   ├── __init__.py
│   ├── asgi.py                    # ASGI configuration for async web servers
│   ├── settings.py                # Main Django settings
│   ├── urls.py                    # Main URL dispatcher
│   └── wsgi.py                    # WSGI configuration for web servers
├── docker-compose.yaml            # Orchestrates multi-container Docker applications (e.g., app + database)
├── manage.py                      # Django's command-line utility
├── requirements.txt               # Python dependencies for the project
└── tasks/                         # Django application for managing tasks
    ├── __init__.py
    ├── admin.py                   # Django Admin configurations for the 'tasks' app
    ├── apps.py                    # App configuration
    └── migrations/                # Database migration files
        └── 0001_initial.py        # Initial migration for the 'tasks' app models
```

## Deployment

The project includes a GitHub Actions workflow (`.github/workflows/deploy.yml`) which is designed for continuous integration and continuous deployment (CI/CD). This pipeline automates the build, test, and deployment process, ensuring that changes pushed to the repository are automatically deployed to a target environment.

**Note**: The specific deployment targets and steps within `deploy.yml` would need to be configured based on your chosen hosting provider (e.g., Heroku, AWS, Azure, Google Cloud, a private server).

## Contributing Guidelines

Contributions are welcome! If you'd like to contribute, please follow these steps:

1.  **Fork** the repository.
2.  **Create a new branch** for your feature or bug fix: `git checkout -b feature/your-feature-name` or `git checkout -b bugfix/issue-description`.
3.  **Make your changes**, ensuring they adhere to the project's coding style (PEP 8 for Python).
4.  **Commit your changes** with clear and concise commit messages.
5.  **Push your branch** to your forked repository.
6.  **Open a Pull Request** to the `main` branch of the original repository, describing your changes and their purpose.

## License Information

This project is not currently licensed. Please contact the owner (`alaa03omari`) for licensing inquiries.

## Acknowledgments

*   None at this time.
