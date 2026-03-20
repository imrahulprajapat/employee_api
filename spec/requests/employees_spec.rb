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
    expect(json["net_salary"]).to eq(900)
  end
end
