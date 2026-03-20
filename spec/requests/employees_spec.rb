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
end
