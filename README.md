# Armory

An app designed for police and military inventory management. Requires login to access database usage. User will be redirected to the home page if trying to access unauthorised data (accessing database items belonging to a different user). Upon creation and editing of database items, all compatible items and their manufacturers will be auto-associated if the relevant fields are selected.

This app was created in Ruby on Rails 5.2.8.1 and was hosted on [fly.io](https://fly.io/) but has since been removed due to issues with deploying seed data on that particular platform. Current functionality exists through localhost.

This app was designed heavily with the [Tarkov API](https://tarkov.dev/api/) in mind.

## Planned features/additions:

- "Forgot password" link for login page
- Search feature
- Addition of "Calibre" model to better handle associations
- Admin users
- Ability to add and edit "Manufacturers" database items via admin profiles
- Design rework and more CSS styling via Bootstrap (need to read more documentation)
- Display of information from API query (data currently only displays in console, and only for the Ammo model)

## Database system used:

- PostgreSQL

## APIs/Gems used:

- **[Tarkov API](https://tarkov.dev/api/)** - For auto information display of database items. To be implemented on the front-end (API communication is not the best, added only as an experiment for API usage)
- **Cloudinary** - Image uploads (implemented only for 1 model, for practice)
- **Bcrypt** - User password hashing
- **Bootstrap** - Minor CSS styling