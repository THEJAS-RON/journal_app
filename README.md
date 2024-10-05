# Journal Management App

This is a simple Journal Management App built with Ruby on Rails. Users can create, edit, delete, and view journal entries. Additionally, journal entries can be shared publicly with a unique link.

## Features

- User Authentication (using Devise)
- Create, Edit, and Delete Journal Entries
- Attach files to journal entries
- Share journal entries publicly with a generated public link
- Responsive design using TailwindCSS

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- Ruby (version 3.0 or higher recommended)
- Rails (version 6.0 or higher recommended)
- Bundler
- SQLite3 for local development
- PostgreSQL for production deployment

### Setup Locally

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/journal-management-app.git
   cd journal-management-app
   ```
    ```bash
    bundle install
    ```
    ```bash
    rails db:create
    rails db:migrate
    ```

    ```bash
    ruby bin/rails server
    ```