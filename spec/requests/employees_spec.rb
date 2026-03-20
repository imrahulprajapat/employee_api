RSpec.describe "Employees API", type: :request do
  it "creates an employee" do
    post "/employees", params: {
      employee: {
        full_name: "Rahul",
        job_title: "Dev",
        country: "India",
        salary: 1000
      }
    }

    expect(response).to have_http_status(:created)
  end

  it "calculates net salary for India" do
    emp = Employee.create!(full_name: "A", job_title: "Dev", country: "India", salary: 1000)

    get "/employees/#{emp.id}/salary"

    json = JSON.parse(response.body)

    expect(response).to have_http_status(:ok)
    expect(json["net_salary"]).to eq(900)
  end

  it "returns salary stats for country" do
    Employee.create!(full_name: "A", job_title: "Dev", country: "India", salary: 1000)
    Employee.create!(full_name: "B", job_title: "Dev", country: "India", salary: 2000)

    get "/employees/country_metrics?country=India"

    json = JSON.parse(response.body)

    expect(json["min"]).to eq(1000.0)
    expect(json["max"]).to eq(2000)
    expect(json["avg"]).to eq(1500)
  end

  it "returns avg salary for job title" do
    Employee.create!(full_name: "A", job_title: "Dev", country: "India", salary: 1000)
    Employee.create!(full_name: "B", job_title: "Dev", country: "US", salary: 2000)

    get "/employees/job_metrics?job_title=Dev"

    json = JSON.parse(response.body)

    expect(json["avg"]).to eq(1500.0)
  end
end
