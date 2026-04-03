# EECE430 Assignment 4 - Django CRUD Project

This project is a complete Django CRUD application for managing a **Volley Player List**.

## Features
- Add a player
- View all players
- Update player information
- Delete a player
- Frontend and backend implemented with Django

## Project Structure
- `players/models.py` → database model
- `players/forms.py` → Django form
- `players/views.py` → CRUD logic
- `players/urls.py` → routes
- `players/templates/players/` → frontend pages

## How to Run
1. Open terminal in the project folder.
2. Create a virtual environment:
   - Windows: `python -m venv venv`
   - Mac/Linux: `python3 -m venv venv`
3. Activate the environment:
   - Windows: `venv\\Scripts\\activate`
   - Mac/Linux: `source venv/bin/activate`
4. Install dependencies:
   - `pip install -r requirements.txt`
5. Run migrations:
   - `python manage.py migrate`
6. Start the server:
   - `python manage.py runserver`
7. Open the browser at:
   - `http://127.0.0.1:8000/`

## Notes
- The database used is SQLite.
- You can optionally create an admin user with:
  - `python manage.py createsuperuser`
