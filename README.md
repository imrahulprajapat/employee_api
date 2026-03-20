# README

### API Endpoints
- Employee CRUD
  - Create Employee

```POST /employees```

Request Body

```{
  "employee": {
    "full_name": "Rahul Prajapat",
    "job_title": "Software Engineer",
    "country": "India",
    "salary": 1000
  }
}
```

```Response (201 Created)```

```{
  "id": 1,
  "full_name": "Rahul Prajapat",
  "job_title": "Software Engineer",
  "country": "India",
  "salary": "1000.0"
}
```
   - Get All Employees

  ```GET /employees```

   - Get Employee by ID

```GET /employees/:id```

    - Update Employee

```PATCH /employees/:id```

    - Delete Employee

```DELETE /employees/:id```

#### Salary Calculation
  - Calculate Net Salary

```GET /employees/:id/salary```

**Response**

```{
  "gross_salary": 1000.0,
  "deduction": 100.0,
  "net_salary": 900.0
}
```
  - Deduction Rules
    - Country	Deduction
      India	10% TDS
      United States	12% TDS
      Others	0%
  - Salary Metrics

**Country Salary Metrics**

```GET /employees/country_metrics?country=India```

**Response**

```{
  "min": 1000.0,
  "max": 2000.0,
  "avg": 1500.0
}
```

**Job Title Salary Metrics**

```GET /employees/job_metrics?job_title=Software Engineer```

**Response**

```{
  "avg": 1500.0
}
```

### Run tests using:

```bundle exec rspec
```
### Notes

**All responses are in JSON format**
Salary calculations are handled via a service object (SalaryCalculator)

Metrics endpoints safely handle empty datasets
