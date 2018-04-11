require "rails_helper"

RSpec.describe "Areas API", type: :request do
  let!(:areas) { create_list(:area, 10) }
  let(:area_id) { areas.first.id }

  # Test suite for GET /areas
  describe "GET /areas" do
    # hacer un HTTP get request antes de cada prueba
    before { get "/areas" }

    it "returns areas" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /areas/:id
  describe "GET /areas/:id" do
    before { get "/areas/#{area_id}" }

    context "when the record exists" do
      it "returns the area" do
        expect(json).not_to be_empty
        expect(json["id"]).to eq(area_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:area_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find area/)
      end
    end
  end

  # Test suite for POST /areas
  describe "POST /areas" do
    # valid payload
    let(:valid_attributes) { {name: "TTHH", result: "1"} }

    context "when the request is valid" do
      before { post "/areas", params: valid_attributes }

      it "creates a area" do
        expect(json["name"]).to eq("TTHH")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/areas", params: {name: "TIC"} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Result can't be blank/)
      end
    end
  end

  # Test suite for PUT /areas/:id
  describe "PUT /areas/:id" do
    let(:valid_attributes) { {name: "Logistic"} }

    context "when the record exists" do
      before { put "/areas/#{area_id}", params: valid_attributes }

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /areas/:id
  describe "DELETE /areas/:id" do
    before { delete "/areas/#{area_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
