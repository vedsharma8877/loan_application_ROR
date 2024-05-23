## Easy Loan Solutions

### Overview

Easy Loan Solutions is a comprehensive loan management platform designed to streamline the loan application process for users and administrators. Built using the Ruby on Rails framework and styled with TailwindCSS, the application ensures a user-friendly and responsive interface. Robust authentication and authorization mechanisms are implemented using Devise and Rolify, while code quality and testing are maintained with RuboCop, RSpec, and SimpleCov. The application is seamlessly deployed on Render for reliable performance.

### User Roles

#### Normal User
- **Sign Up & Sign In**: Users must register an account to apply for loans. They can log in securely using their credentials.
- **Password Management**: Users can reset and change their passwords as needed.
- **Loan Applications**: Users can view their own loan applications, track their status, and manage their loan-related information.

#### Admin
- **Admin Creation**: Admin accounts are created through the backend only, ensuring restricted access and higher security.
- **Loan Management**: Admins can apply for loans themselves and view their own applications. Additionally, they can access and manage loan applications from all users.
- **User Management**: Admins have the authority to view, delete, and manage user accounts. They can export a list of users for reporting and analysis.
- **Loan Application Management**: Admins can view, delete, and manage loan applications from all users, ensuring comprehensive oversight of the loan process.

### Key Features

- **Authentication & Authorization**: Implemented using Devise for secure user authentication and Rolify for role-based access control.
- **Responsive Design**: TailwindCSS is utilized for creating a responsive and modern user interface.
- **Code Quality & Testing**: RuboCop is employed to maintain Ruby code style guide adherence. RSpec is used for writing robust test cases, and SimpleCov ensures code coverage reporting.
- **Deployment**: The application is deployed on Render, offering reliable and scalable hosting.

### Development Tools & Technologies

- **Ruby on Rails**: Backend framework for building the application.
- **TailwindCSS**: Utility-first CSS framework for styling the UI.
- **Devise**: Authentication solution for Rails applications.
- **Rolify**: Role management library for handling user roles and permissions.
- **RuboCop**: Code analysis tool enforcing Ruby style guide.
- **RSpec**: Testing framework for writing and running tests.
- **SimpleCov**: Code coverage analysis tool.
- **Render**: Platform for deploying and hosting the application.

### Running the Application

- **Ruby Version**: Ensure that Ruby 3.1.0 is installed.
- **Starting the Application**: Run `bin/dev` or `rails s` from the root directory to start the application.

### Live Link

Below is the live link for the site:

[Live Link](https://loan-application-ror.onrender.com/)

