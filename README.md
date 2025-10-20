# Dewa Front Flutter - Siswa CRUD Application

This repository contains a full-stack application for managing Siswa (Student) data.

## Backend (Java Spring Boot)

The backend is a Spring Boot REST API that provides CRUD operations for student management.

### Features
- Create, Read, Update, and Delete student records
- Search students by ID or NIM (Student ID Number)
- Validation for unique NIM
- H2 in-memory database for development
- MySQL support for production

### Prerequisites
- Java 17 or higher
- Maven 3.6 or higher

### Running the Backend

1. Navigate to the backend directory:
```bash
cd backend
```

2. Compile and run using Maven:
```bash
mvn clean install
mvn spring-boot:run
```

The backend will start on `http://localhost:8080`

### API Endpoints

- `GET /api/siswa` - Get all students
- `GET /api/siswa/{id}` - Get student by ID
- `GET /api/siswa/nim/{nim}` - Get student by NIM
- `POST /api/siswa` - Create new student
- `PUT /api/siswa/{id}` - Update student by ID
- `PUT /api/siswa/nim/{nim}` - Update student by NIM
- `DELETE /api/siswa/{id}` - Delete student by ID
- `DELETE /api/siswa/nim/{nim}` - Delete student by NIM

### Student Model

```json
{
  "nim": "123456",
  "nama": "John Doe",
  "jurusan": "Teknik Informatika",
  "alamat": "Jl. Example No. 123",
  "email": "john@example.com",
  "noTelp": "081234567890"
}
```

### Database Access

H2 Console is available at: `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:mem:siswadb`
- Username: `sa`
- Password: (leave empty)

## Frontend

Coming soon - Flutter frontend application.

## Key Changes

This project resolves the following issues from the original setup:
- ✅ Added `getNim()` method to the Siswa entity class
- ✅ Properly implemented SiswaService with all necessary methods using `getNim()`
- ✅ Created complete CRUD operations
- ✅ Added proper error handling and validation
