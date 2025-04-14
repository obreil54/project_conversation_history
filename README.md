# Project Conversation History

This application allows users to track project status changes and maintain a conversation history for each project. It was created as part of a technical assessment.

## Features

- User authentication (sign up, sign in, password reset)
- Project listing with status indicators
- Project detail view with:
  - Status updates via dropdown
  - Real-time conversation history
  - Ability to add comments
- Real-time updates across all connected users via ActionCable

## Technology Stack

- Ruby 3.4.2
- Rails 8.0.2
- PostgreSQL database
- TailwindCSS for styling
- Hotwire (Turbo + Stimulus) for real-time updates
- SolidCable for WebSocket communication

## Setup Instructions

### Prerequisites

- Ruby 3.4.2
- PostgreSQL
- Node.js and Yarn (for TailwindCSS)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/project_conversation_history.git
   cd project_conversation_history
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Setup the database:
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

4. Start the Rails server:
   ```bash
   bin/dev
   ```

5. Open your browser and navigate to `http://localhost:3000`

## Usage

1. Register a new account or sign in with an existing one.
2. Browse the list of pre-seeded projects on the homepage.
3. Click on a project to view its details.
4. Change the project status using the dropdown menu.
5. Add comments in the conversation history section.
6. All status changes and comments appear in real-time for all connected users.

## Design Decisions and FAQ

During development, I considered the following questions:

**Q: Should the projects be pre-seeded or should the users also be able to add new project?**  
A: For this version, the projects are pre-seeded with 5 sample projects. The focus is on the conversation history and status update features.

**Q: Should there be real-time updates on the project conversation history pages?**  
A: Yes, both status changes and comments update in real-time for all connected users.

**Q: What statuses are valid for the project?**  
A: The available statuses are: "Not Started", "In Progress", "On Hold", "Completed" and "Cancelled". A project can transition to any status at any time.

**Q: What about permissions?**  
A: For v1, any logged-in user can comment and update the status of any project.

**Q: Should users be able to delete or edit their comments?**  
A: In this first version, comments cannot be edited or deleted once posted.

**Q: How should the conversation history be displayed?**  
A: The conversation history displays comments and status changes in chronological order, with the most recent activity at the top.

**Q: What about testing?**  
A: Don't worry about testing for this assessment

## Code Structure

- `Project` model:
  - Contains project details (name, description, status)
  - Has an enum for the available statuses
  - Contains logic for status change tracking

- `Activity` model:
  - Polymorphic model that tracks both comments and status changes
  - Uses ActionCable to broadcast changes in real-time

- `User` model:
  - Handles authentication with has_secure_password
  - Associates users with their comments and status changes

- Controllers:
  - `ProjectsController`: Handles project listing and showing
  - `CommentsController`: Processes new comments
  - Turbo Streams are used for real-time updates
